Aliases:

* `dps` → `docker ps`
* `dc` → `docker-compose`

Basic usage:

```sh
docker build -t romantest:latest .

docker run romantest:latest
docker run -it romantest:latest
docker run -it romantest:latest /bin/bash
docker run -it -v $(pwd):/var/www romantest:latest /bin/bash
```

Docker tags:

```sh
echo "Here in romantest.txt" > romantest.txt
docker build -t romantest:1.2.1 .
docker run -it romantest:latest cat romantest.txt
docker run -it romantest:1.2.1 cat romantest.txt
```

Running a server:

```sh
docker run -it --rm romantest:latest
docker run -it --rm -p 8279:8279 romantest:latest
docker run -it --rm -v $(pwd):/var/www -p 8279:8279 romantest:latest
docker run -d --rm -v $(pwd):/var/www -p 8279:8279 romantest:latest
```

Logs:

```sh
docker logs -f <container_id>
```

Connect to container:

```sh
docker exec -it <container_id> /bin/bash
docker attach <container_id>
```

Running scripts:

```sh
docker run -v $(pwd):/var/www romantest:latest ls
docker run --rm -v $(pwd):/var/www romantest:latest composer lint
```

Environment variables:

```sh
docker run --rm -v $(pwd):/var/www romantest:latest /bin/bash -c "env | grep EXAMPLE_ENV"
docker run --rm --env EXAMPLE_ENV=bar -v $(pwd):/var/www romantest:latest /bin/bash -c "env | grep EXAMPLE_ENV"
```

Build arguments:

```sh
docker run --rm -v $(pwd):/var/www romantest:latest /bin/bash -c "env | grep EXAMPLE_ENV"
docker run --rm --env EXAMPLE_ENV=bar -v $(pwd):/var/www romantest:latest /bin/bash -c "env | grep EXAMPLE_ENV"
```

Docker Compose:

```sh
docker-compose build                    # Equivalent: docker build -t romantest:latest .
docker-compose run romantest /bin/bash  # Equivalent: docker run -it -v $(pwd):/var/www romantest:latest /bin/bash
docker-compose up                       # Equivalent: docker run -it --rm -v $(pwd):/var/www -p 8279:8279 romantest:latest
docker-compose up -d                    # Equivalent: docker run -d --rm -v $(pwd):/var/www -p 8279:8279 romantest:latest
```
