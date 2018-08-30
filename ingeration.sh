#!/usr/bin/env bash

# docker compose up with -d flag for in background
docker-compose up --detach

# simple wait for compose to run to end
sleep 1.5s

# insert 3 entities and print status code to stdout

curl -s -o /dev/null -w "%{http_code}" -X POST -d '{"identifier" : "entity_1", "isactive" : true}' -H "Cache-Control: no-cache" -H "Content-Type: application/json" http://localhost:5000/api/values
echo ""
curl -s -o /dev/null -w "%{http_code}" -X POST -d '{"identifier" : "entity_2", "isactive" : true}' -H "Cache-Control: no-cache" -H "Content-Type: application/json" http://localhost:5000/api/values
echo ""
curl -s -o /dev/null -w "%{http_code}" -X POST -d '{"identifier" : "entity_3", "isactive" : true}' -H "Cache-Control: no-cache" -H "Content-Type: application/json" http://localhost:5000/api/values
echo ""

# get model values and pritn to stdout
model=$(curl http://localhost:5000/api/values)
echo $model

# kill containers:
docker-compose down