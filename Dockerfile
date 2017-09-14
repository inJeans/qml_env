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

# Download packages
RUN git clone https://github.com/inJeans/qml_env.git

# Install conda packages
RUN conda config --add channels conda-forge && \
    conda install matplotlib && \
    conda install scikit-learn && \
    conda install pandas && \
    conda install seaborn && \
    conda install tqdm && \
    conda install cython && \
    conda install tensorflow && \
    conda install qutip

RUN pip install edward && \
    pip install pyquil

# # Install DWave stuff
RUN cd /qml_env && \
    pip install dwave_rel-1.0-py2-none-any.whl
    
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