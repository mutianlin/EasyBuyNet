package com.eleven.entity;

public class Buycar {
	private int c_id;
	private int u_id;
	private int g_id;
	private String c_name;
	private double c_price;
	private int c_count;
	private String c_desc;
	private double c_money;

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	
	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public double getC_price() {
		return c_price;
	}

	public void setC_price(double c_price) {
		this.c_price = c_price;
	}

	public int getC_count() {
		return c_count;
	}

	public void setC_count(int c_count) {
		this.c_count = c_count;
	}

	public String getC_desc() {
		return c_desc;
	}

	public void setC_desc(String c_desc) {
		this.c_desc = c_desc;
	}

	public double getC_money() {
		return c_money;
	}

	public void setC_money(double c_money) {
		this.c_money = c_money;
	}

}
