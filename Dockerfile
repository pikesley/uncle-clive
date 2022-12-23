FROM ruby:2.4

ENV PROJECT uncle-clive
ENV PLATFORM docker
WORKDIR /opt/${PROJECT}

COPY ./Gemfile* /opt/${PROJECT}
RUN bundle install

COPY ./ /opt/${PROJECT}
