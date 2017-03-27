package spring.model.best;

public class BestDTO {
	 private int bestid; 
	 private String chartid;
	 private String popchartid;
	 private String title;
	 private int mlike;
	 private int period;
	 private String url;
	 private String id_list;
	 private String chartType;
	 private String thumbnail;
	 private String artist;
	 
	 
	 
	 public String getPopchartid() {
		return popchartid;
	}
	public void setPopchartid(String popchartid) {
		this.popchartid = popchartid;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getChartType() {
		return chartType;
	}
	public void setChartType(String chartType) {
		this.chartType = chartType;
	}
	public int getBestid() {
		return bestid;
	}
	public void setBestid(int bestid) {
		this.bestid = bestid;
	}
	public String getChartid() {
		return chartid;
	}
	public void setChartid(String chartid) {
		this.chartid = chartid;
	}
	public String getId_list() {
		return id_list;
	}
	public void setId_list(String id_list) {
		this.id_list = id_list;
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
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	 
	 
}