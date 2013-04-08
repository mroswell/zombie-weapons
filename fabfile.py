import os

from fabric.api import *
from fabric.contrib.project import rsync_project
from fabric.contrib import files, console
from fabric import utils
from fabric.decorators import hosts

#manually bootstrap database server
#ssh into instance and run the following commands:
# sudo yum -y install mysql-server
# sudo /etc/init.d/mysqld start
# mysql -u root -e 'CREATE DATABASE zombie_weapons CHARACTER SET utf8;'
# mysql -u root -e "CREATE USER 'weapons'@'%' IDENTIFIED BY 'zombie_weapons';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'weapons'@'%'"
# wget https://raw.github.com/jrullmann/zombie-weapons/master/sqlite2mysqldata.sql
# mysql -u root < sqlite2mysqldata.sql

#manully bootstrap web server
# ssh into instance, run sudo nano /etc/sudoers, change 'require tty' to false so this deploy script can use sudo
# update env.hosts in this file
# update zombie_weapons/settings_prod.py with db name
# use this script's bootstrap function to setup everything else
# if the database hasn't been synced yet, use this script's sync_db function

RSYNC_EXCLUDE = (
    '.git',
    '*.pyc',
    '*.db',
    '*.save',
    'local_settings.py',
    'fabfile.py',
    'bootstrap.py',
    'settings_local.py',
    'weapons/migrations',
    'static/CACHE'
)
env.home = '/srv/'
env.project = 'zombie-weapons'

def production():
    """ use production environment on remote host """
    env.user = 'ec2-user'
    env.environment = 'production'
    env.hosts = ['ec2-54-235-14-85.compute-1.amazonaws.com']
    _setup_path()

def _setup_path():
    env.root = os.path.join(env.home, 'www', env.environment)
    env.code_root = os.path.join(env.root, env.project)
    env.settings_path = os.path.join(env.code_root, 'zombie_weapons')
    env.virtualenv_root = os.path.join(env.root, 'env')
    env.apache_conf_root = os.path.join(env.settings_path, 'apache')
    env.settings = '%(project)s.settings_%(environment)s' % env    

def bootstrap():
    """ initialize ec2 environment """
    require('root', provided_by=('production'))

    #install base software
    install_base()

    #create the project directories
    sudo('mkdir -p %(root)s' % env)
    sudo('mkdir -p %s' % os.path.join(env.home, 'www', 'log'))
    sudo('chmod 777 %s' % os.path.join(env.home, 'www'))

    #create a virtualenv for this project
    create_virtualenv()

    #deploy the code base, including the pip requirements file
    deploy()

    #install python modules using the pip requirements file
    update_requirements()

    #put the apache conf file in the appropriate place
    sudo('cp %s /etc/httpd/conf/httpd.conf' % os.path.join(env.apache_conf_root, 'prod.conf'))

    #start apache
    apache_restart()    

def install_base():
    """ install everything we need but can't get through pip """
    require('root', provided_by=('production'))
    sudo("yum install -y httpd")
    sudo("yum install -y mod_wsgi")
    sudo("yum install -y python-setuptools")
    sudo("easy_install pip")
    sudo('easy_install -U distribute')
    sudo("pip install virtualenv")
    sudo('yum -y install gcc')
    sudo('yum -y install python26-devel')
    sudo('yum -y install mysql-devel')
    sudo('yum -y install mysql')
    sudo('pip install mysql-python')    

def create_virtualenv():
    """ create the virtualenv for the project to run in """
    require('virtualenv_root', provided_by=('production'))
    args = '--clear --distribute --no-site-packages'
    sudo('virtualenv %s %s' % (args, env.virtualenv_root))    

def deploy():
    """ push code to ec2.  we're using rsync only files that we're changed will be pushed """
    require('root', provided_by=('production'))
    require('code_root', provided_by=('production'))

    # default rsync options:
    # -pthrvz
    # -p preserve permissions
    # -t preserve times
    # -h output numbers in a human-readable format
    # -r recurse into directories
    # -v increase verbosity
    # -z compress file data during the transfer
    extra_opts = '--omit-dir-times --rsync-path="sudo rsync"'
    rsync_project(
        env.root,
        exclude=RSYNC_EXCLUDE,
        delete=True,
        extra_opts=extra_opts,
    )

    with cd(env.settings_path):
        #rename the prod settings file so that settings.py will load it
        sudo('mv settings_prod.py settings_local.py')

def link_admin_static_files():        
    """ the admin static files 'just work' when using the django web server, but in production the site looks under the static files location.  here we need to sym link the location """
    require('code_root', provided_by=('production'))

    with cd(env.code_root): 
        sudo('ln -s ../../env/lib/python2.6/site-packages/django/contrib/admin/static/ static/admin')   

def update_requirements():
    """ update external dependencies """
    require('code_root', provided_by=('production'))

    #load our virtualenv
    with cd('/srv/www/production/env/bin/'):
        run('source activate')

    with cd(env.code_root):
        sudo('pip install --requirement requirements.txt')

def apache_restart():    
    """ restart Apache on remote host """
    require('root', provided_by=('production'))
    run('sudo /etc/init.d/httpd restart')        

def sync_db():
    """ Runs the django syncdb command from the web server """
    require('root', provided_by=('production'))

    with cd('/srv/www/production/env/bin/'):
        run('source activate')

    with cd(env.code_root):
        run('python manage.py syncdb')
