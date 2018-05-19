var mysql = require('mysql');
var db = require('./db_connection.js');

var connection = mysql.createConnection(db.config);

exports.get_demo_view = function (SQLview, callback) {
    var query = "SELECT * FROM ??;";
    var queryData = SQLview;

    connection.query(query, queryData, function (err, result) {
        callback(err,result);
    });
};