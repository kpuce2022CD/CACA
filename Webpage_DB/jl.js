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
 var connection = mysql.createConnection({   // host는 DB 주소 입력하는 곳.
    host: "DB URL",
    user: "admin",
    password: "qwer1234",
    database: "clonet_database"
  });

app.get('/', function(req, res){  // server.js 에서 ejs 파일(자바스크립트 내장된 html) 불러오기.
    res.render('login.ejs');  // data.ejs의 내용을 렌더링. 여기서 res는 홈페이지 쪽에 응답.
});

// RDS에 접속합니다.
connection.query("SELECT * FROM user", function(err, rows, fields) { // //db.query();
    if(err){
        throw err;  // 접속에 실패하면 에러를 throw 합니다.
    }else{
        for (var i=0; i<rows.length; i++){
            console.log(rows[i].user_email)  // user1@gmail.com
            console.log(rows[i].user_pw)     // user2@gmail.com
        };
    }
});

// POST 방식으로 ID, PW 입력 했을 때. (GET 방식으로 구현 시 url에 입력한 정보 노출되어 보안에 취약함)
app.post('/login', (req, res)=>{  // /post 를 통해 body 요소 부분 접근 
    console.log('입력 받은 이메일 :', req.body.userEmail)
    console.log('입력 받은 패스워드 :', req.body.userPwd)


    // 1. 타이핑한 이메일과 패스워드가 모두 맞았을 때
    //res.send('로그인 성공');       // 타이핑 후 완료 문구 출력

    // 2. 타이핑한것 중에 이메일이 틀렸을 때
    //res.send('이메일이 올바르지 않습니다');       // 타이핑 후 완료 문구 출력

    // 비밀번호가 틀렸을 때
    //res.send('비밀번호가 올바르지 않습니다');      // 타이핑 후 완료 문구 출력
});

/*
// RDS에 접속합니다.
 connection.connect(function(err) {  // = db.connect();
    if (err) {
      throw err; // 접속에 실패하면 에러를 throw 합니다.
    } else {
      // 접속시 쿼리를 보냅니다.
      connection.query("SELECT * FROM user", function(err, results, fields) { // //db.query();
       // results.render('login.ejs', {data : results});
        console.log(results); // 결과를 출력합니다!
      });
    }
 });
*/

/*
// 2. 회원가입. (일단 보류)
// 사용자 측에서 POST 방식으로 보낸 이메일, 닉네임, 비밀번호 정보를 얻어 user 테이블에 삽입
app.post('/user/join', function (req, res) {
    console.log(req.body);
    var userEmail = req.body.userEmail;
    var userPwd = req.body.userPwd;
    var userName = req.body.userName;

    // 삽입을 수행하는 sql문.
    var sql = 'INSERT INTO Users (UserEmail, UserPwd, UserName) VALUES (?, ?, ?)';
    var params = [userEmail, userPwd, userName];

    // sql 문의 ?는 두번째 매개변수로 넘겨진 params의 값으로 치환된다.
    connection.query(sql, params, function (err, result) {
        var resultCode = 404;
        var message = '에러가 발생했습니다';

        if (err) {
            console.log(err);   // 접속에 실패하면 에러 로그를 터미널에 출력.
        } else {
            resultCode = 200;
            message = '회원가입에 성공했습니다.';
        }

        res.json({
            'code': resultCode,
            'message': message
        });
    });
});
*/
