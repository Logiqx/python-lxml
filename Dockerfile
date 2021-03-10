ARG PYTHON_VERSION=3.9
ARG ALPINE_VERSION=3.12

FROM python:${PYTHON_VERSION}-alpine${ALPINE_VERSION} AS builder

RUN apk add --no-cache g++

RUN apk add --no-cache libxml2-dev libxslt-dev

RUN pip install --user --no-cache-dir lxml==4.6.*

RUN chmod 755 /root/.local/lib/*/site-packages

FROM python:${PYTHON_VERSION}-alpine${ALPINE_VERSION}

RUN apk add --no-cache libxml2 libxslt

COPY --from=builder /root/.local/lib/ /usr/local/lib/
