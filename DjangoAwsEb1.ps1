 #Setup Django project locally
 #Install Python and virtualenv:
 sudo apt install -y Python3.6 virtualenv
 #Create virtual environment:
 virtualenv ~/eb-virt --python=python3.6
 #Activate virtual environment: 
. eb-virt/bin/activate
 #Install Django into virtual environment
 pip install django==2.1.1
 #Start Django Project
 django-admin startproject ebdjango
 #Rename project directory:
 mv ebdjango ebdjango-project
 #Switch to project directory:
 cd ebdjango-project/
 #Apply migrations
 python manage.py migrate
 #Start local server for initial check
 python manage.py runserver
