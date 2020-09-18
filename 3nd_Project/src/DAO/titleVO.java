package DAO;


public class titleVO {
	
	String title;
	String score;
	String tel;
	String address;
	
	public titleVO(String title, String score, String tel, String address) {
		super();
		this.title = title;
		this.score = score;
		this.tel = tel;
		this.address = address;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	

}
