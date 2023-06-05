FROM ruby:2.3.8


RUN echo "deb http://deb.debian.org/debian stable main" > /etc/apt/sources.list

RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client  --allow-unauthenticated

ADD . /Rails-Docker
WORKDIR /Rails-Docker
RUN bundle install

EXPOSE 3000

CMD ["bash","-c", "rails server"]
