const { ApolloServer, gql } = require("apollo-server");
const shell = require('shelljs')
var express = require('express');
const fs = require('fs')

const typeDefs = gql`
  type Query {
    ping: String
  }
`;

const resolvers = {
  Query: {
    ping: () => "pong",

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


var location = '/Users/jiyoung/Library/Developer/CoreSimulator/Devices/FDBC90DB-31E1-4B75-9D2C-9A0A45BD88BE/data/Containers/Data/Application/E221CCA4-E1B2-446A-B34A-AF7A8E6C43C7/Documents/test/logJSON.json'
// const jsonData= require('/Users/jiyoung/Library/Developer/CoreSimulator/Devices/FDBC90DB-31E1-4B75-9D2C-9A0A45BD88BE/data/Containers/Data/Application/E221CCA4-E1B2-446A-B34A-AF7A8E6C43C7/Documents/test/logJSON.json'); 
// console.log(jsonData);

fs.readFile(location, 'utf8' , (err, data) => {
  if (err) {
    console.error(err)
    return
  }

  function replacer(key, value) {
    if (typeof value === 'string') {
      return undefined;
    }
    return value;
  }

  // var jsonString = JSON.stringify()
  // var useJson = JSON.stringify("[" + data.slice(0, -1) + "]", replacer); 

  // console.log(useJson);
  const user = JSON.parse("[" + data.slice(0, -1) + "]");
  console.log(user)
})

