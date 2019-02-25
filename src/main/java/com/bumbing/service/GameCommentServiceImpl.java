package com.bumbing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bumbing.domain.CommentVO;
import com.bumbing.domain.GameVO;
import com.bumbing.domain.PagingVO;
import com.bumbing.mapper.CommentMapper;

@Service
public class GameCommentServiceImpl implements GameCommentService {

	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public long count(GameVO gam) {
		return commentMapper.count(gam);
	}

	@Override
	public List<CommentVO> paginglist(PagingVO pag) {
		// TODO Auto-generated method stub
		pag.setStart((pag.getPageNum()-1)*pag.getAmount());
		return commentMapper.paginglist(pag);
	}

	@Override
	public void add(CommentVO com) {
		// TODO Auto-generated method stub
		commentMapper.add(com);
	}

	@Override
	public void del(CommentVO com) {
		// TODO Auto-generated method stub
		commentMapper.del(com);
	}

}
