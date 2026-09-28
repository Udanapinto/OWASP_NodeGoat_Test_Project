"use strict";

const express = require("express");
const favicon = require("serve-favicon");
const bodyParser = require("body-parser");
const session = require("express-session");
const consolidate = require("consolidate");
const swig = require("swig");
const MongoClient = require("mongodb").MongoClient;
const http = require("http");
const marked = require("marked");
const app = express();
const routes = require("./app/routes");
const { port } = require("./config/config");
const { loadSecrets } = require("./vault-loader");

// Wrap the entire startup in the Vault secret loader
loadSecrets().then(() => {
    const mongoUri = process.env.MONGODB_URI || "mongodb://mongo:27017/nodegoat";

    MongoClient.connect(mongoUri, (err, db) => {
        if (err) {
            console.log("Error: DB: connect");
            console.log(err);
            process.exit(1);
        }
        console.log(`Connected to the database`);

        app.use(favicon(__dirname + "/app/assets/favicon.ico"));
        app.use(bodyParser.json());
        app.use(bodyParser.urlencoded({ extended: false }));

        app.use(session({
            secret: process.env.SESSION_SECRET || "dev-only-fallback-secret",
            saveUninitialized: true,
            resave: true,
            cookie: {
                httpOnly: true,
                secure: process.env.NODE_ENV === "production",
                sameSite: "strict",
                maxAge: 1000 * 60 * 60
            }
        }));

        app.engine(".html", consolidate.swig);
        app.set("view engine", "html");
        app.set("views", `${__dirname}/app/views`);
        app.use(express.static(`${__dirname}/app/assets`));

        marked.setOptions({ sanitize: true });
        app.locals.marked = marked;

        routes(app, db);

        swig.setDefaults({ autoescape: true });

        http.createServer(app).listen(port, () => {
            console.log(`Express http server listening on port ${port}`);
        });
    });
});
