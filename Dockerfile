# Start with the Anaconda image from Continuum
FROM continuumio/anaconda:latest
MAINTAINER Chris Watkins <christopher.watkins@me.com>

# Install necessary ubuntu applications
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    wget \
    cmake \
    unzip \
    git \
    vim

# Create conda environments
RUN git clone https://github.com/inJeans/qml_env.git && \
    cd qml_env && \
    conda env create --file environment-2.yml && \
    conda env create --file environment-3.yml && \
    cd .. && \
    rm -rf qml_env
    
# CMD cd cuda_dsmc/build && \
#     git checkout develop-2.0 && \
#     git pull && \
#     make clean && \
#     make clean-cmake && \
#     cmake .. && \
#     make && \
#     make test


# # Add the testu01 installation to the environment paths
# ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH
# ENV LIBRARY_PATH /usr/local/lib:$LIBRARY_PATH
# ENV C_INCLUDE_PATH /usr/local/include:$C_INCLUDE_PATH