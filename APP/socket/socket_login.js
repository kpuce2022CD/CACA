const { json } = require('express');
const shell = require('shelljs')
var express = require('express');
const { syncBuiltinESMExports } = require('module');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io')(server);

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
    
    
    //로그인
    socket.on('login', function(data){

        var jsonLogin = JSON.parse(data);
        console.log(jsonLogin);

        var login_result = loginService(jsonLogin.user_id, jsonLogin.user_pw);
        console.log(login_result);

             
        connections.splice(connections.indexOf(socket),1);
    });

    //회원가입
    socket.on('signup', function(data){

        // console.log(data);
        var jsonSignup = JSON.parse(data);
        console.log(jsonSignup);


        var signup_result = signupService(jsonSignup.user_id, jsonSignup.user_pw, jsonSignup.user_name, jsonSignup.user_email);
        console.log(signup_result);

        connections.splice(connections.indexOf(socket),1);
    
    });

    //사용자 초대하기
    socket.on('invite', function (data) {

        console.log(data);
        var jsonInvite = JSON.parse(data);
        console.log(jsonInvite);
        // service_invite(email, repo_name)

        connections.splice(connections.indexOf(socket), 1);

    });

    //레포지토리 생성
    socket.on('createRepo', function (data) {

        console.log(data);
        var jsonRepo = JSON.parse(data);
        console.log(jsonRepo);


        RepoService(jsonRepo.user_id, jsonRepo.repo_name, jsonRepo.Repo_ec2_ip, jsonRepo.directory_path)

        // ec2에 레포지토리 추가

        var mkdir = "mkdir /var/www/html/git-repositories/" + jsonRepo.repo_name + ".git"
        if(shell.exec('ssh -i \"/Users/jiyoung/Downloads/CLONET.pem\" ubuntu@' + jsonRepo.Repo_ec2_ip + ' "' + mkdir + '\"').code !== 0) {
            shell.echo('Error: command failed')
           
        } 

        var bare = "git init --bare /var/www/html/git-repositories/" + jsonRepo.repo_name + ".git"
        if(shell.exec('ssh -i \"/Users/jiyoung/Downloads/CLONET.pem\" ubuntu@' + jsonRepo.Repo_ec2_ip + ' \"' + bare + '\"').code !== 0) {
            shell.echo('Error: command failed')
            
        }

        var readMe = "touch /var/www/html/git-repositories/" + jsonRepo.repo_name + ".git" + "/readME.text"
        if(shell.exec('ssh -i \"/Users/jiyoung/Downloads/CLONET.pem\" ubuntu@' + jsonRepo.Repo_ec2_ip + ' \"' + readMe + '\"').code !== 0) {
            shell.echo('Error: command failed')
        }
        ////////////
        connections.splice(connections.indexOf(socket), 1);

    });
});



var mysql = require("mysql"); // mysql 모듈을 불러옵니다.
var userMember = "";        //유저 회원의 정보를 저장


function loginService(id, pw){

    // 커넥션을 정의합니다.
    // RDS Console 에서 본인이 설정한 값을 입력해주세요.
    var con = mysql.createConnection({
      host: "-",
      user: "admin",
      password: "-",
      database: "clonet_database"
  });

    // var login_result = "err";
    var query = "SELECT user_id, user_pw FROM user " + "where user_id = \'" + id + "\' " +  "and user_pw = \'" + pw + "\'" ;
    
    // RDS에 접속합니다.
    con.connect(function(err) {
        if (err) {
            console.log("database connection err")
            // return "err" // throw err; // 접속에 실패하면 에러를 throw 합니다.
        } else { // 접속시 쿼리를 보냅니다.
            // console.log("before");
            // setTimeout(() => console.log("after"), 3000);
            con.query(query, function(err, rows, fields) {
                console.log("rows : " + String(rows))
                console.log("rows : " + rows)
                console.log("err : " + err)
                console.log("fields : " + fields)

                if(String(rows) == "[object Object]"){
                    console.log("--COMPLETE--")
                    io.sockets.emit("login_result", {login_RESULT: 'TRUE'});
                    con.end();
                    console.log("--db-end--")
                    return "COMPLETE"
                }else{
                    io.sockets.emit("login_result", {login_RESULT: 'FALSE'});
                    con.end();
                    console.log("--db-end--")
                    return "false"
                }
            });
            }
    });
}

//
function signupService(id, pw, name, email) {

    // 커넥션을 정의합니다.
    // RDS Console 에서 본인이 설정한 값을 입력해주세요.
    var con = mysql.createConnection({
      host: "-",
      user: "admin",
      password: "-",
      database: "clonet_database"
  });


    var query = "INSERT INTO user (user_id, user_pw, user_name, user_email) VALUES (\""+id+"\", \""+pw+"\", \""+name+"\", \""+email+"\")";
    
    console.log("SignUp Query: " + query);

    con.connect(function(err) {
        if (err) {
        //   throw err; // 접속에 실패하면 에러를 throw 합니다.
            console.log("error connection DB")
            // return errorMsg;
        } else {
          // 접속시 쿼리를 보냅니다.
            con.query(query, function(err, rows, fields) {
                console.log("rows : " + String(rows))
                console.log("rows : " + rows)
                console.log("err : " + err)
                console.log("fields : " + fields)

                if(String(rows) == "[object Object]"){
                    console.log("--COMPLETE--")
                    io.sockets.emit("signup_result", {signup_RESULT: 'TRUE'});
                    con.end();
                    console.log("--db-end--")
                    create_iam_user(id)
                    console.log("--iam create user complete--")
                    return "COMPLETE"
                }else{
                    io.sockets.emit("signup_result", {signup_RESULT: 'FALSE'});
                    con.end();
                    console.log("--db-end--")
                    return "false"
                }

            });
        }
      });
}


function create_iam_user(iam_name) {
    var AWS = require('aws-sdk');
    AWS.config.loadFromPath('./config.json');

    var iam = new AWS.IAM({ apiVersion: '2010-05-08' });
    var params = {
        UserName: iam_name
    };
    iam.createUser(params, function (err, data) {
        if (err) console.log(err, err.stack); // an error occurred
        else console.log(data);           // successful response
    });
}


//사용자 추가 이메일 발송

function service_invite(email, repo_name){
  var nodemailer = require('nodemailer');
  
  let transporter = nodemailer.createTransport({
      service: 'gmail',
      auth:{
          user: 'CACAClonet@gmail.com',
          pass: 'qwer1234$'
      }
  });

  console.log("sendEMail --------- "+email+dataList);
  
  var mailOptions = {
      from: 'CACACLONET@gmail.com',
      to: email,
      subject: 'Welcome Clonet',
      text: email + "\n" + dataList
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




//레포지토리 생성
function RepoService(id, repo_name, repo_ec2_ip, directory_path) {

    // 커넥션을 정의합니다.
    // RDS Console 에서 본인이 설정한 값을 입력해주세요.
    var con = mysql.createConnection({
      host: "-",
      user: "admin",
      password: "-",
      database: "clonet_database"
  });

    var query = "INSERT INTO repository (repo_name, repo_ec2_ip, directory_path) VALUES (\""+repo_name+"\", \""+repo_ec2_ip+"\", \""+directory_path+"\");";

    console.log("Query: " + query);

    con.connect(function(err) {
        if (err) {
        //   throw err; // 접속에 실패하면 에러를 throw 합니다.
            console.log("error connection DB")
            // return errorMsg;
        } else {
          // 접속시 쿼리를 보냅니다.
            con.query(query, function(err, rows, fields) {
                console.log("rows : " + String(rows))

                if(String(rows) == "[object Object]"){
                    var result = Repo_UserService(id, repo_name)
                    if(result == "COMPLETE"){
                        console.log("--COMPLETE--")
                        
                        


                        
                        io.sockets.emit("createRepo", {repo_RESULT: 'TRUE'});
                        con.end();
                        return "COMPLETE"
                    } else{
                        return "false"
                    }
                    
                }else{
                    io.sockets.emit("createRepo", {repo_RESULT: 'FALSE'});
                    con.end();
                    console.log("--db-end--")
                    return "false"
                }

            });
        }
      });
}

//레포지토리 사용자추가
function Repo_UserService(id, repo_name) {

    // 커넥션을 정의합니다.
    // RDS Console 에서 본인이 설정한 값을 입력해주세요.
    var con = mysql.createConnection({
      host: "-",
      user: "admin",
      password: "-",
      database: "clonet_database"
  });

    var query = "INSERT INTO mapping_repo_user (user_id, repo_name) VALUES (\""+id+"\", \""+repo_name+"\");";

    console.log("SignUp Query: " + query);

    con.connect(function(err) {
        if (err) {
        //   throw err; // 접속에 실패하면 에러를 throw 합니다.
            console.log("error connection DB")
            // return errorMsg;
        } else {
          // 접속시 쿼리를 보냅니다.
            con.query(query, function(err, rows, fields) {
                console.log("rows : " + String(rows))
                // console.log("rows : " + rows)
                // console.log("err : " + err)
                // console.log("fields : " + fields)

                if(String(rows) == "[object Object]"){
                    console.log("--COMPLETE--")
                    io.sockets.emit("repo_map_RESULT", {signup_RESULT: 'TRUE'});
                    con.end();
                    return "COMPLETE"
                }else{
                    io.sockets.emit("repo_map_RESULT", {signup_RESULT: 'FALSE'});
                    con.end();
                    console.log("--db-end--");
                    return "false"
                }

            });
        }
      });
}





function create_iam_user(iam_name) {
    var AWS = require('aws-sdk');
    AWS.config.loadFromPath('./config.json');

    var iam = new AWS.IAM({ apiVersion: '2010-05-08' });
    var params = {
        UserName: iam_name
    };
    iam.createUser(params, function (err, data) {
        if (err) console.log(err, err.stack); // an error occurred
        else console.log(data);           // successful response
    });
}
