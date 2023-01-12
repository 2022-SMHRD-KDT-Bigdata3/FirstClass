package com.smhrd.model;

public class Join3VO {
	// 관리자의 경매확인에 사용
	private String prod_img;
	private String prod_num;
	private String prod_name;
	private int seller;
	private int bid_price;
	private int bidder;
	private String suc_bidder;

	public Join3VO(String prod_img, String prod_num, String prod_name, int seller, int bid_price, int bidder,
			String suc_bidder) {
		this.prod_img = prod_img;
		this.prod_num = prod_num;
		this.prod_name = prod_name;
		this.seller = seller;
		this.bid_price = bid_price;
		this.bidder = bidder;
		this.suc_bidder = suc_bidder;
	}

	public Join3VO() {
	}

	@Override
	public String toString() {
		return "Join3VO [prod_img=" + prod_img + ", prod_num=" + prod_num + ", prod_name=" + prod_name + ", seller="
				+ seller + ", bid_price=" + bid_price + ", bidder=" + bidder + ", suc_bidder=" + suc_bidder + "]";
	}

	public String getProd_img() {
		return prod_img;
	}

	public String getProd_num() {
		return prod_num;
	}

	public String getProd_name() {
		return prod_name;
	}

	public int getSeller() {
		return seller;
	}

	public int getBid_price() {
		return bid_price;
	}

	public int getBidder() {
		return bidder;
	}

	public String getSuc_bidder() {
		return suc_bidder;
	}

	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}

	public void setProd_num(String prod_num) {
		this.prod_num = prod_num;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public void setSeller(int seller) {
		this.seller = seller;
	}

	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}

	public void setBidder(int bidder) {
		this.bidder = bidder;
	}

	public void setSuc_bidder(String suc_bidder) {
		this.suc_bidder = suc_bidder;
	}

}
