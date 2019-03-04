package com.bumbing.service;

import java.util.List;

import com.bumbing.domain.board.BoardVO;
import com.bumbing.domain.board.Criteria;

public interface BoardService {

	public void register(BoardVO board);
	public BoardVO get(BoardVO board);
	public boolean modify(BoardVO board);
	public boolean remove(BoardVO board);
//	public List<BoardVO> getList();
	public List<BoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public String getTableName(int boardnum);
}
