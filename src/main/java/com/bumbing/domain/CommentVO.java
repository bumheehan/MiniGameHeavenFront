package com.bumbing.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentVO {

	private long no;
	private int game;
	private int score;
	private String email;
	private String userName;
	private String comment;
	private Date regDate;
	
}