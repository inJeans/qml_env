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
RUN git clone https://github.com/inJeans/qml_env.git && \
    ls

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

# Install pip packages
RUN pip install edward && \
    pip install pyquil

# Install DWave stuff
RUN cd /qml_env && \
    ls && \
    pip install dwave_rel-1.0-py2-none-any.whl && \
    pip install dwave_matlib-1.1.1-cp27-cp27mu-linux_x86_64.whl && \
    pip install dwave_classical_boltzmann_sampler-1.0-cp27-cp27mu-linux_x86_64.whl && \
    pip install dwave_quantum_boltzmann_sampler-1.0-cp27-cp27mu-linux_x86_64.whl

# # Add the testu01 installation to the environment paths
# ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH
# ENV LIBRARY_PATH /usr/local/lib:$LIBRARY_PATH
# ENV C_INCLUDE_PATH /usr/local/include:$C_INCLUDE_PATH