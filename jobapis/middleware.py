from urllib.parse import parse_qs
from channels.db import database_sync_to_async
from django.contrib.auth.models import AnonymousUser
from oauth2_provider.models import AccessToken

class OAuth2Middleware:
    def __init__(self, app):
        self.app = app

    async def __call__(self, scope, receive, send):
        query_string = scope["query_string"].decode()
        params = parse_qs(query_string)

        token = params.get("token")

        if token:
            user = await self.get_user(token[0])
            scope["user"] = user
        else:
            scope["user"] = AnonymousUser()

        return await self.app(scope, receive, send)

    @database_sync_to_async
    def get_user(self, token):
        try:
            access_token = AccessToken.objects.select_related("user").get(token=token)

            # check hết hạn
            if access_token.is_expired():
                return AnonymousUser()

            return access_token.user

        except AccessToken.DoesNotExist:
            return AnonymousUser()