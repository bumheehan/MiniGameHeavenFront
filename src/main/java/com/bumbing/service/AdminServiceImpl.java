package com.bumbing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.bumbing.domain.CommentVO;
import com.bumbing.domain.GameVO;
import com.bumbing.domain.MemberVO;
import com.bumbing.domain.VisitorVO;
import com.bumbing.mapper.AdminMapper;
import com.bumbing.mapper.CommentMapper;
import com.bumbing.mapper.GameMapper;
import com.bumbing.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Component
@Log4j
public class AdminServiceImpl implements AdminService {
	
	@Autowired private AdminMapper mapper;
	
	@Autowired private MemberMapper memberMapper;

	@Autowired private CommentMapper commentMapper;
	
	@Autowired private GameMapper gameMapper;
	
	@Override
	public List<CommentVO> getCList() {
		return commentMapper.commentBanList();
	}

	@Override
	public void cRemove(CommentVO cmo) {
		commentMapper.del(cmo);
	}
	
	@Override
	public List<GameVO> getGList() {
		return gameMapper.gameList();
	}

	@Override
	public void gRemove(String game) {
		mapper.delGame(game);
		
	}

	@Override
	public List<VisitorVO> getMonthlyVisitors(String start, String end) {
		log.info(start+"impllllllllllllllllllllllllllllllllllllll");
		return mapper.getMonthlyVisitors(start , end);
	}

	@Override
	public List<MemberVO> getMList() {
		return memberMapper.memList();
	}

}
