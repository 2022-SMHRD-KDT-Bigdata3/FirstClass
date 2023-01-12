package com.smhrd.model;

public class TimeVO {
	private long diffHour;
	private long diffMin;
	private long diffSec;

	public TimeVO(long diffHour, long diffMin, long diffSec) {
		this.diffHour = diffHour;
		this.diffMin = diffMin;
		this.diffSec = diffSec;
	}

	public TimeVO() {
	}

	@Override
	public String toString() {
		return "TimeVO [diffHour=" + diffHour + ", diffMin=" + diffMin + ", diffSec=" + diffSec + "]";
	}

	public long getDiffHour() {
		return diffHour;
	}

	public long getDiffMin() {
		return diffMin;
	}

	public long getDiffSec() {
		return diffSec;
	}

	public void setDiffHour(long diffHour) {
		this.diffHour = diffHour;
	}

	public void setDiffMin(long diffMin) {
		this.diffMin = diffMin;
	}

	public void setDiffSec(long diffSec) {
		this.diffSec = diffSec;
	}

}
