# docker

https://ugolok.vercel.app/books/docker/use_docker.pdf

docker run debian echo "Hello World"

docker run -i -t debian /bin/bash

exit

docker run -h CONTAINER -i -t debian /bin/bash

docker ps

docker rm

docker rm -v $(docker ps -aq -f status=exited)

docker run -it --name cowsay --hostname cowsay debian bash

apt-get update

apt-get install -y cowsay fortune

