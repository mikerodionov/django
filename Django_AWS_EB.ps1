 Setup Django project
 
 sudo apt install -y Python3.6 virtualenv
 virtualenv ~/eb-virt --python=python3.6
 cd eb-virt
 source ~/eb-virt/bin/activate
 pip install django==2.1.1
 django-admin startproject ebdjango
 mv ebdjango ebdjango-project
 python manage.py migrate
 python manage.py runserver
 
 Configure for EB
 
 pip freeze > requirements.txt / clean up
 mkdir .ebextensions
 nano .ebextensions/django.config
