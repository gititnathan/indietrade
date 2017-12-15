package com.web.model;

public class AlbumDBBean {
	private int albumnum;
	private int artistnum;
	private String albumtitle;
	private String genre;
	private String musicFiles;
	private String mvLink;
	private String albumDesc;
	private int downloadcount;
	private int readcount;
	private int uplike;
	private int regdate;
	private String contributor;
	private String albumImage;
	
	public String getContributor() {
		return contributor;
	}
	public void setContributor(String contributor) {
		this.contributor = contributor;
	}
	public int getAlbumnum() {
		return albumnum;
	}
	public void setAlbumnum(int albumnum) {
		this.albumnum = albumnum;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getMusicFiles() {
		return musicFiles;
	}
	public void setMusicFiles(String musicFiles) {
		this.musicFiles = musicFiles;
	}
	public String getAlbumImage() {
		return albumImage;
	}
	public void setAlbumImage(String albumImage) {
		this.albumImage = albumImage;
	}
	public int getArtistnum() {
		return artistnum;
	}
	public void setArtistnum(int artistnum) {
		this.artistnum = artistnum;
	}
	public String getAlbumtitle() {
		return albumtitle;
	}
	public void setAlbumtitle(String albumtitle) {
		this.albumtitle = albumtitle;
	}
	public String getMvLink() {
		return mvLink;
	}
	public void setMvLink(String mvLink) {
		this.mvLink = mvLink;
	}
	public String getAlbumDesc() {
		return albumDesc;
	}
	public void setAlbumDesc(String albumDesc) {
		this.albumDesc = albumDesc;
	}
	public int getDownloadcount() {
		return downloadcount;
	}
	public void setDownloadcount(int downloadcount) {
		this.downloadcount = downloadcount;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getUplike() {
		return uplike;
	}
	public void setUplike(int uplike) {
		this.uplike = uplike;
	}
	public int getRegdate() {
		return regdate;
	}
	public void setRegdate(int regdate) {
		this.regdate = regdate;
	}
	
}
