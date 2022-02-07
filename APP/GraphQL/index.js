const { ApolloServer, gql } = require("apollo-server");
// const shell = require('shelljs')
// var express = require('express');


const typeDefs = gql
`
  type Query {
    ping: String
  }
`
;

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
    console.log(`Listening at ${url}`);
});