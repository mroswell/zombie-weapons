import os

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'zombie_weapons',                      # Or path to database file if using sqlite3.
        'USER': 'weapons',                      # Not used with sqlite3.
        'PASSWORD': 'zombie_weapons',                  # Not used with sqlite3.
        'HOST': 'ec2-54-224-4-59.compute-1.amazonaws.com',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
    }
}

current_path = '/srv/www/production/zombie-weapons'

# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/media/"
MEDIA_ROOT = os.path.join(current_path, '/weapons/static/images/')

TEMPLATE_DIRS = (
    os.path.join(current_path, 'templates')
)