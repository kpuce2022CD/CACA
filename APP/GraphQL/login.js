const graphql = require('graphql');
const fs = require('fs');
const shell = require('shelljs');
const { ApolloServer, gql } = require('apollo-server');
const path = require('path');
const { json } = require('body-parser');
// const pubsub = new PubSub();
// const express = require('expr ess');

const knex = require('knex')({
  client: 'mysql',
  connection: {
    host: "",
    user: "admin",
    password: "",
    database: "clonet_database"
  }
})

const typeDefs = gql
  `
  scalar JSON
  type User {
      user_id: String,
      user_pw: String,
      user_name: String,
      user_email: String,
      profilePic: String,
      about: String,
      contact: String
  }
  type Repository {
    repo_name: String,
    repo_ec2_ip: String
  }
  type mapping_repo_user {
    user_id: String,
    repo_name: String
  }
  type log {
    user_id: String
    commit_id: String
    commit_msg: String
    date: String
  }

  type Query {
    User: [User],
    Repository: [Repository],
    mapping_repo_user: [mapping_repo_user],

    login(user_id: String): [User],
    findId(user_email: String): [User],
    findPw(user_id: String): [User],
    repoList(user_id: String): [mapping_repo_user],
    select_profilePic(user_id: String): [User],
    checkUser(user_id: String): [User],
    groupUser(repo_name: String): [mapping_repo_user],
    select_repo(repo_name: String): [Repository],
    select_ec2(repo_ec2_ip: String): [Repository],

    log_repo(repo_name: String): [log],
  }
  type Mutation {
    signup(user_id: String, user_pw: String, user_name: String, user_email: String): String,
    create_repo(repo_name: String, repo_ec2_ip: String, user_id: String): String,
    insert_profilePic(user_id: String, profilePic: String): String,
    plusUser(user_id: String, repo_name: String): String,
  }
  `;

const resolvers = {
  Query: {
    User: () => knex("user").select("*"),
    Repository: () => knex("repository").select("*"),
    mapping_repo_user: () => knex("mapping_repo_user").select("*"),

    login: (parent, args, context, info) => knex("user").select("*").where('user_id', args.user_id), // login
    findId: (parent, args, context, info) => knex("user").select("*").where('user_email', args.user_email), // findId
    findPw: (parent, args, context, info) => knex("user").select("*").where('user_id', args.user_id), // findPw
    repoList: (parent, args, context, info) => knex("mapping_repo_user").select("*").where('user_id', args.user_id), // repoList
    select_profilePic: (parent, args, context, info) => knex("user").select("*").where('user_id', args.user_id), // select_profilePic
    checkUser: (parent, args, context, info) => knex("user").select("*").where('user_id', args.user_id), // checkUser
    groupUser: (parent, args, context, info) => knex("mapping_repo_user").select("*").where('repo_name', args.repo_name), // groupUser
    select_repo: (parent, args, context, info) => knex("Repository").select("*").where('repo_name', args.repo_name), // groupUser
    select_ec2: (parent, args, context, info) => knex("Repository").select("*").where('repo_ec2_ip', args.repo_ec2_ip), // groupUser

    // const changesFile = path.join(graphqlStaticDir, 'upcoming-changes.json')
    log_repo: (parent, args, context, info) => {
      var repository_name = args.repo_name
      var location = "/var/www/html/git-repositories/" + repository_name + ".git"

      // create JSON git log
      // var createJSON = 'cd ' + location + ';' + 'git log --pretty=format:\'{%n  \"commit\":"%H",%n  \"commit_msg\":\"%s\",%n  \"user\":\"%aN\",%n  \"date\":\"%aD\" %n}\', > logJSON.json';
      var createJSON = 'cd ' + location + ';' + 'git log --pretty=format:\'{%n  "commit_id":"%H",%n  "commit_msg":"%s",%n  "user_id":"%aN",%n "date":"%aD" %n}\', > logJSON.json';


      if (shell.exec(createJSON).code !== 0) {
        shell.echo('Error: command failed');
      }

      var locationJSON = location + "/logJSON.json"
      return JSON.parse("[" + fs.readFileSync(locationJSON).slice(0, -1) + "]");

    },
  },

  Mutation: {
    signup: (parent, args, context, info) => {
      knex('user').insert({ user_id: args.user_id, user_pw: args.user_pw, user_name: args.user_name, user_email: args.user_email }) // Signup
        .then(function (result) { })
      return args.user_id
    },
    create_repo: (parent, args, context, info) => {
      knex('repository').insert({ repo_name: args.repo_name, repo_ec2_ip: args.repo_ec2_ip }) // create_repo
        .then(function (result) { })

      knex('mapping_repo_user').insert({ repo_name: args.repo_name, user_id: args.user_id }) // create_repo
        .then(function (result) { })
      return args.repo_name
    },
    insert_profilePic: (parent, args, context, info) => {
      knex('user').insert({ profilePic: args.profilePic }).where('user_id', args.user_id) // create_repo
        .then(function (result) { })
      return args.profilePic
    },
    plusUser: (parent, args, context, info) => {
      knex('mapping_repo_user').insert({ user_id: args.user_id, repo_name: args.repo_name }) // create_repo
        .then(function (result) { })
      return args.user_id
    },
  },
}


const server = new ApolloServer({
  typeDefs,
  resolvers
});


server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});

