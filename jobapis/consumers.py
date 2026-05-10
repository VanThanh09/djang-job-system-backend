from channels.generic.websocket import AsyncWebsocketConsumer
import json
from asgiref.sync import sync_to_async, async_to_sync
from channels.layers import get_channel_layer

from .models import Conversation, Message
from django.contrib.auth import get_user_model

User = get_user_model()


class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.user = self.scope["user"]
        self.conversation_id = self.scope['url_route']['kwargs']['conversation_id']
        self.room_group_name = f"chat_{self.conversation_id}"

        if not await self.is_user_in_conversation():
            await self.close()
            return

        # Join room
        await self.channel_layer.group_add(
            self.room_group_name,
            self.channel_name
        )

        await self.accept()

    async def disconnect(self, close_code):
        # Guard: room_group_name chưa được set nếu connect() bị reject sớm
        if hasattr(self, 'room_group_name'):
            await self.channel_layer.group_discard(
                self.room_group_name,
                self.channel_name
            )

    async def receive(self, text_data):
        data = json.loads(text_data)
        message = data["message"]

        msg_obj = await self.save_message(message)

        await self.channel_layer.group_send(
            self.room_group_name,
            {
                "type": "chat_message",
                "message": {
                    "id": msg_obj.id,
                    "content": msg_obj.content,
                    "created_at": msg_obj.created_at.isoformat(),
                    "sender": {
                        "id": self.user.id,
                        "username": self.user.username,
                        "avatar": self.user.avatar.url if self.user.avatar else None
                    }
                }
            }
        )

    async def chat_message(self, event):
        await self.send(text_data=json.dumps(event["message"]))

    @sync_to_async
    def save_message(self, content):
        conversation = Conversation.objects.get(id=self.conversation_id)

        msg = Message.objects.create(
            conversation=conversation,
            sender=self.user,
            content=content
        )

        # update last message
        conversation.last_msg = content
        conversation.save()

        #broadcast sang conversation list
        channel_layer = get_channel_layer()
        participants = conversation.participants.all()

        for user in participants:
            async_to_sync(channel_layer.group_send)(
                f"user_{user.id}_conversations",
                {
                    "type": "conversation_update",
                    "data": {
                        "conversation_id": conversation.id,
                        "last_msg": msg.content,
                        "updated_at": conversation.updated_at.isoformat(),
                        "sender": {
                            "id": self.user.id,
                            "username": self.user.username,
                            "avatar": self.user.avatar.url if self.user.avatar else None
                        }
                    }
                }
            )

        return msg

    @sync_to_async
    def is_user_in_conversation(self):
        return Conversation.objects.filter(
            id=self.conversation_id,
            participants=self.user
        ).exists()


class ConversationConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.user = self.scope["user"]

        if not self.user.is_authenticated:
            await self.close()
            return

        self.group_name = f"user_{self.user.id}_conversations"

        await self.channel_layer.group_add(
            self.group_name,
            self.channel_name
        )

        await self.accept()

    async def disconnect(self, close_code):
        # Guard: group_name chưa được set nếu user chưa authenticated
        if hasattr(self, 'group_name'):
            await self.channel_layer.group_discard(
                self.group_name,
                self.channel_name
            )

    async def conversation_update(self, event):
        await self.send(text_data=json.dumps(event["data"]))