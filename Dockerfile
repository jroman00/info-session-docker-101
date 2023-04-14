FROM php:7.4.33-cli-buster

ENV EXAMPLE_ENV foo

RUN apt-get update && \
  apt-get install -y $PHPIZE_DEPS && \
  apt-get install -y git unzip zip && \
  apt-get install -y procps

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

COPY . .

RUN groupadd -r justin && useradd -g justin justin
RUN chown -R justin:justin .
USER justin

RUN composer install

EXPOSE 8279

RUN touch foo.txt

CMD ["php", "-S", "0.0.0.0:8279", "-t", "public"]
