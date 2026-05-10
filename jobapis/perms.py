from rest_framework import permissions

from jobapis.models import User, Company, Conversation


class IsOwnerPermission(permissions.IsAuthenticated):
    def has_object_permission(self, request, view, obj):
        return super().has_permission(request, view) and obj.user == request.user


class IsCompanyOwnerPermission(permissions.IsAuthenticated):
    def has_permission(self, request, view):
        company_id = request.data.get("company")

        if not company_id:
            self.message = "You must specify a company"
            return False

        try:
            company = Company.objects.get(id=company_id)
        except:
            self.message = "Company not found"
            return False

        return super().has_permission(request, view) and company.user == request.user


class IsPostingOwnerPermission(permissions.IsAuthenticated):
    def has_object_permission(self, request, view, obj):
        return super().has_object_permission(request, view, obj) and obj.company.user == request.user


class RolePermission(permissions.IsAuthenticated):
    required_role = None

    def has_permission(self, request, view):
        return super().has_permission(request, view) and request.user.user_role == self.required_role


class IsUserInConversation(permissions.IsAuthenticated):
    def has_permission(self, request, view):
        conversation_id = request.query_params.get('conversation_id')

        if not conversation_id:
            return True

        try:
            conversation = Conversation.objects.get(id=conversation_id)
        except Conversation.DoesNotExist:
            return False

        # giả sử conversation có field participants (ManyToMany User)
        return request.user in conversation.participants.all()



class IsCandidatePermission(RolePermission):
    required_role = User.UserRole.CANDIDATE


class IsAdminPermission(RolePermission):
    required_role = User.UserRole.ADMIN


class IsStaffPermission(RolePermission):
    required_role = User.UserRole.STAFF


class IsEmployerPermission(RolePermission):
    required_role = User.UserRole.EMPLOYER
