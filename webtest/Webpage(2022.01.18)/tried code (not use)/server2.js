const express = require('express');  // express 사용하면 http 모듈을 따로 불러올 필요가 없음
const app = express();
const ejs = require('ejs');

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended : true}));

app.get('/', (req, res) => {
    res.send(html);
  });

app.listen(8080, function() {
    console.log('listening on 8080')
});

app.get('/write', function(req, res){
    res.sendFile(__dirname + '/write.html')
});

app.post('/test', function(req, res){
    console.log(req.body.title, req.body.date)
});