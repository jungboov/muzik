package spring.model.notice;

public class NoticeDTO {
	 private int noticeid; 
	 //private String grade;
	 private String title;
	 private String content;
	private int viewcnt;
	 private String cdate;
	
//	 public String getGrade() {
//		 return grade;
//	 }
//	 public void setGrade(String grade) {
//		 this.grade = grade;
//	 }
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getCdate() {
		return cdate;
	}
	public int getNoticeid() {
		return noticeid;
	}
	public void setNoticeid(int noticeid) {
		this.noticeid = noticeid;
	}
	
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
}
