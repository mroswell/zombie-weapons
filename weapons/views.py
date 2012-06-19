from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils import simplejson
from django.core import serializers
from weapons.models import HouseholdItem, Weapon

def index(request):
	return render_to_response('weapons/index.html', {'householditems': HouseholdItem.objects.all() },  context_instance = RequestContext(request))

def search(request):
	if request.method == 'GET':
		GET = request.GET
		if GET.has_key('query'):
			query = GET['query'].split(",")			
			weapons = Weapon.objects.filter(items__title__in=query).distinct()
 			return HttpResponse(serializers.serialize('json', weapons, fields=('image')), mimetype='application/json')