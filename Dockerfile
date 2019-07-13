FROM starefossen/ruby-node

WORKDIR /app

COPY . /app

RUN gem install jekyll bundler && bundle update && bundle install

RUN npm -v && npm i bower && npx bower install --allow-root && mv bower_components _assets/bower

ENTRYPOINT ["bundle", "exec", "jekyll", "serve"]

EXPOSE 4000
