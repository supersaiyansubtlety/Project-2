var mysql = require('mysql');
var db = require('./db_connection.js');

var connection = mysql.createConnection(db.config);

exports.getAll = function(callback) {
    var query = 'SELECT * FROM All_Weapons;';

    connection.query(query, function (err, result) {
        callback(err, result);
    })
};

exports.insert = function (params, callback) {
    var query = "CALL insert_wep_data(?,?,?,?,?,?,? ,0,0,0,0,0 ,?,?,?,?,?, ?,?,?,? ,?,?,?,? ,0,0,0,0,0)";
    var queryData = [
        params.New_Wep_Name, params.New_Wep_Infus, params.New_Wep_Class,
        params.New_Wep_Crit, params.New_Wep_Dur, params.New_Wep_Weight, params.New_Is_Scale_Up,
        params.New_Phy_Dmg, params.New_Mag_Dmg, params.New_Fir_Dmg, params.New_Lit_Dmg, params.New_Drk_Dmg,
        params.New_Str_Grad, params.New_Dex_Grad, params.New_Int_Grad, params.New_Fat_Grad,
        params.New_Str_Req, params.New_Dex_Req, params.New_Int_Req, params.New_Fat_Req
    ];

    connection.query(query, queryData, function (err, result) {
        callback(err,result);
    });
};

exports.getinfo = function (Wep_Name, Wep_Infus, callback) {
    var query = "CALL get_wep_info(?,?)";
    var queryData = [Wep_Name, Wep_Infus];
    /*console.log(query);
    console.log(queryData);*/
    connection.query(query, queryData, function (err, result) {
        callback(err,result);
    });
};