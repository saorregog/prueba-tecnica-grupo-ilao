from django.contrib import admin
from . import views
from django.urls import include, path
from django.conf import settings


urlpatterns = [
    path('admin/', admin.site.urls),
    path(
        '',
        views.ProductListView.as_view(),
        name='prototype',
    ),
]

if settings.DEBUG and 'django_browser_reload' in settings.INSTALLED_APPS:
        urlpatterns += [path('__reload__/', include('django_browser_reload.urls'))]
