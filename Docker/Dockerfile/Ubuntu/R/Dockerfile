FROM ubuntu:14.04

RUN apt-get -y update
RUN apt-get -y install curl
RUN apt-get -y install traceroute

# R

RUN sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
RUN gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
RUN gpg -a --export E084DAB9 | sudo apt-key add -
RUN apt-get -y install r-base
