#!/usr/bin/env bash

# docker compose up with -d flag for in background
docker-compose up --detach

# poll if db exists
canConnect=false
while [ "$canConnect"=false ] ; do
	result=$(docker container exec -i mercato_db psql -h localhost -U integration_user -d integration_db -lqt | cut -f 1 -d \| | grep -e "integration_db")
	printf "."
 	if [[ "integration_db"="$result" ]]
	then	
 		canConnect=true
		break
 	fi	
done

# if it does not start properly or in more complex scenarios use also polling for the api with a curl command

# insert 3 entities and print status code to stdout

curl -s -o /dev/null -w "%{http_code}" -X POST -d '{"identifier" : "entity_1", "isactive" : true}' -H "Cache-Control: no-cache" -H "Content-Type: application/json" http://localhost:5000/api/values
echo ""
curl -s -o /dev/null -w "%{http_code}" -X POST -d '{"identifier" : "entity_2", "isactive" : true}' -H "Cache-Control: no-cache" -H "Content-Type: application/json" http://localhost:5000/api/values
echo ""
curl -s -o /dev/null -w "%{http_code}" -X POST -d '{"identifier" : "entity_3", "isactive" : true}' -H "Cache-Control: no-cache" -H "Content-Type: application/json" http://localhost:5000/api/values
echo ""

# get model values and print to stdout
model=$(curl http://localhost:5000/api/values)
echo $model

# kill containers:
docker-compose down
