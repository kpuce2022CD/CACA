// connect with iOS

var express = require('express');
const { syncBuiltinESMExports } = require('module');
const { getMaxListeners } = require('process');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io')(server);

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

    // ID 찾기
    socket.on('IDEmail', function(data){
        // var rcvEmail = data
        var op = "1"
        // console.log(rcvEmail);
        DBQuery(data,op);

        connections.splice(connections.indexOf(socket),1);

        // console.log("before");
        // setTimeout(() => console.log("after"), 2000);   
    });

    // 이메일 수신
    socket.on('EmailAddr', function(data){
        var rcvEmail = data
        var op = "2"
        console.log(rcvEmail);
        DBQuery(rcvEmail,op);

        console.log("before");
        setTimeout(() => console.log("after"), 2000);   
    });

});

function DBQuery(email, op){
    // DB 연결, 비밀번호 가져옴
    var mysql = require("mysql");
    // var EmailID = "";
    // var dataList = "";

    // console.log("zzzzxfsfafsdfasfsd" + op);

    var con = mysql.createConnection({
        host: "-",
        user: "-",
        password: "-",
        database: "-"
    });
    
    // RDS에 접속합니다.
    con.connect(function(err) {
        if (err) {
            console.log("err")
            // throw err; // 접속에 실패하면 에러를 throw 합니다.
        } else {
            // 접속시 쿼리를 보냅니다.
            // SELECT id FROM info WHERE name ='$name' and email='$email'
            //var email = "saidakin7@gmail.com";
            var emailQuery = "SELECT user_id, user_pw FROM user WHERE user_email=?";
        
            console.log("connection: " + email)
        
            con.query(emailQuery, email, function(err, result, fields) {
                //console.log("%o ^^^^", result.user_id)
                //console.log("rows : " + String(JSON.stringify(result.user_id)))
                console.log("rows : " + JSON.stringify(result))
                console.log("err : " + err)
                console.log("fields : " + fields)

                if(String(result) == "[object Object]"){
                    console.log("--COMPLETE--")
                    io.sockets.emit("find_result", {find_RESULT: result});
                    con.end();
                    console.log("--db-end--")
                    return "COMPLETE"
                }else{
                    io.sockets.emit("find_result", {find_RESULT: 'FALSE'});
                    con.end();
                    console.log("--db-end--")
                    return "false"
                }

               
                // console.log(result);
                //     dataList = result.user_pw;
                //     EmailID = result.user_id;
                //     for (var data of result){
                //         //console.log(data.user_pw);
                //         dataList = data.user_pw;
                //         EmailID = data.user_id;
                // };
                // console.log("query!!!!!!!! " + dataList + " !!!!!!!! " + EmailID);
                // if(result == ""){ // DB에 데이터가 존재하지 않을 시
                //     IDmatch("noDBDATA");
                //     NOPASSWD();
                // } else{
                //     if(op == "1"){ // id 찾기

                //         // IDmatch(EmailID);
                //     }else if(op == "2"){ // 비밀번호 찾기
                //         sendMail(email, dataList);
                //     }
                // }
                // con.end();
            });

        }
    
    });

    //connection.end();
    console.log("connection ended");

}

// return ID
function IDmatch(id){ ////////////
    if(id == "noDBDATA"){
        console.log("ID match false");
        io.sockets.emit('FindID', {msg: 'false'});
        console.log("전송 완");
    }else{
        console.log("ID match true" + id);
        io.sockets.emit('FindID', {msg: id});
        console.log("전송 완");
    }
}

function NOPASSWD(){
    console.log("NO EMAIL & PASSWD");
        io.sockets.emit('FindPW', {msg: 'false'});
        console.log("전송 완");
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



