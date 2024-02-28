# Use the Ubuntu base image
FROM ubuntu:18.04

ENV RUNNING_IN_DOCKER true
ENV ANDROID_SDK_ROOT="/opt/android/sdk"
ENV ANDROID_STUDIO_VERSION="2021.3.1.1"
ENV ANDROID_SDK_TOOLS_URL="https://plugins.jetbrains.com/plugin/download?rel=true&updateId=92773"

# install zsh, oh-my-zsh, and set zsh as the default shell
RUN apt-get update && \
    apt-get install -y \
    zsh \
    git \
    wget \
    unzip \
    openjdk-8-jdk \
    curl \
    vim \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    build-essential \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    libjpeg8-dev \
    zlib1g-dev \
    libpq-dev \
    libmysqlclient-dev \
    libldap2-dev \
    libsasl2-dev \
    libldap2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/android-studio && \
    wget -q https://redirector.gvt1.com/edgedl/android/studio/ide-zips/${ANDROID_STUDIO_VERSION}/android-studio-${ANDROID_STUDIO_VERSION}-linux.tar.gz -O android-studio.tar.gz && \
    tar -xf android-studio.tar.gz -C /opt/android-studio --strip-components=1 && \
    rm android-studio.tar.gz

RUN mkdir -p /opt/android/sdk
RUN wget -q "${ANDROID_SDK_TOOLS_URL}" -O android-sdk-tools.zip && \
    unzip -q android-sdk-tools.zip -d ${ANDROID_SDK_ROOT} && \
    rm android-sdk-tools.zip

RUN useradd -ms /bin/bash newuser
USER newuser
WORKDIR /home/newuser
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

CMD ["zsh"]
