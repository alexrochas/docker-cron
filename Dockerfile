FROM alpine:latest
MAINTAINER alex.rochas@yahoo.com.br

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/hello-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

RUN cat /etc/cron.d/hello-cron > /etc/crontabs/root

# Run the command on container startup
CMD crond -l 2 && tail -f /var/log/cron.log
