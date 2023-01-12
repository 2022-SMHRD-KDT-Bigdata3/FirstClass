package com.smhrd.model;

public class CateVO {
	private int cate_num;
	private String cate_name;

	public CateVO(int cate_num, String cate_name) {
		this.cate_num = cate_num;
		this.cate_name = cate_name;
	}

	public CateVO() {
	}

	@Override
	public String toString() {
		return "CateVO [cate_num=" + cate_num + ", cate_name=" + cate_name + "]";
	}

	public int getCate_num() {
		return cate_num;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

}
