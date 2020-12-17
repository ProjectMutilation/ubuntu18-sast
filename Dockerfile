from ubuntu:18.04

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
      git cmake libssl-dev libboost-all-dev qtbase5-dev qtbase5-private-dev qtdeclarative5-dev libqt5svg5-dev qttools5-dev
RUN  apt-get install -y wget gnupg 
RUN apt-get install -y cppcheck gcc g++ clang-9 clang++-9 clang-tidy-9 clang-tools-9
# INSTALL PVS-Studio
RUN wget -q -O - https://files.viva64.com/etc/pubkey.txt | apt-key add - \
 && wget -O /etc/apt/sources.list.d/viva64.list \
    https://files.viva64.com/etc/viva64.list \
 && apt update -yq \
 && apt install -yq pvs-studio strace \
 && pvs-studio --version \
 && apt clean -yq
