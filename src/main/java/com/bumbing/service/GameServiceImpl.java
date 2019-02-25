package com.bumbing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bumbing.domain.CommentVO;
import com.bumbing.domain.GameVO;
import com.bumbing.domain.PagingVO;
import com.bumbing.mapper.GameMapper;

@Service
public class GameServiceImpl implements GameService {
	
	@Autowired
	GameMapper gameMapper;
	
	public GameVO game(GameVO gam) {
		
		return gameMapper.game(gam);
	}
	
	public void add(GameVO gam) {
		gameMapper.add(gam);
	}
	
	public void del(GameVO gam) {
		gameMapper.del(gam);
	}

}
