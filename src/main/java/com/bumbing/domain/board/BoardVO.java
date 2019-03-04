package com.bumbing.domain.board;


import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private String tableName;
	private Long no;
	private String email;
	private String username;
	private String subject;
	private String content;
	private Long readnum;
	private Date rdate;
}
