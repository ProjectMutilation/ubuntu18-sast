from ubuntu:18.04

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
      git cmake libssl-dev libboost-all-dev qtbase5-dev qtbase5-private-dev qtdeclarative5-dev libqt5svg5-dev qttools5-dev
RUN  apt-get install -y wget gnupg 
RUN apt-get install -y cppcheck gcc g++ clang-9 clang++-9 clang-tidy-9 clang-tools-9

