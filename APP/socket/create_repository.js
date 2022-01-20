const shell = require('shelljs')
 
// shell.cd('~')
var repository_name = "PJY_JJANG"
var mkdir = "mkdir /var/www/html/git-repositories/" + repository_name + ".git"
var ip = "3.37.62.93"

if(shell.exec('ssh -i \"/Users/hyeminchoi/Desktop/CACA/APP/socket/CLONET.pem\" ubuntu@' + ip + ' "' + mkdir + '\"').code !== 0) {
  shell.echo('Error: command failed')
  shell.exit(1)
}

var bare = "git init --bare /var/www/html/git-repositories/" + repository_name + ".git"
if(shell.exec('ssh -i \"/Users/hyeminchoi/Desktop/CACA/APP/socket/CLONET.pem\" ubuntu@' + ip + ' \"' + bare + '\"').code !== 0) {
    shell.echo('Error: command failed')
    shell.exit(1)
  }

var readMe = "touch /var/www/html/git-repositories/" + repository_name + ".git" + "/readME.text"
if(shell.exec('ssh -i \"/Users/hyeminchoi/Desktop/CACA/APP/socket/CLONET.pem\" ubuntu@' + ip + ' \"' + readMe + '\"').code !== 0) {
  shell.echo('Error: command failed')
  shell.exit(1)
}