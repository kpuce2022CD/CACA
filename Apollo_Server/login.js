const graphql = require('graphql');
const fs = require('fs');
const shell = require('shelljs');
const { ApolloServer, gql } = require('apollo-server');
const { exec } = require('child_process');

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
    user_id: String,
    commit_id: String,
    commit_msg: String,
    date: String
  }
  type request {
    user_id: String,
    repo_name: String,
    x_pixel: String,
    y_pixel: String,
    request_context: String
  }

  type Query {
    User: [User],
    Repository: [Repository],
    mapping_repo_user: [mapping_repo_user],
    request: [request],

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

    request_id(user_id: String): [request],
    request_repo(repo_name: String): [request],
    request_xy(x_pixel: String, y_pixel: String): [request],
    diff_commit(first_commit: String, second_commit: String, repo_name: String, file_name: String): String,

  }
  type Mutation {
    signup(user_id: String, user_pw: String, user_name: String, user_email: String): String,
    create_repo(repo_name: String, repo_ec2_ip: String, user_id: String): String,
    insert_profilePic(user_id: String, profilePic: String): String,
    plusUser(user_id: String, repo_name: String): String,


    create_request(user_id: String, repo_name: String, x_pixel: String, y_pixel: String, request_context: String): String,
    update_userpw(user_id: String, user_pw: String): String,
    update_name(user_id: String, user_name: String): String,
    update_email(user_id: String, user_email: String): String,
    update_profilePic(user_id: String, profilePic: String): String,
    update_about(user_id: String, about: String): String,
    update_contact(user_id: String, contact: String): String,

    delete_request_userID(user_id: String): String,
    delete_request_repo(repo_name: String): String,
    delete_request_xy(x_pixel: String, y_pixel: String): String

  }
  `;

const resolvers = {
  Query: {
    User: () => knex("user").select("*"),
    Repository: () => knex("repository").select("*"),
    mapping_repo_user: () => knex("mapping_repo_user").select("*"),
    request: () => knex("request").select("*"),

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
      var createJSON = 'cd ' + location + ';' + 'git log --pretty=format:\'{%n  "commit_id":"%H",%n  "commit_msg":"%s",%n  "user_id":"%aN",%n "date":"%aD" %n}\', > logJSON.json';


      if (shell.exec(createJSON).code !== 0) {
        shell.echo('Error: command failed');
      }

      var locationJSON = location + "/logJSON.json"
      return JSON.parse("[" + fs.readFileSync(locationJSON).slice(0, -1) + "]");

      ////////////   ////////////   ////////////   ////////////   ////////////   ////////////   ////////////   ////////////   ////////////


      // var repository_name = args.repo_name
      // var location = "/var/www/html/git-repositories/" + repository_name + ".git"

      // // create JSON git log
      // var createJSON = 'cd ' + location + ';' + 'git log --pretty=format:\'{%n  "commit_id":"%H",%n  "commit_msg":"%s",%n  "user_id":"%aN",%n "date":"%aD" %n}\', > logJSON.json';


      // // if (shell.exec(createJSON).code !== 0) {
      // //   shell.echo('Error: command failed');
      // // }

      // exec(createJSON, (err, stdout, stderr) => {
      //   if (err) {
      //     //some err occurred
      //     console.error(err)
      //   } else {
      //    // the *entire* stdout and stderr (buffered)
      //    console.log(`stdout: ${stdout}`);
      //   //  console.log(`stderr: ${stderr}`);
      //    return JSON.parse("[" + stdout.slice(0, -1) + "]");
      //   }
      // });

      // // var locationJSON = location + "/logJSON.json"
      // // return JSON.parse("[" + fs.readFileSync(locationJSON).slice(0, -1) + "]");

    },

    ////////////   ////////////   ////////////   ////////////   ////////////   ////////////   ////////////   ////////////   ////////////

    request_id: (parent, args, context, info) => knex("request").select("*").where('user_id', args.user_id),
    request_repo: (parent, args, context, info) => knex("request").select("*").where('repo_name', args.repo_name),
    request_xy: (parent, args, context, info) => knex("request").select("*").where('x_pixel', args.x_pixel).where('y_pixel', args.y_pixel),


    diff_commit: (parent, args, context, info) => {

      const repository_name = args.repo_name
      const first_commit_id = args.first_commit
      const second_commit_id = args.second_commit
      const file_name = args.file_name


      const cd_toRepository = "cd /var/www/html/git-repositories/" + repository_name + ".git/"
      const first_git_ls_tree = "git ls-tree " + first_commit_id
      const second_git_ls_tree = "git ls-tree " + second_commit_id


      // first 
      exec(cd_toRepository + ';' + first_git_ls_tree, (err, stdout, stderr) => { // git ls-tree
        if (err) {
          console.error(err)
        } else {

          stdout = stdout.replace(/\n/gi, " ").replace(/\t/gi, " ") // git ls-tree 결과물로 blob 알아내기
          var ls_files_result = stdout.split(" ");

          var index = ls_files_result.indexOf(file_name);
          var blob_id = ls_files_result[index - 1]; // 해당 file의 blob_id

          var first_filename = first_commit_id + "_" + file_name

          var to_file = "git cat-file -p " + blob_id + " > ../../images/" + first_filename; // blob_id to File
          exec(cd_toRepository + ";" + to_file, (err, stdout, stderr) => { // git ls-tree
            if (err) {
              console.error(err)
            } else {
              console.log("first");
            }
          });

        }
      });

      // second
      exec(cd_toRepository + ';' + second_git_ls_tree, (err, stdout, stderr) => { // git ls-tree
        if (err) {
          console.error(err)
        } else {

          stdout = stdout.replace(/\n/gi, " ").replace(/\t/gi, " ") // git ls-tree 결과물로 blob 알아내기
          var ls_files_result = stdout.split(" ");

          var index = ls_files_result.indexOf(file_name);
          var blob_id = ls_files_result[index - 1]; // 해당 file의 blob_id

          var second_filename = second_commit_id + "_" + file_name

          var to_file = "git cat-file -p " + blob_id + " > ../../images/" + second_filename; // blob_id to File
          exec(cd_toRepository + ";" + to_file, (err, stdout, stderr) => { // git ls-tree
            if (err) {
              console.error(err)
            } else {
              console.log("second");
            }
          });
        }
      });


      return `${first_commit}_${second_commit}_${repo_name}_${file_name}`
    },
  },

  Mutation: {
    signup: (parent, args, context, info) => {
      knex('user').insert({ user_id: args.user_id, user_pw: args.user_pw, user_name: args.user_name, user_email: args.user_email }) // Signup
        .then(function (result) { })
      return args.user_id
    },
    create_repo: (parent, args, context, info) => {
      knex('Repository').insert({ repo_name: args.repo_name, repo_ec2_ip: args.repo_ec2_ip }) // create_repo
        .then(function (result) { })

      knex('mapping_repo_user').insert({ repo_name: args.repo_name, user_id: args.user_id }) // create_repo
        .then(function (result) { })

      // create REMOTE repo in EC2
      var repository_name = args.repo_name
      var ip = args.user_id

      var new_repo = "cp -R /var/www/html/git-repositories/CLONET.git /var/www/html/git-repositories/" + repository_name + ".git"
      if (shell.exec(new_repo).code !== 0) {
        shell.echo('Error: command failed')
        shell.exit(1)
      }

      var repo_777 = "chmod -R 777 /var/www/html/git-repositories/" + repository_name + ".git"
      if (shell.exec(repo_777).code !== 0) {
        shell.echo('Error: command failed')
        shell.exit(1)
      }

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

    ////////////   ////////////   ////////////   ////////////   ////////////   ////////////   ////////////   ////////////   ////////////
    create_request: (parent, args, context, info) => {
      knex('request').insert({ user_id: args.user_id, repo_name: args.repo_name, x_pixel: args.x_pixel, y_pixel: args.y_pixel, request_context: args.request_context })
        .then(function (result) { })
      return args.user_id
    },

    update_userpw: (parent, args, context, info) => {
      knex('user').update({ user_pw: args.user_pw }).where('user_id', args.user_id)
      return args.user_pw
    },

    update_name: (parent, args, context, info) => {
      knex('user').update({ user_name: args.user_name }).where('user_id', args.user_id)
      return args.user_name
    },

    update_email: (parent, args, context, info) => {
      knex('user').update({ user_email: args.user_email }).where('user_id', args.user_id)
      return args.user_email
    },

    update_profilePic: (parent, args, context, info) => {
      knex('user').update({ profilePic: args.profilePic }).where('user_id', args.user_id)
      return args.profilePic
    },

    update_about: (parent, args, context, info) => {
      knex('user').update({ about: args.about }).where('user_id', args.user_id)
      return args.about
    },

    update_contact: (parent, args, context, info) => {
      knex('user').update({ contact: args.contact }).where('user_id', args.user_id)
      return args.contact
    },



    delete_request_userID: (parent, args, context, info) => {
      knex('request').del().where('user_id', args.user_id)
      return args.user_id
    },

    delete_request_repo: (parent, args, context, info) => {
      knex('request').del().where('repo_name', args.repo_name)
      return args.repo_name
    },

    delete_request_xy: (parent, args, context, info) => {
      knex('request').del().where('x_pixel', args.x_pixel).where('y_pixel', args.y_pixel)
      return args.x_pixel
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
