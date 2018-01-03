package com.eleven.entity;

import java.net.URLEncoder;

public class Goods {
	private int g_id;
	private String g_name;
	private String g_nameToUTF8;
	private int gb_id;
	private int gs_id;
	private String g_bpic;
	private String g_bpic1;
	private String g_bpic2;
	private String g_spic1;
	private String g_spic2;
	private String g_desc;
	private double g_carry;
	private int g_count;
	private double g_price;
	private double g_dis;
	private String g_type;

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
		setG_nameToUTF8();
	}
	
	public String getG_nameToUTF8() {
		return g_nameToUTF8;
	}

	private void setG_nameToUTF8() {
		try {
			g_nameToUTF8 = URLEncoder.encode(g_name, "utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getGb_id() {
		return gb_id;
	}

	public void setGb_id(int gb_id) {
		this.gb_id = gb_id;
	}

	public int getGs_id() {
		return gs_id;
	}

	public void setGs_id(int gs_id) {
		this.gs_id = gs_id;
	}

	public String getG_bpic() {
		return g_bpic;
	}

	public void setG_bpic(String g_bpic) {
		this.g_bpic = g_bpic;
	}

	public String getG_bpic1() {
		return g_bpic1;
	}

	public void setG_bpic1(String g_bpic1) {
		this.g_bpic1 = g_bpic1;
	}

	public String getG_bpic2() {
		return g_bpic2;
	}

	public void setG_bpic2(String g_bpic2) {
		this.g_bpic2 = g_bpic2;
	}

	public String getG_spic1() {
		return g_spic1;
	}

	public void setG_spic1(String g_spic1) {
		this.g_spic1 = g_spic1;
	}

	public String getG_spic2() {
		return g_spic2;
	}

	public void setG_spic2(String g_spic2) {
		this.g_spic2 = g_spic2;
	}

	public String getG_desc() {
		return g_desc;
	}

	public void setG_desc(String g_desc) {
		this.g_desc = g_desc;
	}

	public double getG_carry() {
		return g_carry;
	}

	public void setG_carry(double g_carry) {
		this.g_carry = g_carry;
	}

	public int getG_count() {
		return g_count;
	}

	public void setG_count(int g_count) {
		this.g_count = g_count;
	}

	public double getG_price() {
		return g_price;
	}

	public void setG_price(double g_price) {
		this.g_price = g_price;
	}

	public double getG_dis() {
		return g_dis;
	}

	public void setG_dis(double g_dis) {
		this.g_dis = g_dis;
	}

	public String getG_type() {
		return g_type;
	}

	public void setG_type(String g_type) {
		this.g_type = g_type;
	}

}
