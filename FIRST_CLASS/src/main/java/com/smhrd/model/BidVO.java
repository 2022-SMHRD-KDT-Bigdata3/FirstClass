package com.smhrd.model;

import java.util.Date;

public class BidVO {

	private int bid_num;
	private int prod_num;
	private int bid_price;
	private int mem_num;
	private Date bid_time;

	public BidVO(int bid_num, int prod_num, int bid_price, int mem_num, Date bid_time) {
		this.bid_num = bid_num;
		this.prod_num = prod_num;
		this.bid_price = bid_price;
		this.mem_num = mem_num;
		this.bid_time = bid_time;
	}

	public BidVO(int prod_num, int bid_price, int mem_num) {
		this.prod_num = prod_num;
		this.bid_price = bid_price;
		this.mem_num = mem_num;
	}

	public BidVO() {

	}

	@Override
	public String toString() {
		return "BidVO [bid_num=" + bid_num + ", prod_num=" + prod_num + ", bid_price=" + bid_price + ", mem_num="
				+ mem_num + ", bid_time=" + bid_time + "]";
	}

	public int getBid_num() {
		return bid_num;
	}

	public void setBid_num(int bid_num) {
		this.bid_num = bid_num;
	}

	public int getProd_num() {
		return prod_num;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

	public int getBid_price() {
		return bid_price;
	}

	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public Date getBid_time() {
		return bid_time;
	}

	public void setBid_time(Date bid_time) {
		this.bid_time = bid_time;
	}

}
