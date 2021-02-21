FROM alpine:3.13

# build-base includes:
#   binutils
#   file
#   fortify-headers
#   g++
#   gcc
#   libc-dev
#   make
#   patch
# Optional Packages
#   sudo - added for add patches
RUN apk update && \
    apk add --no-cache \
        bash \
        bc \
        binutils \
        bzip2 \
        coreutils \
        cpio \
        fakeroot \
        file \
        findutils \
        g++ \
        gcc \
        gzip \
        linux-headers \
        musl-dev \
        musl-locales \
        make \
        patch \
        perl \
        rsync \
        sed \
        sudo \
        tar \
        unzip \
        wget \
        which

RUN adduser -D -s /bin/bash br-user && \
    chown -R br-user:br-user /home/br-user && \
    echo 'br-user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER br-user
WORKDIR /home/br-user
ENV HOME /home/br-user
ENV LC_ALL en_US.UTF-8

# Keep container alive once launched
ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
