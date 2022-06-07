# syntax=docker/dockerfile:1
FROM ruby:2.5
WORKDIR /myapp
RUN mkdir -p /usr/local/bundle/cache
RUN chown -R $USER_ID:$USER_ID /usr/local/bundle/cache
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
COPY web/Gemfile /myapp/Gemfile
COPY web/Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

ENV USER_ID 1000
ENV HOME /home/$USER_ID

RUN useradd -m $USER_ID \
    && echo $USER_ID:$USER_ID | chpasswd \
    && adduser $USER_ID sudo \
    && adduser $USER_ID www-data

RUN chown -R $USER_ID:$USER_ID $HOME
RUN chown -R $USER_ID:$USER_ID /myapp
USER $USER_ID

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]