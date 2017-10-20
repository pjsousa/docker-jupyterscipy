FROM  ubuntu:latest

ENV HOME /root
ENV WORKON_HOME $HOME/.virtualenvs

RUN apt-get -y update
RUN apt-get -y upgrade


#Prerequisites
RUN apt-get install -y build-essential cmake pkg-config\
                     libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev\
                     libavcodec-dev libavformat-dev libswscale-dev libv4l-dev\
                     libxvidcore-dev libx264-dev\
                     libgtk-3-dev libx11-dev libboost-python-dev\
                     libatlas-base-dev gfortran\
                     python2.7-dev python3.5-dev\
                     wget zip


COPY pip_install.sh $HOME/pip_install.sh

WORKDIR $HOME

EXPOSE 8888

#Load jupyter config and create ssl certificates
RUN mkdir -p $HOME/jupyterdata
RUN mkdir -p $HOME/.jupyter
COPY jupyter_notebook_config.py $HOME/.jupyter/jupyter_notebook_config.py

RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" \
    -keyout ~/.jupyter/selfcert.key  -out ~/.jupyter/selfcert.cert
