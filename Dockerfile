# build me as fredhutch/umitools:$PACKAGE_VERSION
# ($PACKAGE_VERSION is defined below)

############################################################
# Dockerfile to build subread container images
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu:18.04

# File Author / Maintainer
LABEL mantainer="Dan Tenenbaum, based on work by Laurent Jourdren"

ARG PACKAGE_VERSION=1.0.1
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --yes python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install umi_tools==$PACKAGE_VERSION && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/local/bin/python
