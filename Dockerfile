FROM golang:latest
#FROM scratch
ARG LOG_DIR=/app/logs
# Create Log Directory
RUN mkdir -p ${LOG_DIR}
#RUN mkdir -p /var/lib/mysql
# Environment Variables
ENV LOG_FILE_LOCATION=${LOG_DIR}/test_scrapper.log 
# Set the Current Working Directory inside the container
WORKDIR /app
EXPOSE 8000
ADD ca-certificates.crt /etc/ssl/certs/
ADD test_scrapper /app
ADD .env /app
# Declare volumes to mount
VOLUME [${LOG_DIR}]
#VOLUME /var/lib/mysql
CMD ["/app/test_scrapper"]
