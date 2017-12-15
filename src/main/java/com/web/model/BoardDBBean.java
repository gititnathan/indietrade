package com.web.model;

public class BoardDBBean {
	private int albumNum;
	private String albumName;
	private String artistName;
	private int regdate;
	private String mvlink;
	
	public String getMvlink() {
		return mvlink;
	}
	public void setMvlink(String mvlink) {
		this.mvlink = mvlink;
	}
	public int getAlbumNum() {
		return albumNum;
	}
	public void setAlbumNum(int albumNum) {
		this.albumNum = albumNum;
	}
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	public int getRegdate() {
		return regdate;
	}
	public void setRegdate(int regdate) {
		this.regdate = regdate;
	}
}
