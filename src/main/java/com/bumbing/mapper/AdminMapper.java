package com.bumbing.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bumbing.domain.CommentVO;
import com.bumbing.domain.GameVO;
import com.bumbing.domain.VisitorVO;


public interface AdminMapper {
	
	public List<CommentVO>commentBanList();
	public void delRComment(Long cno);
	public List<GameVO>gameList();
	public void delGame(String game);
	public List<VisitorVO> getMonthlyVisitors(@Param("start") String start,@Param("end") String end);

}
