mkdir -p ~/logs/go-docker
docker run --rm -d -p 8000:8000 -it --network="host" -v ~/logs/go-docker:/app/logs  test_scrapper
