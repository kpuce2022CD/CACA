const knex = require('knex')({
    client: 'mysql',
    connection: {
        host: "caca.coxzzrdfc2aa.ap-northeast-2.rds.amazonaws.com",
        user: "admin",
        password: "qwer1234",
        database: "clonet_database"
    }
  })

knex.raw('select * from user').then((resp) => { console.log(resp); } ).catch((err) => { console.log(err); } );
