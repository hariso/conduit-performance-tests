# conduit-performance-tests


**Notes**:

1. way to generate data
2. snapshot vs cdc
3. data variety
4. kafka destination topic:
	* batching
	* compression


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
