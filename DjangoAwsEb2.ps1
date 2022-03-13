#Configure Django project for EB
#Create requirements.txt file
pip freeze > requirements.txt
#Remove from requirements.txt everything except Django==2.1.1
nano requirements.txt
#Create hidden directory .ebextensions
mkdir .ebextensions
#Create django.config file in .ebextension directory, with the following content:
#option_settings:
#  aws:elasticbeanstalk:container:python:
#    WSGIPath: ebdjango/wsgi.py
nano .ebextensions/django.config
#Deactivate virtual environment 
deactivate
#Install awsebcli
sudo pip3 install awsebcli
#Initialize/create EB app
eb init -p python-3.6 django-test-app 
#Create EB environment
eb create django-test-env
#Show EB app status to get CNAME
eb status
#Edit settings.py to add CNAME into ALLOWED_HOSTS and STATIC_ROOT = 'static' 
nano ebdjango/settings.py
#Activate virtual environment
. ~/eb-virt/bin/activate
#Collect static and create admin user
python manage.py collectstatic
python manage.py createsuperuser
#Deploy Django app to EB
eb deploy
#Open Deployed app
eb open
