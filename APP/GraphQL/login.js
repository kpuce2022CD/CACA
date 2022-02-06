var mysql = require("mysql");
const { ApolloServer, gql } = require("apollo-server");


var con = mysql.createConnection({
    host: "",
    user: "admin",
    password: "",
    database: "clonet_database"
});

// var login_result = "err";
var query = "SELECT * FROM user ";

// RDS에 접속합니다.
con.connect(function (err) {
    if (err) {
        console.log(err)
    } else {
        con.query(query, function (err, rows, fields) {
            apollo_login(JSON.parse(JSON.stringify(rows)))
        });
    }
});


function apollo_login(result){
    const typeDefs = gql
    `
    type Query {
        User: [User]
    }
    type User {
        user_id: String,
        user_pw: String,
        user_name: String,
        user_email: String,
        profilePic: String,
    }
    `
    ;

    const resolvers = {
        Query: {
            User: () => result
        },
        // User: {
        //     user_id: () => re
        // }
    };

    const server = new ApolloServer({
        typeDefs,
        resolvers,
      });
      
    server.listen().then(({ url }) => {
        console.log(`Listening at ${url}`);
    });

}