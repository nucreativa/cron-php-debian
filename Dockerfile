FROM php:8.0-cli

RUN apt-get update && apt-get install -y \
    libpq-dev \
    libgpgme-dev \
    libssh2-1-dev \
    libssh2-1 \
    cron \
    gnupg \
    && pecl install gnupg ssh2-1.3.1 \
    && docker-php-ext-enable --ini-name pecl.ini \
    gnupg \
    ssh2

CMD ["cron", "-f"]
