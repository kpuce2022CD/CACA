// NO_USE (for AWS Repository)

const knex = require("knex")({
  client: "mysql",
  connection: {
    host: "",
    user: "admin",
    password: "",
    database: "clonet_database",
  },
});

var http = require("http");
var url = require("url");

http.createServer(function (req, res) {
    var uri = req.url;
    var query = url.parse(uri, true).query;

    if (req.method == "GET") {
      // res.writeHead(200, { "Content-type": "text/html" });
      res.end("완료! WELCOME TO CLONET!");

      console.log(query.user_id)
      console.log(query.repo_name)

      if(query.user_id != "" && query.repo_name != ""){
        knex('mapping_repo_user').insert({ user_id: query.user_id, repo_name: query.repo_name })
            .then(function (result) {
            console.log(result)
        });
      }
    }
  })
  .listen(5312, function () {
    console.log("server running on 5312 for SMTP.");
  });
