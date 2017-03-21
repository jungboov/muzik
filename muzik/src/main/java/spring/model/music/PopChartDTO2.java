package spring.model.music;

public class PopChartDTO2 {
	int rank;
	String week;
	String chRank;
	String title;
	String artist;
	String album;
	String thumb;
	String url;
	int mlike;
	int likeid;
	String id;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLikeid() {
		return likeid;
	}
	public void setLikeid(int likeid) {
		this.likeid = likeid;
	}
	public int getMlike() {
		return mlike;
	}
	public void setMlike(int mlike) {
		this.mlike = mlike;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getWeekid() {
		return weekid;
	}
	public void setWeekid(String weekid) {
		this.weekid = weekid;
	}
	String weekid;
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
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
	public String getThumb() {
		return thumb;
	}
	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
	
}
