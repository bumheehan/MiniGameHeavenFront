package com.bumbing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bumbing.domain.board.BoardVO;
import com.bumbing.domain.board.Criteria;
import com.bumbing.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) {

		log.info("###register...." + board);
		mapper.insert(board);
	}

	@Override
	public BoardVO get(BoardVO board) {
		log.info("###get....."+board.getNo());
		return mapper.read(board);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("##modify......"+board);
		return mapper.update(board) ==1;
	}

	@Override
	public boolean remove(BoardVO board) {
		log.info("##remove..."+board.getNo());
		return mapper.delete(board)==1;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("##getList....with criteria............:"+cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count"+cri);
		return mapper.getTotalCount(cri);
	}
	@Override
	public String getTableName(int boardnum) {
		return mapper.getTableName(boardnum);
	}
}
