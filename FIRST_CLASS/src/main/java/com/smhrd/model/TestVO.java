package com.smhrd.model;

public class TestVO {
	private int num;
	private String name;

	public TestVO(int num, String name) {
		this.num = num;
		this.name = name;
	}

	public TestVO() {
	}

	@Override
	public String toString() {
		return "TestVO [num=" + num + ", name=" + name + "]";
	}

	public int getNum() {
		return num;
	}

	public String getName() {
		return name;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setName(String name) {
		this.name = name;
	}

}
