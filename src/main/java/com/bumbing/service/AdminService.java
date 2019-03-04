package com.bumbing.service;

import java.util.List;

import com.bumbing.domain.CommentVO;
import com.bumbing.domain.GameVO;
import com.bumbing.domain.MemberVO;
import com.bumbing.domain.VisitorVO;

public interface AdminService {
	public List<CommentVO> getCList();
	public void cRemove(CommentVO cno);
	public List<GameVO> getGList();
	public void gRemove(String game);
	public List<VisitorVO> getMonthlyVisitors(String start, String end);
	public List<MemberVO> getMList();
}
