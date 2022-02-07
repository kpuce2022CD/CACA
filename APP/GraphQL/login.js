const graphql = require('graphql');

const {ApolloServer, gql} = require('apollo-server');
// const { default: knex } = require('knex');
// const { GraphQLSchema } = graphql;
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
  },

  Mutation: {
    signup: (parent, args, context, info) => {
      knex('user').insert({user_id: args.user_id, user_pw: args.user_pw, user_name: args.user_name, user_email: args.user_email}) // Signup
      .then(function(result){})
      return args.user_id
    },
    create_repo: (parent, args, context, info) => {
      knex('repository').insert({repo_name: args.repo_name, repo_ec2_ip: args.repo_ec2_ip}) // create_repo
      .then(function(result){})

      knex('mapping_repo_user').insert({repo_name: args.repo_name, user_id: args.user_id}) // create_repo
      .then(function(result){})
      return args.repo_name
    },
    insert_profilePic: (parent, args, context, info) => {
      knex('user').insert({profilePic: args.profilePic}).where('user_id', args.user_id) // create_repo
      .then(function(result){})
      return args.profilePic
    },
    plusUser: (parent, args, context, info) => {
      knex('mapping_repo_user').insert({user_id: args.user_id, repo_name: args.repo_name}) // create_repo
      .then(function(result){})
      return args.user_id
    },

    ////
    // insertUser: (parent, args, context, info) => {
    //   knex('user').insert({user_id: args.user_id})
    //   .then(function(result){
        
    //   })
    //   return args.user_id
    // },

    // deleteUser: (parent, args, context, info) => {
    //   knex('user').del().where('user_id', 'f')
    //   .then(function(result){
        
    //   })
    //   return args.user_id
    // },

    // updateUser: (parent, args, context, info) => {
    //   knex('user').update({user_id: args.new_id}).where('user_id', args.user_id)
    //   .then(function(result){
        
    //   })
    //   return args.new_id
    // }
  }
};

const server = new ApolloServer({
  typeDefs, 
  resolvers 
});


server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
  });