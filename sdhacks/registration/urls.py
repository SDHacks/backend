

from registration.views import SignupView
from django.conf.urls import patterns, url


urlpatterns = patterns('',

    url(r'^signup/$', SignupView.as_view(), name='signup'),
)
