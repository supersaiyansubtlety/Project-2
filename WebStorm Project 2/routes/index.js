var express = require('express');
var router = express.Router();
var weapons_dal = require('../dal/weapons_dal');
var sql_demos_dal = require('../dal/sql_demos_dal');

console.log('index.js:');

/* GET home page. */
router.get('/', function(req, res) {
    res.render('index', {title: "my title"})
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

router.get('/update', function (req, res) {
    weapons_dal.update(req.query, function(err){
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
            res.render('weapons/weapon_detail', {weapon: result[0][0]});
        }
    });
});

////SQL DEMOS////
router.get('/correlated', function(req, res) {
    sql_demos_dal.get_demo_view('correlated_subQ', function (err,result) {
        if (err) {
            console.log(err);
            res.send(err);
        }
        else {
            res.render('sql_demos/correlated_subQ', {weapons: result});
        }
    })
});

router.get('/distinct', function(req, res) {
    sql_demos_dal.get_demo_view('Q_DISTINCT', function (err,result) {
        if (err) {
            console.log(err);
            res.send(err);
        }
        else {
            res.render('sql_demos/Q_DISTINCT', {weapons: result});
        }
    })
});

router.get('/group', function(req, res) {
    sql_demos_dal.get_demo_view('Q_GROUP', function (err,result) {
        if (err) {
            console.log(err);
            res.send(err);
        }
        else {
            res.render('sql_demos/Q_GROUP', {weapons: result});
        }
    })
});

router.get('/join-group-having-derived', function(req, res) {
    sql_demos_dal.get_demo_view('JOIN_GROUP_HAVING_derived', function (err,result) {
        if (err) {
            console.log(err);
            res.send(err);
        }
        else {
            res.render('sql_demos/Q_JOIN_GROUP_HAVING_derived', {weapons: result});
        }
    })
});

router.get('/order', function(req, res) {
    sql_demos_dal.get_demo_view('Q_ORDER', function (err,result) {
        if (err) {
            console.log(err);
            res.send(err);
        }
        else {
            res.render('sql_demos/Q_ORDER', {weapons: result});
        }
    })
});

router.get('/union', function(req, res) {
    sql_demos_dal.get_demo_view('Q_UNION', function (err,result) {
        if (err) {
            console.log(err);
            res.send(err);
        }
        else {
            res.render('sql_demos/Q_UNION', {weapons: result});
        }
    })
});

router.get('/in-n-out', function(req, res) {
    sql_demos_dal.get_demo_view('subQ_in_n_out', function (err,result) {
        if (err) {
            console.log(err);
            res.send(err);
        }
        else {
            res.render('sql_demos/subQ_in_n_out', {weapons: result});
        }
    })
});

router.get('/join', function(req, res) {
    sql_demos_dal.get_demo_view('subQ_in_JOIN', function (err,result) {
        if (err) {
            console.log(err);
            res.send(err);
        }
        else {
            res.render('sql_demos/subQ_in_JOIN', {weapons: result});
        }
    })
});

router.get('/exists', function(req, res) {
    sql_demos_dal.get_demo_view('subQ_not_EXISTS', function (err,result) {
        if (err) {
            console.log(err);
            res.send(err);
        }
        else {
            res.render('sql_demos/subQ_not_EXISTS', {weapons: result});
        }
    })
});

router.get('/in', function(req, res) {
    sql_demos_dal.get_demo_view('subQ_not_IN', function (err,result) {
        if (err) {
            console.log(err);
            res.send(err);
        }
        else {
            res.render('sql_demos/subQ_not_IN', {weapons: result});
        }
    })
});

module.exports = router;