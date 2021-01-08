FROM alpine:3.4

MAINTAINER David Sewell <snocorp@gmail.com>

# Download and install hugo
ENV HUGO_VERSION 0.18
ENV HUGO_ARCHIVE hugo_${HUGO_VERSION}_Linux-64bit.tar.gz
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux_amd64

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_ARCHIVE} /tmp/${HUGO_ARCHIVE}
RUN tar -xzf /tmp/${HUGO_ARCHIVE} -C /tmp
RUN mv /tmp/${HUGO_BINARY}/${HUGO_BINARY} /usr/local/bin/hugo && rm -rf /tmp/*

RUN mkdir -p /usr/src/hugo/site
WORKDIR /usr/src/hugo/site

EXPOSE 1313

CMD ["server"]
ENTRYPOINT ["hugo"]
