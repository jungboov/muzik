package spring.model.faq;

public class FaqDTO {
	private int faqid;              
	private String title;     
	private String content;
	
	public int getFaqid() {
		return faqid;
	}
	public void setFaqid(int faqid) {
		this.faqid = faqid;
	}
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
	
}
