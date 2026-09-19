# NodeGoat Container Baseline

## Owner

Member 1 — Project Leader

## Objective

Run the original OWASP NodeGoat application using Docker without
applying vulnerability remediation.

## Components

### Web Application

Technology:

- Node.js
- Express.js

Build context:

app/

Host endpoint:

http://127.0.0.1:4000

### Database

Technology:

MongoDB

Docker image:

mongo:4.4

The database is available to the NodeGoat container through the
internal Docker network.

MongoDB is not directly published to the host.

## Application-to-Database Connection

NodeGoat uses:

mongodb://mongo:27017/nodegoat

Docker Compose provides service-name DNS resolution so that the
hostname:

mongo

resolves to the MongoDB container.

## Data Flow

User Browser
    |
    | HTTP
    v
127.0.0.1:4000
    |
    v
NodeGoat Web Container
    |
    | MongoDB protocol / TCP 27017
    v
MongoDB Container

## Security Boundary

The intentionally vulnerable web application is bound to localhost:

127.0.0.1

This prevents intentional exposure through the normal Compose
configuration to other network hosts.

## Vulnerable Baseline

No vulnerability remediation has been performed during this phase.

The original application is preserved under:

app/

The original application version is preserved by:

vulnerable-baseline

## Verification

The following checks must pass:

- Docker service running
- Web container running
- MongoDB container running
- Web container can reach MongoDB
- MongoDB responds to requests
- NodeGoat responds on localhost:4000
- NodeGoat source remains unchanged from vulnerable-baseline

## Evidence

Evidence is stored under:

docs/report-evidence/02-docker/baseline/

