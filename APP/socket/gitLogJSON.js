const shell = require('shelljs')

var repository_name = "TEST"
var mkdir = "mkdir /var/www/html/git-repositories/" + repository_name + ".git"
var ip = "13.125.173.134"


var location = "/Users/jiyoung/Library/Developer/CoreSimulator/Devices/FDBC90DB-31E1-4B75-9D2C-9A0A45BD88BE/data/Containers/Data/Application/E221CCA4-E1B2-446A-B34A-AF7A8E6C43C7/Documents/test"
var createJSON = 'cd ' + location + ';' + 'git log --pretty=format:\'{%n  \"commit\":"%H",%n  \"commit_msg\":\"%s\",%n  \"user\":\"%aN\",%n  \"date\":\"%aD\" %n}\', > logJSON.json';

console.log(createJSON)


// var cd = 'ssh -i \"/Users/jiyoung/Downloads/CLONET_AMI.pem\" ubuntu@' + ip + ' "'+ createJSON + '\"';
// if(shell.exec(cd).code !== 0) {
//     shell.echo('Error: command failed');
// }

var cd = 'ssh -i \"/Users/jiyoung/Downloads/CLONET_AMI.pem\" ubuntu@' + ip + ' "'+ createJSON + '\"';
if(shell.exec(createJSON).code !== 0) {
    shell.echo('Error: command failed');
}
