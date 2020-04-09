# artic-docker
Docker Image for Artic Coronavirus Sequencing Pipeline

This contains a Dockerfile along with scripts for running the nCOV2019
sequencing pipeline developed by Artic:
https://github.com/artic-network/artic-ncov2019

These tools are used for processing raw read data from an Oxford Nanopore
sequencing machine. They are intended to be used by researchers, and this image
contains additional files specifically for sequencing of the nCov-2019 virus.

This repo is currently being developed, but the core artic tools are present, so
you can use them to run artic tools in a containerized environment.

# Usage

    docker pull skhan8/artic

You can now run artic tools using this image. For example,

    docker run -it skhan8/artic artic basecaller

See the artic documentation for usage information.

# Building

Clone this repository and from the base folder run:

    docker build -it artic . 


# Examples

Follow the instructions on this page to analyze your reads:
https://artic.network/ncov-2019/ncov2019-bioinformatics-sop.html

# Contributing

Pull requests, issues, comments, and suggestions are welcome. Feel free to reach
out to me directly as well via skhan8@mail.einstein.yu.edu.
