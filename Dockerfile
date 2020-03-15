FROM golang:latest
#FROM scratch
# Add Maintainer Info
LABEL maintainer="Sergey Popurey <pprisn@yandex.ru>"
ARG LOG_DIR=/app/logs
# Create Log Directory
RUN mkdir -p ${LOG_DIR}
#RUN mkdir -p /var/lib/mysql
# Environment Variables
ENV LOG_FILE_LOCATION=${LOG_DIR}/test_scrapper.log 
# Set the Current Working Directory inside the container
WORKDIR /app
# Copy go mod and sum files
COPY go.mod go.sum ./
# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download
# Copy the source from the current directory to the Working Directory inside the container
COPY . .
RUN make
EXPOSE 8000
ADD ca-certificates.crt /etc/ssl/certs/
#ADD test_scrapper /app
ADD .env /app
# Declare volumes to mount
VOLUME [${LOG_DIR}]
#VOLUME /var/lib/mysql
CMD ["/app/test_scrapper"]
