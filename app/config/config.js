const _ = require("underscore");
const path = require("path");
const util = require("util");

const finalEnv = process.env.NODE_ENV || "development";

const allConf = require(path.resolve(__dirname + "/../config/env/all.js"));
const envConf = require(path.resolve(__dirname + "/../config/env/" + finalEnv.toLowerCase() + ".js")) || {};

const config = { ...allConf, ...envConf };

console.log(`Current Config:`);
console.log(util.inspect(config, false, null));

module.exports = {
    cookieSecret: process.env.SESSION_SECRET || "dev-only-fallback-secret",
    db: process.env.MONGODB_URI || "mongodb://mongo:27017/nodegoat",
    port: process.env.PORT || 4000
};

