Uses:
    django version 1.6.5
    python 2.7.5
    MySQL

## Getting the Django project up and running for development

### Python

Python 2.7 needs to be installed on your machine. Also, you'll need to install the
required Python packages:

pip install -r requirements.txt

It's recommended that you do this in a virtualenv
(http://virtualenv.readthedocs.org/en/latest/virtualenv.html) to keep your global
Python install clean.

### MySQL

You'll need to have a MySQL server running on your machine. Homebrew is an easy
way to get this installed:

brew install mysql

You'll also need to create an "sdhacks" database in MySQL:

CREATE DATABASE sdhacks;

Finally, all of the necessary tables need to be created in the database.

cd SDHacks/backend/sdhacks
python manage.py syncdb

### Running the Django development server

cd SDHacks/backend/sdhacks
python manage.py runserver
