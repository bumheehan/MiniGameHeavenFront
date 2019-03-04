
package com.bumbing.mapper;
import java.util.List;

import com.bumbing.domain.CommentVO;
import com.bumbing.domain.GameVO;
import com.bumbing.domain.MemberVO;
import com.bumbing.domain.PagingVO;

public interface CommentMapper {

	public long count(GameVO gam);
	public List<CommentVO>commentBanList();
	public List<CommentVO> paginglist(PagingVO pag);
	public void add(CommentVO com);
	public void del(CommentVO com);
	
	
	
}
