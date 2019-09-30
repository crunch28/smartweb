package org.smartweb.day6.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	private String type;
	private String keyword;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	/*
	 * public void setPageNum(int pageNum) { this.pageNum = (pageNum - 1) *
	 * this.amount; }
	 */

	public int getSkip() {
		return (this.pageNum - 1) * this.amount;
	}

	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
