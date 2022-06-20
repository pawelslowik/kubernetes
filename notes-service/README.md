**notes-service**

A dummy service that provides a REST interface for CRUD operations for notes (containing text message and ISO-8601 timestamp)
persisted in Mongo. The purpose of this project is to have something to deploy and run in Kubernetes with Mongo.
Project directory contains docker sub-directory with Dockerfile, file is filtered by Maven in build time so runnable version is in target.
The same directory contains docker-compose.yml for running locally, which requires exporting respective environment variables before running.
For simplicity docker-compose uses default ports and admin database.

**build and run**

1. mvn clean install
2. cd target
3. docker build -t notes-service . (or skip it and just let docker-compose use the image that is now available in https://hub.docker.com/repository/docker/pawelslowikdev/notes-service)
4. export MONGO_INITDB_ROOT_USERNAME=`<value>` MONGO_INITDB_ROOT_PASSWORD=`<value>`
5. docker-compose up

**usage**

Use any REST client to perform CRUD operations with http://localhost:8080/notes, e.g. POST
`{
	"timestamp": "2022-06-01T12:12:12.000",
	"message": "It's just a message"
}`