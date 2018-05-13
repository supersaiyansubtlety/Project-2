var express = require('express');
var router = express.Router();
var weapons_dal = require('../dal/weapons_dal');

/* GET home page. */
router.get('/', function(req, res) {
    res.redirect(302,'/all_weapons')
});

router.get('/all_weapons', function(req, res) {
    weapons_dal.getAll(function (err,result) {
        if (err) {
            console.log(err);
            res.send(err);
        }
        else {
            /*console.log(result);*/
            res.render('weapons/weapons_view_all', {weapons: result});
        }
    })
});

router.get('/insert', function (req, res) {
    weapons_dal.insert(req.query, function(err){
        if (err){
            console.log(err);
            res.send(err);
        }
        else {
            res.redirect(302,'/all_weapons')
        }
    });
});

router.get('/weapon', function(req, res) {
    weapons_dal.getinfo(req.query.wep_name, req.query.wep_infusion, function(err, result) {
        /*console.log(wep_name);
        console.log(wep_infusion);*/
        if (err) {
            console.log(err);
            res.send(err);
        } else {
            res.render('weapons/weapon_detail', {weapon: result[0]});
        }
    });
});

module.exports = router;