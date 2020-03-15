TARGET=test_scrapper
CGO_ENABLED=0 
GOOS=linux 
all: clean build
clean:
	rm -rf $(TARGET)

build:
	go build -a -installsuffix cdo -o $(TARGET) .
