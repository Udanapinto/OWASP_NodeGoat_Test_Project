# Architecture Component Inventory

| ID | Component | Technology | Exposure | Main Responsibility |
|---|---|---|---|---|
| C1 | Local Browser | Web browser | Local user | User interaction |
| C2 | Host endpoint | Ubuntu loopback | 127.0.0.1:4000 | Forward HTTP traffic |
| C3 | NodeGoat web | Node.js / Express | Docker + host port | Web/business logic |
| C4 | MongoDB | MongoDB 4.4 | Docker internal network | Persistent application data |

## Implemented Data Flows

| ID | Source | Destination | Protocol |
|---|---|---|---|
| DF1 | Browser | NodeGoat | HTTP |
| DF2 | NodeGoat | MongoDB | MongoDB/TCP |

## Defined Trust Boundaries

| ID | Boundary |
|---|---|
| TB1 | User / Browser → NodeGoat application |
| TB2 | NodeGoat application → MongoDB data store |
