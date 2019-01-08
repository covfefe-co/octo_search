FROM ruby:2.6-alpine
COPY .build-deps /
RUN cat .build-deps | xargs apk add
RUN mkdir /octo_search
WORKDIR /octo_search
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
