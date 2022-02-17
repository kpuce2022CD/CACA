/**
 * A simple example that creates a new IAM user using your Access ID key and Secret Access Key
 * See http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html
 */
 var AWS = require('aws-sdk');

 // Load AWS configuration from the path as opposed to a global location
 // See https://aws.amazon.com/sdk-for-node-js/
 // You may print the object returned to see more data
 AWS.config.loadFromPath('./config.json');

 var iam = new AWS.IAM({apiVersion: '2010-05-08'});
 var params = {
    UserName: "Bobb"
   };
   iam.createUser(params, function(err, data) {
     if (err) console.log(err, err.stack); // an error occurred
     else     console.log(data);           // successful response
     /*
     data = {
      User: {
       Arn: "arn:aws:iam::123456789012:user/Bob", 
       CreateDate: <Date Representation>, 
       Path: "/", 
       UserId: "AKIAIOSFODNN7EXAMPLE", 
       UserName: "Bob"
      }
     }
     */
   });