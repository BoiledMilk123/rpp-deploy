FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

RUN apt-get update -qq && apt-get install -y postgresql-client

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

# Собираем статику
RUN python manage.py collectstatic --noinput

# Запускаем Gunicorn
CMD ["gunicorn", "bank_history.wsgi:application", "--bind", "0.0.0.0:80"]
