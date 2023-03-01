FROM antsx/ants:v2.4.0
MAINTAINER Dave Cash d.cash@ucl.ac.uk

ARG DEBIAN_FRONTEND="noninteractive"
ENV TZ=Europe/London

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get install -y -q --no-install-recommends \
           apt-utils \
           build-essential \
           git \
           ca-certificates \
           cmake \
           curl \
           libxt-dev \
           libz-dev \
           locales \
           wget \
           unzip \
    && apt-get -q clean

# MATLAB RUNTIME
WORKDIR /opt
# If files aren't downloaded RUN wget https://ssd.mathworks.com/supportfiles/downloads/R2018a/deployment_files/R2018a/installers/glnxa64/MCR_R2018a_glnxa64_installer.zip \
COPY MCR_R2018a_glnxa64_installer.zip .
RUN mkdir -p /opt/mcr \
  && unzip MCR_R2018a_glnxa64_installer.zip -d /opt/mcr \
  && /opt/mcr/install -mode silent -agreeToLicense yes \
  && rm -rf MCR_R2018a_glnxa64_installer.zip /opt/mcr

# ENV LD_LIBRARY_PATH "/opt/ants/lib:/usr/local/MATLAB/MATLAB_Runtime/v94/runtime/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v94/bin/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v94/sys/os/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v94/extern/bin/glnxa64"
ENV MCRROOT /usr/local/MATLAB/MATLAB_Runtime/v94

WORKDIR /opt
RUN git clone --depth 1 https://github.com/KCL-BMEIS/niftyreg.git niftyreg_source \
  && cd niftyreg_source \
  && mkdir -p /opt/niftyreg_build \
  && cd /opt/niftyreg_build \
  && cmake -D CMAKE_INSTALL_PREFIX=/usr/local -D CMAKE_BUILD_TYPE=Release ../niftyreg_source \
  && make -j 4 \
  && make install
WORKDIR /opt
RUN rm -rf niftyreg_build niftyreg_source

ENV ANTSPATH /opt/ants/bin/

RUN mkdir -p /opt/mri_reface_0.3
WORKDIR /opt/mri_reface_0.3
COPY mri_reface .
COPY run_mri_reface.sh .
ENTRYPOINT ["/bin/bash", "/opt/mri_reface_0.3/run_mri_reface.sh"]
