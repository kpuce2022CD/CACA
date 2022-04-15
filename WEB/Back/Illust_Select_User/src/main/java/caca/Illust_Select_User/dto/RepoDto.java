package caca.Illust_Select_User.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RepoDto {
    private String user_id;
    private String repo_name;

    public String getUser_id(){
        return user_id;
    }
    public String getRepo_name(){
        return repo_name;
    }
}