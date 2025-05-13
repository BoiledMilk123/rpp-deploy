MANAGE := poetry run python3 manage.py
MANAGEPOETRY := poetry run

test:
  ${MANAGE} test $(CMD)

migrations:
  ${MANAGE} makemigrations
static:
  ${MANAGE} collectstatic --noinput
migrate:static
  ${MANAGE} migrate

create_update_superuser:
  ${MANAGE} createsuperuser

install:
  poetry install --no-root

start:migrate
  ${MANAGEPOETRY} uvicorn core.asgi:application --host 0.0.0.0 --port 8000