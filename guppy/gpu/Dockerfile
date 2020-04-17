FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu16.04

LABEL maintainer "Saad Khan <skhan8@mail.einstein.yu.edu>"
LABEL maintainer "Ryan Forster <ryan.forster@einsteinmed.org>"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH
ENV OMPI_MCA_opal_cuda_support=true

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion gcc make g++ curl \
    cmake libhdf5-dev libopenblas-dev gnupg2 \
    apt-transport-https ca-certificates \
    grep sed dpkg

# Install Conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py37_4.8.2-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

RUN TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

# Install Artic
RUN git clone https://github.com/artic-network/artic-ncov2019.git

WORKDIR /artic-ncov2019

RUN conda env create -f environment.yml

# Install Guppy
RUN apt-get -y install wget lsb-release && \
    wget -O- https://mirror.oxfordnanoportal.com/apt/ont-repo.pub | apt-key add - && \
    echo "deb http://mirror.oxfordnanoportal.com/apt xenial-stable non-free" | tee \
    /etc/apt/sources.list.d/nanoporetech.sources.list && \
    apt-get update 

RUN apt update && \
    apt install -y ont-guppy

# Set up Environment
RUN mkdir analysis

RUN echo "source activate artic-ncov2019" > ~/.bashrc

ENV PATH /opt/conda/envs/artic-ncov2019/bin:$PATH

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]