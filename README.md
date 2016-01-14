# BagIt Library (BIL)


* Docker image: [stain/bagit](https://hub.docker.com/r/stain/bagit/)
* Base images: [alpine](https://hub.docker.com/r/_/alpine/):3.3
* Source: [Dockerfile](https://github.com/stain/bagit-docker/blob/master/Dockerfile), [bagit-java](https://github.com/LibraryOfCongress/bagit-java)


[![Build Status](https://travis-ci.org/stain/bagit-docker.svg)](https://travis-ci.org/stain/bagit-docker)

[![](https://badge.imagelayers.io/stain/bagit:latest.svg)](https://imagelayers.io/?images=stain/bagit:latest 'bagit analysis at imagelayers.io')



Docker packaging of the [BagIt Library (BIL)](https://github.com/LibraryOfCongress/bagit-java)
- a Java library and command line `bag` for working with
[BagIt](http://tools.ietf.org/html/draft-kunze-bagit) archives.

See the [BagIt Wikipedia page](https://en.wikipedia.org/wiki/BagIt) for more details.



## Usage

    docker run stain/bagit bag --help

The directory `/data` is the current directory within the docker image,
and can be mounted as a volume to work with your bags, e.g.:

    docker run -v /home/johndoe/Downloads:/data stain/bagit bag verify /data/bag1


## Contributions

For any questions about the
[BagIt specification](http://tools.ietf.org/html/draft-kunze-bagit)
or its usage, contact the
[digital-curation](https://groups.google.com/forum/#!forum/digital-curation) forum.

For questions about the `bag` command or the bagit-java library, use the
[bagit-java issue tracker](https://github.com/LibraryOfCongress/bagit-java/issues)
or [bagit-java pull requests](https://github.com/LibraryOfCongress/bagit-java/pulls).

For improvements to this [bagit Docker image](https://github.com/stain/bagit-docker/),
feel free to raise a [bagit-docker
issue](https://github.com/stain/bagit-docker/issues)
or create a
[bagit-docker pull request](https://github.com/stain/bagit-docker/pulls).
