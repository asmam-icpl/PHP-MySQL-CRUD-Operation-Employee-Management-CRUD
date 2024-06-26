# Use an official PHP runtime as a parent image
FROM php:7.4-cli

# Set the working directory inside the container
WORKDIR /app

# Copy composer.lock and composer.json
# COPY composer.lock  /app/
# COPY composer.json /app/

 # Install PHP extensions and dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        zip \
        unzip \
    && \
    docker-php-ext-install pdo_mysql

# Copy the rest of the application code
COPY . /app

# Set permissions for cache and logs if needed
# RUN chown -R www-data:www-data var/cache var/logs

# Run any additional commands or scripts needed to build your project
# For example, running migrations or compiling assets
# RUN php bin/console doctrine:migrations:migrate

# Start your application
CMD ["php", "index.php"]
