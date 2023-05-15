FROM alpine:3.18
RUN apk add --update openjdk17-jre bash wget unzip && rm -rf /var/cache/apk/*
MAINTAINER Stian Soiland-Reyes <stain@apache.org>

# Update according to https://github.com/LibraryOfCongress/bagit-java/releases
# but at 4.x as bagit-java 5.0 which no longer have the 'bag' command line tool
env BAGIT_VERSION 4.12.3
env BAGIT_SHA256 7736d00fafe575ea298788a8d697a2af490dd12f856b43cd57bf579a374199e1

RUN mkdir /bagit
RUN cd /tmp && \
  echo "$BAGIT_SHA256  bagit.zip" > bagit.zip.sha256 && \
  wget --no-check-certificate -O bagit.zip https://github.com/LibraryOfCongress/bagit-java/releases/download/bagit-$BAGIT_VERSION/bagit-$BAGIT_VERSION-bin.zip && \
  ls -al bagit.zip && \
  md5sum bagit.zip && \
  cat bagit.zip.sha256 && \
  sha256sum -c bagit.zip.sha256 && \
  unzip /tmp/bagit.zip && \
  mv bag*/* /bagit/ && \
  rm -rf bagit.zip* && \
  ln -s /bagit/bin/bag /usr/local/bin/bag && \
  chmod 755 /usr/local/bin/bag
RUN bag --version

RUN mkdir /data
WORKDIR /data
#VOLUME /data

CMD ["/usr/local/bin/bag"]
