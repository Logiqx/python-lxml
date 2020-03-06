ARG PYTHON_VERSION=3.8
ARG ALPINE_VERSION=3.11

FROM python:${PYTHON_VERSION}-alpine${ALPINE_VERSION} AS builder

RUN apk add --no-cache g++
RUN apk add --no-cache libxml2-dev libxslt-dev
RUN pip install --user --no-cache-dir lxml==4.5.*

FROM python:${PYTHON_VERSION}-alpine${ALPINE_VERSION}

RUN apk add --no-cache libxml2 libxslt

COPY --from=builder /root/.local/lib/python3.8/site-packages/ /usr/local/lib/python3.8/site-packages/
