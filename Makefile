docker-run:
	docker compose up -d

docker-with-maven: maven
	rm -rf target/*
	docker compose up

maven:
	docker compose down
	./mvnw install -f pom.xml
	docker compose build
	docker compose up -d

docker-run-no-detach:
	docker compose up

docker-update:
	docker compose down;
	docker compose up --force-recreate;
docker-old-run:
	docker-compose up -d

docker-install:
	echo "Only for UNIX based computer"
	wget -o /tmp/install-docker.sh https://get.docker.com/; sudo /tmp/install-docker.sh;