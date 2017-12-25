package com.eleven.entity;

public class Notice {
	private int n_id;
	private String n_title;

	public int getN_id() {
		return n_id;
	}

	public void setN_id(int n_id) {
		this.n_id = n_id;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_desc() {
		return n_desc;
	}

	public void setN_desc(String n_desc) {
		this.n_desc = n_desc;
	}

	private String n_desc;
}
