package com.smhrd.model;

import java.util.Date;

public class Join2VO {
	// 인기경매 탐색에 사용
	private int prod_num;
	private String prod_img;
	private String prod_name;
	private String bid_isUrgency;
	private Date prod_time;
	private int prod_cur;
	private int prod_imme;
	private int bid_count;

	public Join2VO(int prod_num, String prod_img, String prod_name, String bid_isUrgency, Date prod_time, int prod_cur,
			int prod_imme, int bid_count) {
		this.prod_num = prod_num;
		this.prod_img = prod_img;
		this.prod_name = prod_name;
		this.bid_isUrgency = bid_isUrgency;
		this.prod_time = prod_time;
		this.prod_cur = prod_cur;
		this.prod_imme = prod_imme;
		this.bid_count = bid_count;
	}

	public Join2VO() {
	}

	@Override
	public String toString() {
		return "Join2VO [prod_num=" + prod_num + ", prod_img=" + prod_img + ", prod_name=" + prod_name
				+ ", bid_isUrgency=" + bid_isUrgency + ", prod_time=" + prod_time + ", prod_cur=" + prod_cur
				+ ", prod_imme=" + prod_imme + ", bid_count=" + bid_count + "]";
	}

	public int getProd_num() {
		return prod_num;
	}

	public String getProd_img() {
		return prod_img;
	}

	public String getProd_name() {
		return prod_name;
	}

	public String getBid_isUrgency() {
		return bid_isUrgency;
	}

	public Date getProd_time() {
		return prod_time;
	}

	public int getProd_cur() {
		return prod_cur;
	}

	public int getProd_imme() {
		return prod_imme;
	}

	public int getBid_count() {
		return bid_count;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public void setBid_isUrgency(String bid_isUrgency) {
		this.bid_isUrgency = bid_isUrgency;
	}

	public void setProd_time(Date prod_time) {
		this.prod_time = prod_time;
	}

	public void setProd_cur(int prod_cur) {
		this.prod_cur = prod_cur;
	}

	public void setProd_imme(int prod_imme) {
		this.prod_imme = prod_imme;
	}

	public void setBid_count(int bid_count) {
		this.bid_count = bid_count;
	}

}
