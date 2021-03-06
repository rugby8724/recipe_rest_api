FROM python:3.9-alpine
MAINTAINER Jeremiah Wise

# Prevents python from buffering the outputs and prints them directly
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# creates empty folder on our docker image /app switches to /app as the default directory
# copyes from our local machines /app folder to the docker containers app folder
RUN mkdir /app
WORKDIR /app
COPY ./app /app


# adduser creates a user, -D means create a user that runs applications only
# USER user switches the user to the user we just created
# this is for security reasons, image will run application on root account without this step
RUN adduser -D user
USER user
