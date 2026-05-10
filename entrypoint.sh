#!/bin/sh
set -e

echo "==> Waiting for MySQL..."
until python -c "
import pymysql, os, sys
try:
    pymysql.connect(
        host=os.environ.get('DB_HOST', 'db'),
        port=int(os.environ.get('DB_PORT', 3306)),
        user=os.environ.get('DB_USER', 'root'),
        password=os.environ.get('DB_PASSWORD', ''),
        database=os.environ.get('DB_NAME', 'jobdjango'),
    )
    sys.exit(0)
except Exception as e:
    print(e)
    sys.exit(1)
" 2>/dev/null; do
  sleep 2
done
echo "==> MySQL is up!"

echo "==> Running migrations..."
python manage.py migrate --noinput

echo "==> Collecting static files..."
python manage.py collectstatic --noinput --clear 2>/dev/null || true

# Chay lenh duoc truyen vao (daphne hoac celery tuy service)
echo "==> Starting: $@"
exec "$@"
