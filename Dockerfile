FROM  pjsousa/docker-opencv

WORKDIR $HOME

COPY run-server.sh $HOME/run-server.sh
COPY pip_install.sh $HOME/pip_install.sh

RUN chmod 777 $HOME/run-server.sh
RUN /bin/bash $HOME/pip_install.sh

CMD $HOME/run-server.sh