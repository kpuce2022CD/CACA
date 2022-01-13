const { json } = require('express');
var express = require('express');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io')(server);

var loginJSON = "";// socket.io에서 받은 로그인 정보
var loginID = "";
var loginPW = "";


var mysql = require("mysql"); // mysql 모듈을 불러옵니다.


connections = [];

server.listen(process.env.PORT || 3000);
console.log('Server is running ...');

io.sockets.on('connection', function(socket){
    connections.push(socket);
    console.log('Connect: %s sockets are connected', connections.length);

    socket.on('disconnect', function(data){
        connections.splice(connections.indexOf(socket),1);
        console.log('Disconnect: %s sockets are connected', connections.length);
    });

    socket.on('NodeJS Server Port', function(data){
        console.log(data);
        // io.sockets.emit('iOS Client Port', {msg: 'Hi iOS Client'});
        io.sockets.emit('iOS Client Port', {msg: data});
    });
    
    
    //로그인
    socket.on('login', function(data){
        // io.sockets.emit('login', {msg: data});


        var jsonLogin = JSON.parse(data);
        console.log(jsonLogin);
        // console.log(jsonLogin.user_id);

        loginID = jsonLogin.user_id;
        loginPW = jsonLogin.user_pw;

        var message = loginService(loginID, loginPW);

        if(message=="login success"){
            io.sockets.emit('login', message );
        }
        connections.splice(connections.indexOf(socket),1);
    });

    // 회원가입
    socket.on('signup', function(data){
        // io.sockets.emit('login', {msg: data});


        var jsonLogin = JSON.parse(data);
        console.log(jsonLogin);
        // console.log(jsonLogin.user_id);

        loginID = jsonLogin.user_id;
        loginPW = jsonLogin.user_pw;

        var message = loginService(loginID, loginPW);

        if(message=="login success"){
            io.sockets.emit('login', message );
        }
        connections.splice(connections.indexOf(socket),1);
    });
});



var mysql = require("mysql"); // mysql 모듈을 불러옵니다.
var userMember = "";        //유저 회원의 정보를 저장

// 커넥션을 정의합니다.
// RDS Console 에서 본인이 설정한 값을 입력해주세요.
var connection = mysql.createConnection({
    host: "-",
    user: "-",
    password: "-",
    database: "clonet_database"
});

// RDS에 접속합니다.
connection.connect(function(err) {
  if (err) {
    throw err; // 접속에 실패하면 에러를 throw 합니다.
  } else {
    // 접속시 쿼리를 보냅니다.
    connection.query("SELECT * FROM user", function(err, rows, fields) {
      userMember = rows;        //멤버 정보 저장
    });
  }
});


function loginService(id, pw){

    var message = ""
    for(var i=0; i < userMember.length -1; i++){
        if(id == userMember[i].user_id && pw == userMember[i].user_pw) {
            console.log("login success");

            message = "login success";
        } 
    };

    return message;
}