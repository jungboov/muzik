package spring.model.music;

public class ChartDTO {
	int rank;
	int period;
	String chartid;
	String chRank;
	String title;
	String artist;
	String album;
	String thumbnail;
	String url;
	int mlike;
	String separator;
	String cdate;
	String invenName;//인벤토리네임..
	int invenId;
	String chartType;
	
	public String getChartid() {
		return chartid;
	}
	public void setChartid(String chartid) {
		this.chartid = chartid;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public String getChRank() {
		return chRank;
	}
	public void setChRank(String chRank) {
		this.chRank = chRank;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getMlike() {
		return mlike;
	}
	public void setMlike(int mlike) {
		this.mlike = mlike;
	}
	public String getSeparator() {
		return separator;
	}
	public void setSeparator(String separator) {
		this.separator = separator;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getInvenName() {
		return invenName;
	}
	public void setInvenName(String invenName) {
		this.invenName = invenName;
	}
	public int getInvenId() {
		return invenId;
	}
	public void setInvenId(int invenId) {
		this.invenId = invenId;
	}
	public String getChartType() {
		return chartType;
	}
	public void setChartType(String chartType) {
		this.chartType = chartType;
	}
	
}
