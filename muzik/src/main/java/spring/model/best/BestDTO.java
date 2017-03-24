package spring.model.best;

public class BestDTO {
	 private String bestid; 
	 private String chartid;
	 private String title;
	 private int mlike;
	 private String week;
	 private String url;
	 
	 public String getBestid() {
		return bestid;
	}
	public void setBestid(String bestid) {
		this.bestid = bestid;
	}
	public String getChartid() {
		return chartid;
	}
	public void setChartid(String chartid) {
		this.chartid = chartid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getMlike() {
		return mlike;
	}
	public void setMlike(int mlike) {
		this.mlike = mlike;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	 
	 
}