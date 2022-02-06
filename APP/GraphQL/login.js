const graphql = require('graphql');

const {ApolloServer, gql} = require('apollo-server')
const { GraphQLSchema } = graphql;

const options = {
    client: 'mysql',
    connection: {
        host: "",
        user: "admin",
        password: "",
        database: "clonet_database"
    }
  }

  const knex = require('knex')(options);

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
  `;

const resolvers = {
  Query: {
    User: () => knex("user").select("*"),
  }
};

const server = new ApolloServer({ typeDefs, resolvers });


server.listen().then(({ url }) => {
    console.log(`🚀  Server ready at ${url}`);
  });