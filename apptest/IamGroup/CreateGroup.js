
var AWS = require('aws-sdk');
AWS.config.loadFromPath('./config.json');

var iam = new AWS.IAM({ apiVersion: '2010-05-08' });

var params = {
    GroupName: "GroupName"
   };
   iam.createGroup(params, function(err, data) {
     if (err) console.log(err, err.stack); // an error occurred
     else     console.log(data);           // successful response
   });