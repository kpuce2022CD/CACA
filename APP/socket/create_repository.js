const shell = require('shelljs')
 
// shell.cd('~')
var repository_name = "ho"
var ip = "3.36.78.131"


// // MARK: SECOND FOR OTHERS
var new_repo = "cp -R /var/www/html/git-repositories/CLONET.git /var/www/html/git-repositories/" + repository_name + ".git"
if(shell.exec('ssh -i \"/Users/hyeminchoi/Desktop/CACA/APP/socket/CLONET.pem\" ubuntu@' + ip + ' "' + new_repo + '\"').code !== 0) {
  shell.echo('Error: command failed')
  shell.exit(1)
}

var new_repo = "chmod -R 777 /var/www/html/git-repositories/" + repository_name + ".git"
if(shell.exec('ssh -i \"/Users/hyeminchoi/Desktop/CACA/APP/socket/CLONET.pem\" ubuntu@' + ip + ' "' + new_repo + '\"').code !== 0) {
  shell.echo('Error: command failed')
  shell.exit(1)
}



// MARK: FIRST FOR AMI
// var mkdir = "mkdir /var/www/html/git-repositories/" + repository_name + ".git"
// if(shell.exec('ssh -i \"/Users/hyeminchoi/Desktop/CACA/APP/socket/CLONET.pem\" ubuntu@' + ip + ' "' + mkdir + '\"').code !== 0) {
//   shell.echo('Error: command failed')
//   shell.exit(1)
// }

// var bare = "git init --bare /var/www/html/git-repositories/" + repository_name + ".git"
// if(shell.exec('ssh -i \"/Users/hyeminchoi/Desktop/CACA/APP/socket/CLONET.pem\" ubuntu@' + ip + ' \"' + bare + '\"').code !== 0) {
//     shell.echo('Error: command failed')
//     shell.exit(1)
//   }