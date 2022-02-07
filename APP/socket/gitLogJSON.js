const shell = require('shelljs')

var repository_name = "TEST"
var mkdir = "mkdir /var/www/html/git-repositories/" + repository_name + ".git"
var ip = "13.125.173.134"

var location = "/var/www/html/git-repositories/TEST.git"
var cd = 'ssh -i \"/Users/jiyoung/Downloads/CLONET_AMI.pem\" ubuntu@' + ip + ' \"cd ' + location + ';' + 'git log --pretty=format:\'{%n  \"commit\": \"%H\",%n  \"commit_msg\": \"%s\",%n  \"user\": \"%aN\",%n  \"date\": \"%aD\" %n},\' > ' + 'logJSON.json\"'
if(shell.exec(cd).code !== 0) {
    shell.echo('Error: command failed')
}