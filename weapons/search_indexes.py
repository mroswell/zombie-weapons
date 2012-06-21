import datetime
from haystack.indexes import *
from haystack import site
from weapons.models import Weapon

class WeaponIndex(SearchIndex):
	text = CharField(document=True, use_template=True)

site.register(Weapon, WeaponIndex)