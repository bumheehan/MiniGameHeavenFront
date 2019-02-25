package com.bumbing.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class GameVO {

	private int game;
	private String gameName;
	private int width;
	private int height;
	
	public GameVO(){
		this(800,800);
	}
	public GameVO(int width,int height){
		
		this.width=width;
		this.height=height;
	}
	public GameVO(String gameName, int width, int height) {
		this.gameName = gameName;
		this.width = width;
		this.height = height;
	}
	
}