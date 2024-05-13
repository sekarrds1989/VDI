FROM ubuntu:latest
WORKDIR /usr/
COPY . .
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y git\
  && apt install -y ripgrep\
  && apt install -y vim\
  && rm -rf /var/lib/apt/lists/*
ENV VIM_BKUP ~/
RUN git config --global http.sslverify false
RUN export http_proxy=http://proxy-iind.intel.com:912 && export https_proxy=http://proxy-iind.intel.com:912 && chmod +x setup.sh && ./setup.sh
# RUN useradd -ms /bin/bash apprunner
# USER apprunner
