FROM andrewosh/binder-base

MAINTAINER Fabian Rost <fabian.rost@tu-dresden.de>

USER root

RUN conda create -q -n python2 python=2 anaconda pymc
RUN /bin/bash -c "source activate python2 && ipython kernel install --user"

RUN /home/main/anaconda2/bin/pip install --upgrade pip

RUN /home/main/anaconda2/bin/pip install -q uncertainties ipycache iminuit probfit

ENV SHELL /bin/bash
