FROM andrewosh/binder-base

MAINTAINER Fabian Rost <fabian.rost@tu-dresden.de>

USER root

# Install Anaconda and Jupyter
RUN wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda2-4.0.0-Linux-x86_64.sh
RUN bash Anaconda2-4.0.0-Linux-x86_64.sh -b &&\
    rm Anaconda2-4.0.0-Linux-x86_64.sh
ENV PATH $HOME/anaconda2/bin:$PATH
RUN conda create -n python2 python=2 anaconda
RUN /bin/bash -c "source activate python2 && ipython kernel install --user"

RUN /home/main/anaconda2/bin/pip install --upgrade pip

RUN pip install uncertainties ipycache iminuit probfit pymc

ENV SHELL /bin/bash
