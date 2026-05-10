from rest_framework.pagination import PageNumberPagination


class CompanyPage(PageNumberPagination):
    page_size = 10


class RecommendPage(PageNumberPagination):
    page_size = 9


class PostingPage(PageNumberPagination):
    page_size = 12


class ApplicationPage(PageNumberPagination):
    page_size = 12


class FollowPage(PageNumberPagination):
    page_size = 12


class CandidatePage(PageNumberPagination):
    page_size = 9


class MessagePaginator(PageNumberPagination):
    page_size = 10

