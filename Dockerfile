FROM ubuntu:trusty
MAINTAINER Greg Poirier <grep@gray.industries>

# Shared data volume contains all of the necessary configuration material for
# the sensu-server, sensu-api, and uchiwa containers.

ADD files/sensu-pubkey.gpg /sensu-pubkey.gpg
RUN apt-key add /sensu-pubkey.gpg
RUN echo "deb     http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y sensu supervisor
ADD files/supervisord.conf /etc/supervisor/conf.d/base.conf
