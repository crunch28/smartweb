package org.smartweb.day6.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {
	private long rno;
	private long bno;
	private String replytext;
	private String replyer;
	
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd [hh:mm:ss]", timezone = "Asia/Seoul")
	private Date regdate;

	private Date updatedate;

}
