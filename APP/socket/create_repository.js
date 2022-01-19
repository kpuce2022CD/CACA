const shell = require('shelljs')
 
// shell.cd('~')

var mkdir = "mkdir /var/www/html/git-repositories/0119-1860.git"
if(shell.exec('ssh -i \"/Users/hyeminchoi/Desktop/CACA/APP/socket/CLONET.pem\" ubuntu@52.79.177.143 \"' + mkdir + '\"').code !== 0) {
  shell.echo('Error: command failed')
  shell.exit(1)
}

var bare = "git init --bare /var/www/html/git-repositories/0119-1860.git"
if(shell.exec('ssh -i \"/Users/hyeminchoi/Desktop/CACA/APP/socket/CLONET.pem\" ubuntu@52.79.177.143 \"' + bare + '\"').code !== 0) {
    shell.echo('Error: command failed')
    shell.exit(1)
  }