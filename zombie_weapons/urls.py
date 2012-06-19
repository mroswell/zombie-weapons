from django.conf.urls import patterns, include, url
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'zombie_weapons.views.home', name='home'),
    # url(r'^zombie_weapons/', include('zombie_weapons.foo.urls')),

    url(r'^weapons/$', 'weapons.views.index'),
    url(r'^weapons/search/$', 'weapons.views.search'),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),    
)

urlpatterns += staticfiles_urlpatterns()