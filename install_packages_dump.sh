#!/usr/bin/env bash

clear
echo "INSTALLATION DES PAQUETS POUR EPITECH'S DUMP"
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté en tant que root" 1>&2
   exit 1
fi

echo "Appuyez sur ENTRÉE pour continuer..."
read

pacman -Syu --noconfirm

packages_list=(
    boost
    clang
    cmake
    cunit
    curl
    flac
    freetype2
    gcc
    gcc-libs
    gdb
    git
    glibc
    gmp
    ksh
    libjpeg-turbo
    libogg
    libvorbis
    libx11
    libxext
    ltrace
    make
    nasm
    ncurses
    net-tools
    openal
    python-numpy
    python
    rlwrap
    ruby
    strace
    tar
    tcsh
    tmux
    sudo
    tree
    unzip
    valgrind
    vim
    emacs
    which
    xcb-util-image
    zip
    zsh
    avr-gcc
    qt5-base
    docker
    docker-compose
    jdk-openjdk
    boost
    boost-numeric-bindings
    boost-libs
    autoconf
    automake
    tcpdump
    wireshark-qt
    nodejs
    libvirt
    ghc
    go
    systemd
    libgudev
    php
    php-fpm
    php-bcmath
    php-cli
    php-gd
    php-intl
    php-mcrypt
    php-pgsql
    php-pear
    php-xml
    php-gettext
    php-phar-io-filesystem
    sfml
    csfml
    irrlicht
    rust
    mariadb
    x264
    lightspark
    teams)

pacman -S --noconfirm ${packages_list[@]}

# Criterion
curl -sSL "https://github.com/Snaipe/Criterion/releases/download/v2.4.0/criterion-2.4.0-linux-x86_64.tar.xz" -o criterion-2.4.0.tar.xz
tar xf criterion-2.4.0.tar.xz
cp -r criterion-2.4.0/* /usr/local/
echo "/usr/local/lib" > /etc/ld.so.conf.d/usr-local.conf
ldconfig
rm -rf criterion-2.4.0.tar.xz criterion-2.4.0/

# Sbt
curl -sSL "https://github.com/sbt/sbt/releases/download/v1.3.13/sbt-1.3.13.tgz" | tar xz
mv sbt /usr/local/share
ln -s '/usr/local/share/sbt/bin/sbt' '/usr/local/bin'

# Gradle
wget https://services.gradle.org/distributions/gradle-7.2-bin.zip
mkdir /opt/gradle && unzip -d /opt/gradle gradle-7.2-bin.zip && rm -f gradle-7.2-bin.zip
echo 'export PATH=$PATH:/opt/gradle/gradle-7.2/bin' >> /etc/profile

# Stack
curl -sSL https://get.haskellstack.org/ | sh

# CONFIG EMACS
git clone https://github.com/Epitech/epitech-emacs.git
cd epitech-emacs
git checkout 278bb6a630e6474f99028a8ee1a5c763e943d9a3
./INSTALL.sh system
cd .. && rm -rf epitech-emacs

# CONFIG VIM
git clone https://github.com/Epitech/vim-epitech.git
cd vim-epitech
git checkout ec936f2a49ca673901d56598e141932fd309ddac
./install.sh
cd .. && rm -rf vim-epitech
