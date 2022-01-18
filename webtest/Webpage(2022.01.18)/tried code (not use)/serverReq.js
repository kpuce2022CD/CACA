const http = require('http');  // 서버를 열기 위해서는 http 모듈을 불러와야 함
const url = require('url');    // url 주소를 분석하는 모듈.
const fs = require('fs');      // 파일 읽고 쓰는 모듈
const { response } = require('express');

// 웹 서버 객체 만들기. 서버가 실행된 후의 동작을 콜백 함수로 등록.
// request -> 서버 처리 -> response 순서
// req, res 내에는 header와 body가 존재
// header는 req, rep 정보 / body는 진짜 주고받고자 하는 내용
const server = http.createServer((request, response)=>{  // 아래에서 req, rep 작업이 진행됨.

  const path = url.parse(request.url, true).pathname  // url 에서 경로 추출
 
  request.on('error', (err) => {   // 요청에 에러가 있으면 (요청 에러 생기면 서버 멈추기에 반드시 먼저 처리)
    console.error(err);            // 콘솔에 에러 출력
  })

  // 요청 받은 데이터 터미널에 출력
  request.on('data', (data) => {  // 요청에 데이터가 있으면
   console.log(data);             // 콘솔에 데이터 출력
  })

  if (request.method === 'GET'){ // GET 요청
    if(path === '/idx') {        // 주소가 /idx 이면
      response.writeHead(200, {'Content-Type':'text/html'}); // 헤더 설정 (컨텐츠 타입은 html 파일)
      fs.readFile(__dirname+'/idx.html',(err, data) =>{      // 파일 읽는 메소드
        if (err){
          return console.error(err);      // 에러 발생 시 기록하고 종료
        }
        response.end(data, 'utf-8');      // 브라우저로 전송
    });
  } else if (path === '/') {   // 주소가 / 이면
    response.writeHead(200, {'Content-Type':'text/html'});
    fs.readFile(__dirname+'/idx.html',(err, data) =>{
      if (err){
        return console.error(err);
      }
      response.end(data, 'utf-8');
    });
  } else {  // 매칭되는 주소가 없으면
    response.statusCode = 404;
    response.end('주소가 없습니다');
  }
}
}).listen(8080);