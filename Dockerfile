FROM k8s.gcr.io/fluentd-elasticsearch:v2.4.0

USER root

RUN apk add --no-cache --update --virtual .build-deps \
  sudo build-base ruby-dev \
  && sudo gem install fluent-plugin-kafka --no-document \
  && sudo gem install extlz4 \
  && sudo gem sources --clear-all \
  && apk del .build-deps \
  && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

USER fluent