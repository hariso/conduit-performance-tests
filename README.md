# conduit-performance-tests

This repository contains a Docker setup that runs a Conduit and Kafka Connect pipeline, with the goal

**Notes**:

1. way to generate data
2. snapshot vs cdc
3. data variety
4. kafka destination topic:
	* batching
	* compression
5. for mongodb, init containers worked better than init scripts in containers
6. disable schema extraction


**To-dos**:
1. reduce opencdc records so that dbz and conduit records look similar
2. use built-in
3. update conduit example: https://conduit.io/docs/using/connectors/additional-built-in-plugins
4. test the kafka connector's performance (stretch goal?)

**Commands**:

- Add following to `/etc/hosts` so that it's easier to work with `mongosh`:
  ```
  127.0.0.1   mongo1
  127.0.0.1   mongo2
  127.0.0.1   mongo3
  ```
- create new connector:
  ```shell
  curl -X POST -H "Content-Type: application/json" --data @mongo-connector.json http://localhost:8083/connectors | jq .
  ```

- update connector:
  ```shell
  http PUT localhost:8083/connectors/mongodb-source-users/config @updated-mongo-connector.json
  ```

**Results**:

- Conduit snapshot, 6.7 MB/s
- Dbz CDC, 12.8 MB/s
