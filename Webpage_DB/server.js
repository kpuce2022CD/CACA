// express 라이브러리 사용법. require는 이 자바스크립트 파일이 해당 모듈을 쓰겠다고 요청하는 것.
const express = require('express');  // express 모듈 요청
const app = express();       // app을 express 프레임워크로 킨다
const ejs = require('ejs');   // ejs 모듈 요청

const bodyParser = require('body-parser'); // POST 방식으로 전달하기 위하여 body-parser 모듈 필요함. 
app.use(bodyParser.urlencoded({extended:true}));

app.set('view engine', 'ejs');  // view engine 으로 ejs를 사용
app.set('views', './views');    // views 폴더 안에 있는 ejs 파일을 사용

app.get('/', function(req, res){  // server.js 에서 ejs 파일(자바스크립트 내장된 html) 불러오기.
    res.render('webpage.ejs', {'a' : 'Name', 'b' : 'E-mail','c' : 'Message', 'd' : 'Send message','t' : 'Contact'});  // data.ejs의 내용을 렌더링. 여기서 res는 홈페이지 쪽에 응답.
    // render 내 변수 변경하면 웹페이지에 반영됨.
});

// POST 방식으로 ID, PW 입력 했을 때. (GET 방식으로 구현 시 url에 입력한 정보 노출되어 보안에 취약함)
app.post('/post', (req, res)=>{  // /post 를 통해 body 요소 부분 접근
    res.send('Successfully Sent!');       // 타이핑 후 완료 문구 출력
    console.log('입력 받은 이름 :', req.body.user_name)       // ID에 입력한 값 터미널에 출력
    console.log('입력 받은 이메일 :', req.body.user_email)    // PWD에 입력한 값 터미널에 출력
    console.log('입력 받은 메시지 :', req.body.user_message)  // ID에 입력한 값 터미널에 출력
});

// n번 포트 연결 (로컬 서버)
app.listen(3000, ()=>{
    console.log("3000번 포트 연결되어 서버 실행 중")
});