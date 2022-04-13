FROM ruby:2

VOLUME /srv
WORKDIR /srv

ENV BUNDLE_PATH=/srv/.bundle/
ENV TZ=America/New_York

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    git \
    ruby \
    ruby-dev \
    libxml2-dev \
    zlib1g-dev && \
    apt-get autoclean && \
    gem install bundler

RUN groupadd -g 1000 ss && \
    useradd -r -m -u 1000 -g ss ss

USER ss

ENTRYPOINT ["bundle"]
CMD ["--help"]
