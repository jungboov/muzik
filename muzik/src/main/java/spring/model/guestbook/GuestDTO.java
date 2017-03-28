package spring.model.guestbook;

public class GuestDTO {
	private int guestid;
	private String id;
	private String content;
	private String cdate;
	private int ansnum;

	public int getGuestid() {
		return guestid;
	}

	public void setGuestid(int guestid) {
		this.guestid = guestid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public int getAnsnum() {
		return ansnum;
	}

	public void setAnsnum(int ansnum) {
		this.ansnum = ansnum;
	}

}
