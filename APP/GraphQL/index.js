const { ApolloServer, gql } = require("apollo-server");
const shell = require('shelljs')
var express = require('express');


const typeDefs = gql`
  type Query {
    ping: String
  }
`;

const resolvers = {
  Query: {
    ping: () => "pong",
    // gitLogfile: () => {
    //     var gitfile = "cd /Users/jiyoung/Library/Developer/CoreSimulator/Devices/FDBC90DB-31E1-4B75-9D2C-9A0A45BD88BE/data/Containers/Data/Application/8B690498-10C7-449C-A658-C800EB1E3BDE/Documents/hey/.git/logs/"
    //     if(shell.exec(gitfile + ' \"' + 'git log --all --date=format: ' + '%Y-%m-%d %H:%M:%S' + ' --pretty=format:%an,%ad,%s > ./history.csv'+ ' \"').code !== 0) {
    //         shell.echo('Error: command failed')
    //     }
    //     return 'success'
    // },
  },
};

const server = new ApolloServer({
    typeDefs,
    resolvers,
  });
  
server.listen().then(({ url }) => {
    // console.log(`Listening at ${url}`);

    console.log("asdfa");
});



var location = '/Users/jiyoung/Library/Developer/CoreSimulator/Devices/FDBC90DB-31E1-4B75-9D2C-9A0A45BD88BE/data/Containers/Data/Application/63819302-6BF6-4288-B7D5-BD9CBA6B063F/Documents/hey/'
var cmd = 'git log --all --date=format:\'%Y-%m-%d %H:%M:%S\' --pretty=format:%an,%ad,%s > ' + location + 'history.csv'
if(shell.exec(cmd).code !== 0) {
    shell.echo('Error: command failed')
}

console.log("아 안되네")
