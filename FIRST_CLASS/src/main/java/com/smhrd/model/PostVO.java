package com.smhrd.model;

import java.util.Date;

//Value Object
public class PostVO {

	private int post_num;
	private int mem_num;
	private String post_title;
	private String post_con;
	private Date post_date; //String도 가능
		
	//전체
	public PostVO(int post_num, int mem_num, String post_title, String post_con, Date post_date) {
		this.post_num = post_num;
		this.mem_num = mem_num;
		this.post_title = post_title;
		this.post_con = post_con;
		this.post_date = post_date;
	}

	// insert
	public PostVO(int mem_num, String post_title, String post_con) {		
		this.mem_num = mem_num;
		this.post_title = post_title;
		this.post_con = post_con;
	}
	
	// delete
	public PostVO(int post_num, int mem_num) {		
		this.post_num = post_num;
		this.mem_num = mem_num;
	}
	
	public PostVO() {
	}

	@Override
	public String toString() {
		return "PostVO [post_num=" + post_num + ", mem_num=" + mem_num + ", post_title=\" + post_title + \", post_con="
				+ post_con + ", post_date=" + post_date + "]";
	}

	public int getPost_num() {
		return post_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public String getPost_title() {
		return post_title;
	}
	public String getPost_con() {
		return post_con;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public void setPost_con(String post_con) {
		this.post_con = post_con;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	
}
