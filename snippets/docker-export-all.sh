#!/bin/bash

CONTAINER_NAMES=$(docker ps -a --format '{{.Names}}')
DATA_CONTAINERS=$(docker volume ls --format '{{.Name}}')

for container in $CONTAINER_NAMES; do
	echo "exporting container $container..."
	docker export $container -o "$container.tar"
	echo "...done!"
done

re='^[0-9]+$'

for data in $DATA_CONTAINERS; do
	if ! [[ $data =~ $re ]] ; then
		echo "exporting data $data"
		docker run  --rm -v $data:/volume busybox sh -c 'tar -cOzf - /volume' > "$data.tgz"
	else
		echo "skipping Rancher Data $data"
	fi
done
