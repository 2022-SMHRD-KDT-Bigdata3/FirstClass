package com.smhrd.model;

import java.util.Date;

public class JoinVO {
	// 마이페이지의 구매내역-진행중인 경매에 사용
	// prod 와 bid 테이블 inner join
	private int prod_num;
	private String prod_name;
	private int bid_price;
	private int mem_num;
	private Date prod_time;

	public JoinVO(int prod_num, String prod_name, int bid_price, int mem_num, Date prod_time) {
		this.prod_num = prod_num;
		this.prod_name = prod_name;
		this.bid_price = bid_price;
		this.mem_num = mem_num;
		this.prod_time = prod_time;
	}

	public JoinVO() {
	}

	@Override
	public String toString() {
		return "JoinVO [prod_num=" + prod_num + ", prod_name=" + prod_name + ", bid_price=" + bid_price + ", mem_num="
				+ mem_num + ", prod_time=" + prod_time + "]";
	}

	public int getProd_num() {
		return prod_num;
	}

	public String getProd_name() {
		return prod_name;
	}

	public int getBid_price() {
		return bid_price;
	}

	public int getMem_num() {
		return mem_num;
	}

	public Date getProd_time() {
		return prod_time;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public void setProd_time(Date prod_time) {
		this.prod_time = prod_time;
	}
}
