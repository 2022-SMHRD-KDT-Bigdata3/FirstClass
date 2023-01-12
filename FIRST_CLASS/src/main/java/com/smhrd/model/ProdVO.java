package com.smhrd.model;

import java.util.Date;

public class ProdVO {
	private int prod_num;
	private int cate_num;
	private String prod_name;
	private int mem_num;
	private String bid_isUrgency;
	private Date prod_time;
	private String prod_opinion;
	private int prod_price;
	private int prod_cur;
	private int prod_imme;
	private int bidder_id;
	private String prod_img;

	public ProdVO(int prod_num, int cate_num, String prod_name, int mem_num, String bid_isUrgency, Date prod_time,
			String prod_opinion, int prod_price, int prod_cur, int prod_imme, int bidder_id, String prod_img) {
		this.prod_num = prod_num;
		this.cate_num = cate_num;
		this.prod_name = prod_name;
		this.mem_num = mem_num;
		this.bid_isUrgency = bid_isUrgency;
		this.prod_time = prod_time;
		this.prod_opinion = prod_opinion;
		this.prod_price = prod_price;
		this.prod_cur = prod_cur;
		this.prod_imme = prod_imme;
		this.bidder_id = bidder_id;
		this.prod_img = prod_img;
	}

	// 관리자 판매등록시 사용
	public ProdVO(int prod_num, int cate_num, Date prod_time, String prod_opinion, int prod_price, int prod_cur,
			int prod_imme, String prod_img) {
		this.prod_num = prod_num;
		this.cate_num = cate_num;
		this.prod_time = prod_time;
		this.prod_opinion = prod_opinion;
		this.prod_price = prod_price;
		this.prod_cur = prod_cur;
		this.prod_imme = prod_imme;
		this.prod_img = prod_img;
	}

	// 사용자 판매등록시 사용
	public ProdVO(String prod_name, int mem_num, String bid_isUrgency) {
		this.prod_name = prod_name;
		this.mem_num = mem_num;
		this.bid_isUrgency = bid_isUrgency;
	}

	// 현재입찰가 갱신시 사용, 낙찰자 업데이트시 사용(안쓰는건 null)
	public ProdVO(int prod_num, int prod_cur, int bidder_id) {
		this.prod_num = prod_num;
		this.prod_cur = prod_cur;
		this.bidder_id = bidder_id;
	}


	public ProdVO() {
	}

	@Override
	public String toString() {
		return "ProdVO [prod_num=" + prod_num + ", cate_num=" + cate_num + ", prod_name=" + prod_name + ", mem_num="
				+ mem_num + ", bid_isUrgency=" + bid_isUrgency + ", prod_time=" + prod_time + ", prod_opinion="
				+ prod_opinion + ", prod_price=" + prod_price + ", prod_cur=" + prod_cur + ", prod_imme=" + prod_imme
				+ ", bidder_id=" + bidder_id + ", prod_img=" + prod_img + "]";
	}

	public int getProd_num() {
		return prod_num;
	}

	public int getCate_num() {
		return cate_num;
	}

	public String getProd_name() {
		return prod_name;
	}

	public int getMem_num() {
		return mem_num;
	}

	public String getBid_isUrgency() {
		return bid_isUrgency;
	}

	public Date getProd_time() {
		return prod_time;
	}

	public String getProd_opinion() {
		return prod_opinion;
	}

	public int getProd_price() {
		return prod_price;
	}

	public int getProd_cur() {
		return prod_cur;
	}

	public int getProd_imme() {
		return prod_imme;
	}

	public int getBidder_id() {
		return bidder_id;
	}

	public String getProd_img() {
		return prod_img;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public void setBid_isUrgency(String bid_isUrgency) {
		this.bid_isUrgency = bid_isUrgency;
	}

	public void setProd_time(Date prod_time) {
		this.prod_time = prod_time;
	}

	public void setProd_opinion(String prod_opinion) {
		this.prod_opinion = prod_opinion;
	}

	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}

	public void setProd_cur(int prod_cur) {
		this.prod_cur = prod_cur;
	}

	public void setProd_imme(int prod_imme) {
		this.prod_imme = prod_imme;
	}

	public void setBidder_id(int bidder_id) {
		this.bidder_id = bidder_id;
	}

	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}

}
