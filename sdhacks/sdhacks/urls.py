from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'sdhacks.views.home', name='home'),

   
    url(r'^registration/', include('registration.urls')),

    url(r'^admin/', include(admin.site.urls)),
)
