package com.bumbing.domain;

import lombok.Data;

@Data
public class PagingVO {

	private int pageNum;
	private int amount;
	private int game=1;
	private int start;
	private int end;
	private long count;
	
	
	PagingVO(){
		this(1,10);
	}
	PagingVO(int pageNum,int amount){
		this.pageNum=pageNum;
		this.amount=amount;
	}
	
	
}
