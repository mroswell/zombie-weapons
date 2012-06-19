from django.db import models

class HouseholdItem(models.Model):
	title = models.CharField(max_length=200)
	image = models.ImageField(upload_to='householditem_images')		

	def __unicode__(self):
		return self.title	
		
class Weapon(models.Model):
	title = models.CharField(max_length=200)
	image = models.ImageField(upload_to='weapon_images')
	items = models.ManyToManyField(HouseholdItem)

	def __unicode__(self):
		return self.title