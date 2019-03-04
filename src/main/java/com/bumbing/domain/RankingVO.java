package com.bumbing.domain;


import java.util.Date;

import lombok.Data;

@Data
public class RankingVO {
	private String id;
	private long score;
	private Date regdate;
	private Date updatedate;
	private int ranking;
}
