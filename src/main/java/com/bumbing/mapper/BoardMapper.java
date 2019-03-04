
package com.bumbing.mapper;
import java.util.List;

import com.bumbing.domain.CommentVO;
import com.bumbing.domain.GameVO;
import com.bumbing.domain.MemberVO;
import com.bumbing.domain.PagingVO;
import com.bumbing.domain.board.BoardVO;
import com.bumbing.domain.board.Criteria;

public interface BoardMapper {
	public String getTableName(int boardnum);
	public List<BoardVO> getList();
	public List<BoardVO> getListWithPaging(Criteria cri);
	public void insert(BoardVO board);
	public BoardVO read(BoardVO board);
	public int delete(BoardVO board);
	public int update(BoardVO board);
	public int getTotalCount(Criteria cri);
	
	
	
}
