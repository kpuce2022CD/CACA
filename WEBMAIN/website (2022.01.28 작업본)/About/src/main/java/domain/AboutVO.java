package domain;

public class AboutVO {
	private String user_id;
	private String about_title;
	private String about_content;
	private String about_profilePic;
	
	public AboutVO(String user_id, String about_title, String about_content, String about_profilePic) {
		this.setUser_id(user_id);
		this.setAbout_title(about_title);
		this.setAbout_content(about_content);
		this.setAbout_profilePic(about_profilePic);
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getAbout_title() {
		return about_title;
	}

	public void setAbout_title(String about_title) {
		this.about_title = about_title;
	}

	public String getAbout_content() {
		return about_content;
	}

	public void setAbout_content(String about_content) {
		this.about_content = about_content;
	}

	public String getAbout_profilePic() {
		return about_profilePic;
	}

	public void setAbout_profilePic(String about_profilePic) {
		this.about_profilePic = about_profilePic;
	}
}
