FROM java:8
# Update according to https://github.com/LibraryOfCongress/bagit-java/releases

env BAGIT_VERSION 4.9.0
env BAGIT_MD5 9386d93ea3c827db7d96b90f46d13534

RUN mkdir /bagit
RUN cd /tmp && \
  echo $BAGIT_MD5 bagit.zip > bagit.zip.md5 && \
  wget -O bagit.zip https://github.com/LibraryOfCongress/bagit-java/releases/download/bagit-$BAGIT_VERSION/bagit-$BAGIT_VERSION-bin.zip && \
  md5sum -c bagit.zip.md5 && \
  unzip /tmp/bagit.zip && \
  mv bag*/* /bagit/ && \
  ln -s /bagit/bin/bag /usr/local/bin/bag && \
  chmod 755 /usr/local/bin/bag
RUN bag --help

RUN mkdir /data
WORKDIR /data
#VOLUME /data

CMD ["/usr/local/bin/bag"]
