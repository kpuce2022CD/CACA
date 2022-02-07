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
  type Query {
      User: [User],
      Repository: [Repository],
      mapping_repo_user: [mapping_repo_user]
  }
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


  type Mutation {
    insertUser(user_id: String) : String
    deleteUser(user_id: String) : String
    updateUser(user_id: String, new_id: String) : String
  }
  `;

const resolvers = {
  Query: {
    User: () => knex("user").select("*"),
    Repository: () => knex("repository").select("*"),
    mapping_repo_user: () => knex("mapping_repo_user").select("*"),
  },

  Mutation: {
    insertUser: (parent, args, context, info) => {
      knex('user').insert({user_id: args.user_id})
      .then(function(result){
        
      })
      return args.user_id
    },

    deleteUser: (parent, args, context, info) => {
      knex('user').del().where('user_id', 'f')
      .then(function(result){
        
      })
      return args.user_id
    },

    updateUser: (parent, args, context, info) => {
      knex('user').update({user_id: args.new_id}).where('user_id', args.user_id)
      .then(function(result){
        
      })
      return args.new_id
    }
  }
};

const server = new ApolloServer({
  typeDefs, 
  resolvers 
});


server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
  });