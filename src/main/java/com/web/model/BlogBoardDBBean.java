package com.web.model;

public class BlogBoardDBBean {
	private String artistId;
	private String loginId;
	private int loginNo;
	private String Ip;
	private String content;
	private int contentNo;
	public String getArtistId() {
		return artistId;
	}
	public void setArtistId(String artistId) {
		this.artistId = artistId;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public int getLoginNo() {
		return loginNo;
	}
	public void setLoginNo(int loginNo) {
		this.loginNo = loginNo;
	}
	public String getIp() {
		return Ip;
	}
	public void setIp(String ip) {
		Ip = ip;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getContentNo() {
		return contentNo;
	}
	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}
}
