package spring.model.bbsReply;

public class BbsReplyDTO {
	private int rbbsid;
	private int bbsid;
	private String content;
	private String cdate;
	private String id;
	public int getRbbsid() {
		return rbbsid;
	}
	public void setRbbsid(int rbbsid) {
		this.rbbsid = rbbsid;
	}
	public int getBbsid() {
		return bbsid;
	}
	public void setBbsid(int bbsid) {
		this.bbsid = bbsid;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
