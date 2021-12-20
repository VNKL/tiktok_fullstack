#! /bin/bash

playwright install
playwright install-deps

apt-get install libsoup2.4-1
apt-get install libgudev-1.0-0

python manage.py collectstatic --noinput
python manage.py makemigrations --noinput
python manage.py migrate --noinput
python manage.py init_admin
python manage.py start_updater

exec gunicorn api.wsgi:application -b 0.0.0.0:8000 --reload --log-level debug --limit-request-line 1024 --timeout 1000