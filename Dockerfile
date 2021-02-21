FROM alpine:3.13

# Required packages not in manual
#   python3 - need to build python3
#   findutils - for rootfs fixup
#   coreutils - can't use busybox for build scripts
# Optional Packages
#   ncurses - for ncurses terminal output
#   ncurses-dev - for 'make menuconfig'
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
        make \
        musl-dev \
        musl-locales \
        ncurses \
        ncurses-dev \
        patch \
        perl \
        python3 \
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

CMD ["bash"]

ENTRYPOINT ["/bin/bash", "-c"]
