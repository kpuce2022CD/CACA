// NO_USE

const { exec } = require('child_process');

const repository_name = "test"
const commit_id = "2e753c1ecc94068f2acf43bd27c0b729cd783ff0"
const file_name = "README.md"


const cd_toRepository = "cd /var/www/html/git-repositories/" + repository_name + ".git/"
const git_ls_tree = "git ls-tree " + commit_id

exec(cd_toRepository + ';' + git_ls_tree, (err, stdout, stderr) => { // git ls-tree
  if (err) {
    console.error(err)
  } else {

    stdout = stdout.replace(/\n/gi, " ").replace(/\t/gi, " ") // git ls-tree 결과물로 blob 알아내기
    var ls_files_result = stdout.split(" ");

    var index = ls_files_result.indexOf(file_name);
    var blob_id = ls_files_result[index - 1]; // 해당 file의 blob_id

    console.log(blob_id);

    var to_file = "git cat-file -p " + blob_id + " > ../../images/" + file_name; // blob_id to File
    exec(cd_toRepository + ";" + to_file, (err, stdout, stderr) => { // git ls-tree
        if (err) {
          console.error(err)
        } else {
            console.log(stdout);
        }
      });

  }
});
