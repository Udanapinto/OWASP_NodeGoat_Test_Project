# NodeGoat Data Flows

## Owner

Member 1 — Project Leader

## DF1 — Browser to NodeGoat

### Source

Local authorised user's web browser

### Destination

NodeGoat web service

### Endpoint

127.0.0.1:4000

### Protocol

HTTP

### Data

Possible application data includes:

- Login credentials
- Session cookie
- Profile fields
- Application form input
- Contribution/allocation input
- Navigation requests

### Trust Boundary

Crosses from the user/browser context into the NodeGoat application
trust zone.

### Security Importance

All browser-controlled input must be considered untrusted until it
has been validated and safely processed by the server.

---

## DF2 — NodeGoat to MongoDB

### Source

NodeGoat web container

### Destination

MongoDB container

### Destination Service

mongo:27017

### Connection

mongodb://mongo:27017/nodegoat

### Protocol

MongoDB database protocol over TCP

### Data

Possible application data includes:

- User accounts
- User profiles
- Application records
- Contributions
- Allocations
- Other NodeGoat database objects

### Trust Boundary

Crosses from application-processing logic into the data-storage
trust zone.

### Security Importance

Application-controlled database queries must enforce:

- Correct input handling
- Authorization
- Query safety
- Least privilege where applicable

---

## Exposure Summary

### Web Application

Published to:

127.0.0.1:4000

### MongoDB

Available internally to the Docker environment.

Not intentionally published as a host-accessible database service.
