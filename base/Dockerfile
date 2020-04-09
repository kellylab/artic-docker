FROM continuumio/miniconda3:latest

LABEL maintainer "Saad Khan <skhan8@mail.einstein.yu.edu>"
LABEL maintainer "Ryan Forster <ryan.forster@einsteinmed.org>"

RUN apt-get -y update && \
	apt-get -y upgrade && \
    apt-get -y install gcc make g++ curl cmake libhdf5-dev libopenblas-dev

# Install Flappie and runnie, the free versions of Oxford Nanopore's basecallers
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    apt-get install git-lfs
RUN git clone https://github.com/nanoporetech/flappie && \
    cd flappie && \
    make flappie && \
    make runnie && \
    cp flappie /bin/flappie && \
    cp runnie /bin/runnie && \
    rm -rf /flappie

RUN git clone https://github.com/artic-network/artic-ncov2019.git

WORKDIR /artic-ncov2019

RUN conda env create -f environment.yml

RUN mkdir analysis

RUN echo "source activate artic-ncov2019" > ~/.bashrc
ENV PATH /opt/conda/envs/artic-ncov2019/bin:$PATH