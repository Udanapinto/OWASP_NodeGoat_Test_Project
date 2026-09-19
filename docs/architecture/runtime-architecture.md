# NodeGoat Runtime Architecture

## Owner

Member 1 — Project Leader

## Purpose

This diagram represents the currently implemented local Docker
architecture of the IE3142 NodeGoat DevSecOps project.

It represents the current runtime only.

Future CI/CD, Vault and security scanning components are intentionally
not represented as implemented components at this stage.

## Architecture Diagram

```mermaid
flowchart LR

    USER["Local User / Browser"]

    subgraph LAB["Authorized Local Ubuntu Lab"]

        HOST["127.0.0.1:4000\nPublished Host Endpoint"]

        subgraph APP["TB1 — Application Trust Zone"]
            WEB["web\nOWASP NodeGoat\nNode.js + Express\nContainer Port 4000"]
        end

        subgraph DATA["TB2 — Data Trust Zone"]
            DB[("mongo\nMongoDB 4.4\nTCP 27017")]
        end

    end

    USER -->|"DF1 — HTTP requests / responses"| HOST

    HOST -->|"Docker port mapping"| WEB

    WEB -->|"DF2 — MongoDB protocol\nmongodb://mongo:27017/nodegoat"| DB
