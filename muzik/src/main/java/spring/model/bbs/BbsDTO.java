package spring.model.bbs;

import org.springframework.web.multipart.MultipartFile;

public class BbsDTO {
	private int bbsid;
	private int viewcnt;
	private String id;
	private String title;
	private String content;
	private String cdate;
	private String filename;
	private int filesize;
	private MultipartFile fileMf;
	
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	
	public int getBbsid() {
		return bbsid;
	}
	public void setBbsid(int bbsid) {
		this.bbsid = bbsid;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public MultipartFile getFileMf() {
		return fileMf;
	}
	public void setFileMf(MultipartFile fileMf) {
		this.fileMf = fileMf;
	}
}
 