// connect with iOS

var express = require('express');
const { getMaxListeners } = require('process');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io')(server);

connections = [];

function sleep(ms) {
    const wakeUpTime = Date.now() + ms;
    while (Date.now() < wakeUpTime) {}
  }

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
        io.sockets.emit('iOS Client Port', {msg: data});
    });

    // 이메일 수신
    socket.on('EmailAddr', function(data){
        var rcvEmail = data
        console.log(rcvEmail);
        setMail(rcvEmail);
    });
});

function setMail(email){
    // DB 연결, 비밀번호 가져옴
    var mysql = require("mysql");
    var result = "";
    var dataList = "";

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
        // SELECT id FROM info WHERE name ='$name' and email='$email'
        //var email = "user1@gmail.com";
        var emailQuery = "SELECT user_pw FROM user WHERE user_email=?";

        console.log("connection: "+email)

        connection.query(emailQuery,email, function(err, result, fields) {
            console.log(result);
            dataList = result.user_pw;
            for (var data of result){
                //console.log(data.user_pw);
                dataList = data.user_pw;
            };
            console.log("query!!!!!!!!!!!!!!!!!!!!!!!! " + dataList);
            sendMail(email, dataList);
        });
        }

    });

}

// send mail
function sendMail(email, dataList){
    var nodemailer = require('nodemailer');

    // 사용자에게 메일 전송

    //require('dotenv').config();
    //const hbs = require('nodemailer-express-handlebars')

    
    let transporter = nodemailer.createTransport({
        service: 'gmail',
        auth:{
            user: 'CACAClonet@gmail.com',
            pass: '-'
            //user: process.env.EMAIL,
            //pass: process.env.PASSWORD
        }
    });
    
    // transporter.use('compile',hbs({
    //     viewEngine: 'express-handlebars',
    //     viewPath: './views/'
    // }));

    console.log("sendEMail --------- "+email+dataList);
    
    var mailOptions = {
        from: 'CACACLONET@gmail.com',
        to: email,
        subject: 'Find PASSWORD',
        text: email + "의 비밀번호: " + dataList
        //template: 'index'
    };
    
    transporter.sendMail(mailOptions, function(err, info){
        if(err){
            console.log('Error: ',err);
        }else {
            console.log('Message send !!!! ' + email);
        }
    });    
};
