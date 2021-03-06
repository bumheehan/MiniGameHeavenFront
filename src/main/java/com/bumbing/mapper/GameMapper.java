
package com.bumbing.mapper;
import java.util.List;

import com.bumbing.domain.CommentVO;
import com.bumbing.domain.GameVO;
import com.bumbing.domain.MemberVO;
import com.bumbing.domain.PagingVO;


public interface GameMapper {
	public GameVO game(GameVO gam);
	public void read(GameVO gam);
	public void add(GameVO gam);
	public void del(GameVO gam);
	public List<GameVO>gameList();
}
