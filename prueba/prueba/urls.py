# prueba/urls.py

from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('admin/', admin.site.urls),
    path('hello/', include('polls.urls')),  # Esta línea incluye las URLs de la aplicación polls
]
