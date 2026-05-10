"""
ASGI config for job project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.2/howto/deployment/asgi/
"""

import os
import asyncio
import sys
import django

# PHẢI set settings và gọi django.setup() TRƯỚC khi import bất kỳ model/consumer nào
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'job.settings')
django.setup()

if sys.platform == "win32":
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())

# Sau khi django.setup() xong mới được import consumers/models
from django.core.asgi import get_asgi_application
from django.urls import path, re_path
from channels.routing import ProtocolTypeRouter, URLRouter
from jobapis.consumers import ChatConsumer, ConversationConsumer
from jobapis.middleware import OAuth2Middleware

application = ProtocolTypeRouter({
    'http': get_asgi_application(),
    "websocket": OAuth2Middleware(
        URLRouter([
            path("ws/chat/", ChatConsumer.as_asgi()),
            re_path(r'ws/chat/(?P<conversation_id>\d+)/$', ChatConsumer.as_asgi()),
            path("ws/conversations/", ConversationConsumer.as_asgi()),
        ])
    ),
})
