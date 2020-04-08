FROM continuumio/miniconda3:latest

LABEL maintainer "Saad Khan <skhan8@mail.einstein.yu.edu>"

RUN apt-get -y update && \
	apt-get -y upgrade && \
    apt-get -y install gcc make g++

RUN git clone https://github.com/artic-network/artic-ncov2019.git

WORKDIR /artic-ncov2019

RUN conda env create -f environment.yml
RUN conda env create -f environment-medaka.yml
RUN mkdir analysis

RUN echo "source activate artic-ncov2019" > ~/.bashrc
ENV PATH /opt/conda/envs/artic-ncov2019/bin:$PATH

#ENTRYPOINT [ "/bin/bash" ]