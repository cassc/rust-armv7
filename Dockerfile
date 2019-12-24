FROM ubuntu:bionic-20191202@sha256:56ea270e0c0826ab6b155acf5130fbc59fa36703e982bddea3143261fca60b8d
ENV CACHE_REFRESH_AT=2019-12-23
RUN  apt-get update
RUN  apt-get install -y apt-transport-https
COPY bionic.sources.list /etc/apt/sources.list
RUN  apt-get update
RUN  apt-get install -y libudev1 libudev-dev software-properties-common
RUN  apt-get install -y curl
RUN  echo 'export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup' >> /etc/profile
COPY .cargo/ /root/.cargo/
RUN  curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV  PATH="/root/.cargo/bin:${PATH}"
RUN  rustup install nightly
RUN  rustup default nightly
RUN  apt-get install -y build-essential






