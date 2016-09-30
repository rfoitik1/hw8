FROM ubuntu:latest
MAINTAINER Richard FOitik <rfoitik1@email.arizona.edu>
ENV PATH /usr/local/bin:$PATH
RUN apt-get update && apt-get install -y --no-install-recommends
RUN apt-get install -y python
RUN apt-get install -y libnetcdf-dev
RUN apt-get -y install libhdf5-serial-dev
RUN apt-get install -y python-dev python-distribute python-pip
RUN pip install --upgrade pip
RUN pip install netcdf4
RUN pip install plotly
ENV APP_HOME /season_heat_maps
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME
RUN python test.py
