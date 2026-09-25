const {
    BenefitsDAO
} = require("../data/benefits-dao");
const {
    environmentalScripts
} = require("../../config/config");

function BenefitsHandler(db) {
    "use strict";

    const benefitsDAO = new BenefitsDAO(db);

    //member 4
    this.displayBenefits = (req, res, next) => {
        if (!req.session.userId) {
            return res.redirect("/login");
        }
        userDAO.getUserById(req.session.userId, (err, user) => {
            if (err) return next(err);
            if (!user || !user.isAdmin) {
                return res.status(403).render("403");
            }
            benefitsDAO.getAllNonAdminUsers((error, users) => {
                if (error) return next(error);
                return res.render("benefits", { users, user: { isAdmin: true } });
            });
        });
    };

    //member 4
    this.updateBenefits = (req, res, next) => {
        if (!req.session.userId) {
            return res.redirect("/login");
        }
        userDAO.getUserById(req.session.userId, (err, user) => {
            if (err) return next(err);
            if (!user || !user.isAdmin) {
                return res.status(403).render("403");
            }

            // old update code Admin Check run inside
            benefitsDAO.updateBenefits(
                req.body.userId,
                req.body.benefitStartDate,
                (error) => {
                    if (error) return next(error);
                    return res.redirect("/benefits");
                }
            );
        });
    };
}

module.exports = BenefitsHandler;
