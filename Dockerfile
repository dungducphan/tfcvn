FROM ubuntu:latest
RUN apt-get clean && apt-get update
RUN apt-get upgrade -qy
RUN apt-get install -qy python3 python3-pip
RUN python3 -m pip install --upgrade setuptools
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade numpy==1.16.4
RUN python3 -m pip install --upgrade scipy
RUN python3 -m pip install --upgrade Pillow
RUN python3 -m pip install --upgrade cython
RUN python3 -m pip install --upgrade matplotlib
RUN python3 -m pip install --upgrade scikit-image
RUN python3 -m pip install --upgrade scikit-learn
RUN python3 -m pip install --upgrade tensorflow==1.12.0
RUN python3 -m pip install --upgrade keras==2.2.4
RUN python3 -m pip install --upgrade opencv-python
RUN python3 -m pip install --upgrade h5py
RUN python3 -m pip install --upgrade IPython[all]
RUN python3 -m pip install --upgrade configargparse
RUN python3 -m pip install --upgrade pandas==0.24.0
RUN python3 -m pip install --upgrade progbar
RUN python3 -m pip install --upgrade tables
RUN apt-get install -qy vim
ENV DEBIAN_FRONTEND=noninteractive
RUN echo ${DEBIAN_FRONTEND}
RUN apt-get -y -qq install krb5-user
RUN apt-get -y -qq install ssh
COPY .ssh_config /home
RUN cat /home/.ssh_config >> /etc/ssh/ssh_config
RUN mkdir /home/workspace
WORKDIR /home/workspace