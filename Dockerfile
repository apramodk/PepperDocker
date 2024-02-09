# Use the Ubuntu base image
FROM ubuntu


ENV RUNNING_IN_DOCKER true
# install zsh, oh-my-zsh, and set zsh as the default shell
RUN apt-get update && apt-get install -y zsh wget git
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-venv
RUN apt-get install -y python3-dev
RUN apt-get install -y build-essential
RUN apt-get install -y libssl-dev
RUN apt-get install -y libffi-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libxslt1-dev
RUN apt-get install -y libjpeg8-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libpq-dev
RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y libldap2-dev
RUN apt-get install -y libsasl2-dev
RUN apt-get install -y libldap2-dev

RUN useradd -ms /bin/bash newuser
USER newuser
WORKDIR /home/newuser
ADD WorkSpace /home/newuser/WorkSpace

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

CMD ["zsh"] 