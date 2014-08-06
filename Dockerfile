FROM debian:wheezy

MAINTAINER Viktor Taranenko, viktortnk@gmail.com, viktor@whisk.com

RUN apt-get update
RUN apt-get install -y curl

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" | tee -a /etc/apt/sources.list.d/rabbitmq.sources.list
RUN curl -L http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add -
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y rabbitmq-server

RUN rabbitmq-plugins enable rabbitmq_management

RUN echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config

EXPOSE 5672 15672 4369

CMD ["/usr/sbin/rabbitmq-server"]
