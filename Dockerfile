from ubuntu:18.04

RUN apt-get update --fix-missing
RUN apt-get upgrade -y

RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends gcc cmake g++ clang-9 clang++-9 clang-tidy-9 clang-tools-9
RUN apt-get update --fix-missing && apt-get install -y --fix-missing --no-install-recommends git libssl-dev libboost-all-dev 
RUN apt-get update --fix-missing && apt-get install -y qtbase5-dev qtbase5-private-dev qtdeclarative5-dev libqt5svg5-dev qttools5-dev
RUN apt-get install -y wget gnupg 

# INSTALL PVS-Studio
RUN wget -q -O - https://files.viva64.com/etc/pubkey.txt | apt-key add - \
 && wget -O /etc/apt/sources.list.d/viva64.list \
    https://files.viva64.com/etc/viva64.list \
 && apt update -yq \
 && apt install -yq pvs-studio strace \
 && pvs-studio --version \
 && apt clean -yq
RUN mkdir tmp1
RUN cd tmp1
RUN wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
RUN tar -xvf go1.14.4.linux-amd64.tar.gz
RUN mv go /usr/local
RUN apt-get install -y unzip
#install cppcheck
RUN wget https://github.com/danmar/cppcheck/archive/2.4.1.tar.gz && tar -xvzf 2.4.1.tar.gz && rm 2.4.1.tar.gz
RUN cd cppcheck-2.4.1 && mkdir build && cd build && cmake -DUSE_MATCHCOMPILER=ON .. && cmake --build . 
RUN mkdir /cppcheck && cp /cppcheck-2.4.1/build/bin/cppcheck /cppcheck/cppcheck && cp -r /cppcheck-2.4.1/cfg/ /cppcheck/cfg/ && rm -r cppcheck-2.4.1
