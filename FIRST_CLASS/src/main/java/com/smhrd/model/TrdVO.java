package com.smhrd.model;

public class TrdVO {
	private int trd_num;
	private String receiver_addr;
	private String receiver_name;
	private String receiver_phone;
	private int prod_num;

	public TrdVO(int trd_num, String receiver_addr, String receiver_name, String receiver_phone, int prod_num) {
		this.trd_num = trd_num;
		this.receiver_addr = receiver_addr;
		this.receiver_name = receiver_name;
		this.receiver_phone = receiver_phone;
		this.prod_num = prod_num;
	}

	public TrdVO(String receiver_addr, String receiver_name, String receiver_phone, int prod_num) {
		this.receiver_addr = receiver_addr;
		this.receiver_name = receiver_name;
		this.receiver_phone = receiver_phone;
		this.prod_num = prod_num;
	}

	public TrdVO() {
	}

	@Override
	public String toString() {
		return "TrdVO [trd_num=" + trd_num + ", receiver_addr=" + receiver_addr + ", receiver_name=" + receiver_name
				+ ", receiver_phone=" + receiver_phone + ", prod_num=" + prod_num + "]";
	}

	public int getTrd_num() {
		return trd_num;
	}

	public String getReceiver_addr() {
		return receiver_addr;
	}

	public String getReceiver_name() {
		return receiver_name;
	}

	public String getReceiver_phone() {
		return receiver_phone;
	}

	public int getProd_num() {
		return prod_num;
	}

	public void setTrd_num(int trd_num) {
		this.trd_num = trd_num;
	}

	public void setReceiver_addr(String receiver_addr) {
		this.receiver_addr = receiver_addr;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public void setReceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

}
