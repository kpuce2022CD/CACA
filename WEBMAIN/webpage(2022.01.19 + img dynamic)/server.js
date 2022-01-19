var express = require("express");  // express 모듈 요청
var http = require("http")        // http 모듈 사용
var app = express();   // express 설정. (미들웨어 0)
var mysql = require('mysql');  // mysql 모듈 요청
const bodyParser = require('body-parser'); // POST 방식으로 전달하기 위하여 body-parser 모듈 필요함.
const crypto = require('crypto');  // 암호화 모듈
const router = express.Router();  // 라우터 설정
const fs = require('fs');   // 파일 읽어오기
const ejs = require('ejs')  // ejs 모듈 사용
// const FileStore = require('session-file-store')(session); // 세션을 파일에 저장
const path = require('path');   // 경로 모듈

var session = require('express-session');  // 세션 모듈 요청. (로그인 처리를 위함)
const cookieParser = require("cookie-parser");  // 쿠키 모듈 요청


var server = http.createServer(app);  // 포트 연결
server.listen(3000, function(){
  console.log('포트 3000 연결됨')
})

// 세션 사용 (미들웨어 1)
app.use(session({
	secret:'keyboard cat',  // 데이터 암호화에 필요한 옵션
	resave:false,           // 요청이 왔을 때 세션 수정하지 않더라도, 다시 저장소에 저장. (현재는 false 이므로 비활성화)
	saveUninitialize:true,   // 세션이 필요하면 세션을 실행시킨다.
  // store : new FileStore()  // 세션이 데이터를 저장하는 곳.
}));

// 정적 파일 설정 (미들웨어 2)
app.use(express.static("public"))  // 정적인 파일이 접근할 라우터 생성. public 이라는 디렉토리 아래 있는 데이터들은 웹브라우저 요청에 따라 서비스 제공.

// 정제 (미들웨어 3)
app.use(bodyParser.urlencoded({extended: false}));  // post 방식으로 접근하기 위한 모듈 사용
app.use(bodyParser.json());
app.use(cookieParser())  // 쿠키 (로그인 상태를 유지) 사용

// ejs 설정 4
app.set('views', __dirname + '\\views');
app.set('view engine','ejs');

/*
// 파일 맞게 읽고있는지 확인
fs.readFile('views/About.ejs',(err, data)=>{
    if(err){
        throw err;
    }
    console.log(data);
    console.log(data.toString());
});
*/

// 메인페이지 (내비게이션 바)
app.get('/',(req,res)=>{
  console.log('메인페이지 작동');
  console.log(req.session);
  if(req.session.is_logined == true){ // 로그인이 true 이면
      res.render('index',{
          is_logined : req.session.is_logined,
          name : req.session.name
      });
  }else{
      res.render('index',{
          is_logined : false
      });
  }
});

// DB 커넥션 정의. (미들웨어 4)
// RDS Console 에서 본인이 설정한 값을 입력해주세요.
connection = mysql.createConnection({   // host는 DB 주소 입력하는 곳.
  host: "",
  user: "admin",
  password: "qwer1234",
  database: "clonet_database",
});

// Login.ejs 불러오기
app.get('/login',(req, res)=>{
  res.render('login')
});

var io = require('socket.io')(server);  // 소켓 io http로
// socket.io 커넥션
io.on('connection', function (socket) {
  console.log(socket.id, 'Connected');

  // 중요 함수 socket.on (받기), socket.emit (보내기)
  // socket.on(이벤트명, 콜백함수). 해당 이벤트를 트리거로, 콜백함수 실행.

      // 1. Illustration 전용 소켓
      // 클라이언트로부터 메시지 수신 및 이메일로 유동적으로 판별
      socket.on('Email', function(data) {  // 데이터 받는 on 함수
                // console.log('서버에서 받은 이메일 :' + data)  // data1은 이메일
                var email_illust = data

              // Illustration 자리
              // Illustration.ejs 불러오기
              app.get('/Illustration',(req, res)=>{
                res.render('Illustration')
              })


              // illustCheck 페이지 불러오는 get
              app.get('/illustCheck', (req, res) => {
                res.render('illustCheck')
  
              })


              // illustCheck 페이지에서 체크한 이미지를 illustStored로 불러오는 코드
              app.get('/illustStored', (req, res) => {
                res.render('illustStored')  // 데이터를 승계한 상태로 불러올 수 있도록.
              })
      })


      // 2. About 전용 소켓
      // 클라이언트로부터 메시지 수신 및 이메일로 유동적으로 판별
      socket.on('Email', function(data1) {  // 데이터 받는 on 함수
                console.log('서버에서 받은 about 이메일 :' + data1)  // data1은 이메일
                var email = data1 // 로그인한 유저의 이메일 값인 data 변수로 초기화.
                // console.log(email)
                // About 페이지 DB에서 값 불러와서 수정 (편집 공간인 aboutEdit 사용)
                // About.ejs 불러오기
                app.get('/About',(req, res)=>{
                  fs.readFile('views/About.ejs', 'utf8', function (err, data) {  // about.ejs 파일을 읽어옴. (파일 경로/파일명 , 파일에 들어갈 내용)
                    connection.query("SELECT about FROM user where user_email = \'" + email + "\'", function (err, rows) {  // user1 자리에 있는건 유동적으로 바뀜.
                      // 들어온 user_id에 해당하는 사람의 about이 출력되어야 함.
                      // user_email 자리에는 소켓 통신으로 입력받은 값이 들어감.
                      if (err) {
                        res.send(err)  // 에러 출력
                      } else {
                        res.send(ejs.render(data, {  // 테이블의 데이터 (about 내용) 를 보내고 싶음.
                          data: rows                 // rows의 내용 : about1 이 출력됨.
                        }))
                      }
                    })
                  })
                })

                // aboutEdit 페이지 불러오는 get
                app.get('/aboutEdit',(req, res)=>{
                  fs.readFile('views/aboutEdit.ejs', 'utf8', function (err, data) {  // about.ejs 파일을 읽어옴. (파일 경로/파일명 , 파일에 들어갈 내용)
                    connection.query("SELECT about FROM user where user_email = \'" + email + "\'", function (err, rows) {  // user1 자리에 있는건 유동적으로 바뀜.
                      // 들어온 user_id에 해당하는 사람의 about이 출력되어야 함.
                      // user_email 자리에는 소켓 통신으로 입력받은 값이 들어감.
                      if (err) {
                        res.send(err)  // 에러 출력
                      } else {
                        res.send(ejs.render(data, {  // 테이블의 데이터 (about 내용) 를 보내고 싶음.
                          data: rows                 // rows의 내용 : about1 이 출력됨.
                        }))
                      }
                    })
                  })
                })

                // about 데이터 수정. (aboutEdit에서 입력한 내용 db에 반영하는 요청)
                app.post('/aboutEdit', function (req, res) {  // 매 아이디를 부여해야 한다.

                  const body = req.body  // aboutEdit 내부 body에 접근을 요청.

                  // SET about=\'" + 수정한 내용 + "\' 이 되어야 반영됨.
                  // user_id가 user1 인 곳의 DB 내용을 최신화. body.about은 타이핑한 내용(about 자리에 ~로 update 하겠다.) 자리.
                  connection.query("update user SET about = \'" + body.editData + "\' where user_email = \'" + email + "\' ", function(){
                    // body는 aboutEdit 내의 내용임.
                    res.redirect('/About')  // About 페이지로 돌아감.
                  })
                  // console.log(body.editData)
                  })
          })




        // 3. contact 전용 소켓
        // 클라이언트로부터 메시지 수신 및 이메일로 유동적으로 판별
        socket.on('Email', function(data2) {  // 데이터 받는 on 함수
                console.log('서버에서 받은 contact 이메일 :' + data2)  // data1은 이메일
                var email2 = data2

            // Contact 자리
            // Contatc.ejs 불러오기
            app.get('/Contact',(req, res)=>{
              fs.readFile('views/Contact.ejs', 'utf8', function (err, data) {  // contact.ejs 파일을 읽어옴. (파일 경로/파일명 , 파일에 들어갈 내용)
                connection.query("SELECT contact FROM user where user_email = \'" + email2 + "\'", function (err, rows) {  // user1 자리에 있는건 유동적으로 바뀜.
                  // 들어온 user_id에 해당하는 사람의 about이 출력되어야 함.
                  // user_email 자리에는 소켓 통신으로 입력받은 값이 들어감.
                  if (err) {
                    res.send(err)  // 에러 출력
                  } else {
                    res.send(ejs.render(data, {  // 테이블의 데이터 (about 내용) 를 보내고 싶음.
                      data: rows                 // rows의 내용 : about1 이 출력됨.
                    }))
                  }
                })
              })
            })

            // contactEdit 페이지 불러오는 get
            app.get('/contactEdit',(req, res)=>{
              fs.readFile('views/contactEdit.ejs', 'utf8', function (err, data) {  // ContactEdit.ejs 파일을 읽어옴. (파일 경로/파일명 , 파일에 들어갈 내용)
                connection.query("SELECT contact FROM user where user_email = \'" + email2 + "\'", function (err, rows) {  // user1 자리에 있는건 유동적으로 바뀜.
                  // 들어온 user_id에 해당하는 사람의 about이 출력되어야 함.
                  // user_email 자리에는 소켓 통신으로 입력받은 값이 들어감.
                  if (err) {
                    res.send(err)  // 에러 출력
                  } else {
                    res.send(ejs.render(data, {  // 테이블의 데이터 (about 내용) 를 보내고 싶음.
                      data: rows                 // rows의 내용 : about1 이 출력됨.
                    }))
                  }
              })
            })
            })

            // ContactEdit 데이터 수정. (ContactEdit에서 입력한 내용 db에 반영하는 요청)
            app.post('/contactEdit', function (req, res) {  // 매 아이디를 부여해야 한다.

              const body = req.body  // ContactEdit 내부 body에 접근을 요청.

              // SET about=\'" + 수정한 내용 + "\' 이 되어야 반영됨.
              // user_id가 user1 인 곳의 DB 내용을 최신화. body.about은 타이핑한 내용(about 자리에 ~로 update 하겠다.) 자리.
              connection.query("update user SET contact = \'" + body.editData + "\' where user_email = \'" + email2 + "\' ", function(){
                // body는 aboutEdit 내의 내용임.
                res.redirect('/Contact')  // About 페이지로 돌아감.
              })
              console.log(body.editData)
            })
          })

  /*
  socket.on('Pwd', function(data2) {  // 데이터 받는 on 함수
    console.log('서버에서 받은 패스워드 :' + data2)   // data2는 패스워드
  })
  */

// url 노출을 피하기 위하여 post 방식으로 전송
app.post('/login', (req, res)=>{  // /post 를 통해 body 요소 부분 접근
  // RDS에 접속합니다.
  connection.query("select * from user where user_email != '' AND user_pw != '' AND user_name != '';", function(err, rows, fields) { // //db.query();
      if(err){
           throw err;  // 접속에 실패하면 에러를 throw 합니다.
       }else{
          for (i=0; i<rows.length; i++){  // DB에 등록되어 있는 length(유저수) 만큼 반복함.
              if(req.body.userEmail == rows[i].user_email){  // DB 이메일과 일치
                  if(req.body.userPwd == rows[i].user_pw){   // 이메일에 대응되는 비밀번호 일치
                      console.log("--------------------------------")
                      console.log("입력한 이메일 : ", req.body.userEmail)
                      console.log("입력한 비밀번호 : ", req.body.userPwd)
                      console.log("로그인 성공")
                      console.log("--------------------------------")
                      req.session.is_logined = true;  // 로그인 성공
                      res.render('index',{is_logined : true});
                      return true

                  }else{  // 이메일에 대응되는 비밀번호 불일치
                      console.log("--------------------------------")
                      console.log("입력한 이메일 : ", req.body.userEmail)
                      console.log("입력한 비밀번호 : ", req.body.userPwd)
                      console.log("로그인 실패 / 사유 : 비밀번호 불일치")
                      console.log("--------------------------------")

                      res.render('Login');
                      return true
                  }
              }
          }

          // 입력한 이메일이 틀렸을 때 계정 전체 불일치로 넘어감.
          for (i=0; i<rows.length; i++){
              if(req.body.userEmail != rows[i].user_email){
                  console.log("--------------------------------")
                  console.log("입력한 이메일 : ", req.body.userEmail)
                  console.log("입력한 비밀번호 : ", req.body.userPwd)
                  console.log("로그인 실패 / 사유 : 이메일 or 계정 전체 불일치")
                  console.log("--------------------------------")

                  res.render('Login');
                  return true
              }
          }
        }
    });
  });
});


// 로그아웃
app.get('/logout',(req,res)=>{
  console.log('로그아웃 성공');
  req.session.destroy(function(err){
      // 세션 파괴후 할 것들
      res.redirect('/');  // 다시 메인페이지(index)로 돌아감.
  });
});
