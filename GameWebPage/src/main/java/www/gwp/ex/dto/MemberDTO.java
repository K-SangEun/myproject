package www.gwp.ex.dto;

public class MemberDTO { //mGWP
	private int no;
	private String id;
	private String pw;
	private String email;
	private String birth;
	private int manage;
	
	public int getManage() {
		return manage;
	}
	public void setManage(int manage) {
		this.manage = manage;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	
}
