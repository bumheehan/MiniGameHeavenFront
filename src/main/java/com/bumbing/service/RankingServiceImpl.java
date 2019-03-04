package com.bumbing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bumbing.domain.RankingVO;
import com.bumbing.mapper.RankingMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class RankingServiceImpl implements RankingService {

	@Autowired
	RankingMapper mapper;
	
	@Override
	public List<RankingVO> showRanking() {
		// TODO Auto-generated method stub
		return mapper.rank();
	}

}
