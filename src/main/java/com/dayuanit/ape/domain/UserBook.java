package com.dayuanit.ape.domain;

public class UserBook {
	private Integer Id;
	private Integer userId;
	private String bookName;
	/**
	 * 阅读进度
	 */
	private Integer progess;
	private String bookUrl;

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public Integer getProgess() {
		return progess;
	}

	public void setProgess(Integer progess) {
		this.progess = progess;
	}

	public String getBookUrl() {
		return bookUrl;
	}

	public void setBookUrl(String bookUrl) {
		this.bookUrl = bookUrl;
	}

}
