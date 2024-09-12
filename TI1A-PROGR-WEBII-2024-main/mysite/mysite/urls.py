from django.urls import path
from .views import MiModeloListView, MiModeloDetailView

urlpatterns = [
    path('list/', MiModeloListView.as_view(), name='mimodelo-list'),
    path('<int:pk>/', MiModeloDetailView.as_view(), name='mimodelo-detail'),
]
