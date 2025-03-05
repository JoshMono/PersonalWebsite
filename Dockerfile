FROM python:3.13.1-slim-bookworm
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

RUN apt -yq update
RUN apt -yq install htop

RUN useradd -ms /bin/bash django

WORKDIR /code

RUN chown django /code
COPY --chown=django:django . .

USER django

ENV VIRTUAL_ENV=/home/django
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN rm -f requirements.txt

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]