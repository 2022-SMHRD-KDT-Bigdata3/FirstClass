package com.smhrd.model;

public class MemVO {
	private int mem_num;
	private String mem_email;
	private String mem_pw;
	private String mem_name;
	private String mem_addr;
	private String mem_ph;
	private String mem_grade;
	private int mem_po;
	private String mem_type;

	public MemVO(int mem_num, String mem_email, String mem_pw, String mem_name, String mem_addr, String mem_ph,
			String mem_grade, int mem_po, String mem_type) {
		this.mem_num = mem_num;
		this.mem_email = mem_email;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_addr = mem_addr;
		this.mem_ph = mem_ph;
		this.mem_grade = mem_grade;
		this.mem_po = mem_po;
		this.mem_type = mem_type;
	}

	public MemVO(String mem_email, String mem_pw, String mem_name, String mem_addr, String mem_ph) {
		this.mem_email = mem_email;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_addr = mem_addr;
		this.mem_ph = mem_ph;
	}

	public MemVO(String mem_email, String mem_pw) {
		this.mem_email = mem_email;
		this.mem_pw = mem_pw;
	}

	public MemVO() {
	}

	@Override
	public String toString() {
		return "MemVO [mem_num=" + mem_num + ", mem_email=" + mem_email + ", mem_pw=" + mem_pw + ", mem_name="
				+ mem_name + ", mem_addr=" + mem_addr + ", mem_ph=" + mem_ph + ", mem_grade=" + mem_grade + ", mem_po="
				+ mem_po + ", mem_type=" + mem_type + "]";
	}

	public int getMem_num() {
		return mem_num;
	}

	public String getMem_email() {
		return mem_email;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public String getMem_addr() {
		return mem_addr;
	}

	public String getMem_ph() {
		return mem_ph;
	}

	public String getMem_grade() {
		return mem_grade;
	}

	public int getMem_po() {
		return mem_po;
	}

	public String getMem_type() {
		return mem_type;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}

	public void setMem_ph(String mem_ph) {
		this.mem_ph = mem_ph;
	}

	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}

	public void setMem_po(int mem_po) {
		this.mem_po = mem_po;
	}

	public void setMem_type(String mem_type) {
		this.mem_type = mem_type;
	}

}