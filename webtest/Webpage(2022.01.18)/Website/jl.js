var mysql = require('mysql');  
var express = require('express');  // express 모듈 요청
var bodyParser = require('body-parser'); // POST 방식으로 전달하기 위하여 body-parser 모듈 필요함.
var app = express(); // app을 express 프레임워크로 킨다
var ejs = require('ejs');   // ejs 모듈 요청

app.use(bodyParser.json({extended: true}));   // 사용자가 웹사이트로 전달하는 정보들을 검사하는 미들웨어
app.use(bodyParser.urlencoded({extended: true}));  // json이 아닌 post 형식으로

app.set('view engine', 'ejs');  // view engine 으로 ejs를 사용
app.set('views', './views');    // views 폴더 안에 있는 ejs 파일을 사용

// n번 포트 연결 (로컬 서버)
app.listen(3000, ()=>{
    console.log("3000번 포트 연결되어 서버 실행 중")
});

 // 커넥션을 정의합니다.
 // RDS Console 에서 본인이 설정한 값을 입력해주세요.
connection = mysql.createConnection({   // host는 DB 주소 입력하는 곳.
    host: "",
    user: "admin",
    password: "qwer1234",
    database: "clonet_database",
});

app.get('/', function(req, res){  // server.js 에서 ejs 파일(자바스크립트 내장된 html) 불러오기.
    res.render('login.ejs');  // 'login.ejs'의 내용을 렌더링. 여기서 res는 홈페이지 쪽에 응답.
});

// POST 방식으로 ID, PW 입력 했을 때. (GET 방식으로 구현 시 url에 입력한 정보 노출되어 보안에 취약함)
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

                        var result = [  // 입력한 데이터와 사유 저장하는 배열
                            {email : req.body.userEmail},
                            {pw : req.body.userPwd},
                            {message : '로그인 성공'},
                        ]

                        res.send(result)   // result에 저장된 내용 출력
                        return true
                    }else{  // 이메일에 대응되는 비밀번호 불일치
                        console.log("--------------------------------")
                        console.log("입력한 이메일 : ", req.body.userEmail)
                        console.log("입력한 비밀번호 : ", req.body.userPwd)
                        console.log("로그인 실패 / 사유 : 비밀번호 불일치")
                        console.log("--------------------------------")

                        var result = [  // 입력한 데이터와 사유 저장하는 배열
                            {email : req.body.userEmail},
                            {pw : req.body.userPwd},
                            {message : '비밀번호 불일치로 인해 로그인 거부'},
                        ]

                        res.send(result) // result에 저장된 내용 출력
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

                    var result = [  // 입력한 데이터와 사유 저장하는 배열
                        {email : req.body.userEmail},
                        {pw : req.body.userPwd},
                        {message : '일치하는 계정 없음'},
                    ]
    
                    res.send(result) // result에 저장된 내용 출력
                    return true
                }
            }

        }
    });
});