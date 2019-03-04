package com.bumbing.mapper;

import java.util.List;

import com.bumbing.domain.cardGameDTO;


public interface CardRankingMapper {

		public List<cardGameDTO> getRankList(cardGameDTO card);
		public cardGameDTO getRank(cardGameDTO card);
		public void addRank(cardGameDTO card);
}
