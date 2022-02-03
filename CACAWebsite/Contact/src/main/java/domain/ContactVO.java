package domain;

public class ContactVO {
	private String user_id;
	private String contact_title;
	private String contact_content;
	
	public ContactVO(String user_id, String contact_title, String contact_content) {
		this.setUser_id(user_id);
		this.setContact_title(contact_title);
		this.setContact_content(contact_content);
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getContact_title() {
		return contact_title;
	}

	public void setContact_title(String contact_title) {
		this.contact_title = contact_title;
	}

	public String getContact_content() {
		return contact_content;
	}

	public void setContact_content(String contact_content) {
		this.contact_content = contact_content;
	}

}
