var AWS = require("aws-sdk");
AWS.config.loadFromPath('./config.json');
// AWS.config.update({region:'us-east-1'});
var codecommit = new AWS.CodeCommit({apiVersion: '2015-04-13'});

var params = {
    repositoryName: 'STRING_VALUE', /* required */
    repositoryDescription: 'STRING_VALUE'
    // tags: {
    //   '<TagKey>': 'STRING_VALUE',
    //   /* '<TagKey>': ... */
    // }
  };

  codecommit.createRepository(params, function(err, data) {
    if (err) 
        console.log(err, err.stack); // an error occurred
    else    
        console.log(data);           // successful response
  });