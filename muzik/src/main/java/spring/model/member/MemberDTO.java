package spring.model.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
	private String	  id       ;  
	private String	  name       ;  
	private String	  image       ;  
	private String	  email       ;  
	private String	  reg_date       ;
	private String grade;
	private String nickname;	
	private String password;	
	
	 private String   fname    ;
	 private MultipartFile  fnameMF    ;
	
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public MultipartFile getFnameMF() {
		return fnameMF;
	}
	public void setFnameMF(MultipartFile fnameMF) {
		this.fnameMF = fnameMF;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}  	
	
}

