FROM python:3-alpine

LABEL version="1.0.1"
LABEL repository="http://github.com/krocodial/secret-scan"
LABEL homepage="http://github.com/krocodial/secret-scan"
LABEL maintainer="Louis"

LABEL "com.github.actions.name"="Secret Scan"
LABEL "com.github.actions.description"="Scan your repository for secrets"
LABEL "com.github.actions.icon"="lock"
LABEL "com.github.actions.color"="red"
LABEL "ripped.from"="https://github.com/max/secret-scan"

RUN pip install truffleHog
RUN apk --update add git less openssh && \
  rm -rf /var/lib/apt/lists/* && \
  rm /var/cache/apk/*
COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
