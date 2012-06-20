import os

current_path = os.getcwd()

# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/media/"
MEDIA_ROOT = os.path.join(current_path, '/weapons/static/images/')

TEMPLATE_DIRS = (
    os.path.join(current_path, 'templates')
)