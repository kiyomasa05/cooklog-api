FROM ruby:3.0.0

ARG WORKDIR
ARG API_DOMAIN

ENV LANG C.UTF-8 \
  TZ Asia/Tokyo\
  HOME =/${WORKDIR} \
  API_DOMAIN =${API_DOMAIN}

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn \
  && mkdir /cooklog
WORKDIR /cooklog
COPY Gemfile /cooklog/Gemfile
COPY Gemfile.lock /cooklog/Gemfile.lock
RUN bundle install
COPY . /cooklog/

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
