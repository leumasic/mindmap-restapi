FROM python:3.10-alpine

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . /app
WORKDIR /app

ENV FLASK_ENV=production

RUN pip install waitress

EXPOSE 3000
ENTRYPOINT [ "waitress-serve", "--port", "3000", "--call", "app:create_app" ]
