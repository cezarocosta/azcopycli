FROM microsoft/dotnet:2.0-runtime
MAINTAINER Rodrigo Cezaro <cezarocosta@gmail.com>

RUN apt-get update                                 \
    && apt-get install -y --no-install-recommends  \
       wget                                        \
       rsync                                       #


# AzCopy application install.
RUN mkdir /tmp/azcopy                                                          \
    && wget -O /tmp/azcopy/azcopy.tar.gz https://aka.ms/downloadazcopyprlinux  \
    && tar -xf /tmp/azcopy/azcopy.tar.gz -C /tmp/azcopy                        \
    && /tmp/azcopy/install.sh                                                  \
    && rm -Rf /tmp/azcopy                                                      #

VOLUME /azure/backup.tar.gz

ENTRYPOINT ["/usr/bin/azcopy"]
CMD ["--version"]
