#!/bin/bash

echo "Running the nginx + uwsgi + flask triumvirate"
nginx && uwsgi --ini /wsgi.ini