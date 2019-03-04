package com.bumbing.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bumbing.domain.cardGameDTO;
import com.bumbing.mapper.CardRankingMapper;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */

@Controller
@Log4j
@RequestMapping(value="/colorgame")
public class ColorGameController {

	@Autowired
	CardRankingMapper cardRankingMapper;
	
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/send",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String inputdata(@RequestParam HashMap<String,String> paramMap) {
		System.out.println(paramMap);
		
		long totalTime = Integer.parseInt(paramMap.get("mm"))*60000+Integer.parseInt(paramMap.get("ss"))*1000+Integer.parseInt(paramMap.get("ms"));
		System.out.println(totalTime);
		cardGameDTO card = new cardGameDTO();
		card.setEmail(paramMap.get("email"));
		card.setRecord(totalTime);
		int c1= Integer.parseInt(paramMap.get("c1"));
		int c2= Integer.parseInt(paramMap.get("c2"));
		int co= Integer.parseInt(paramMap.get("co"));
		card.setC1(c1);
		card.setC2(c2);
		card.setCo(co);
		
		cardRankingMapper.addRank(card);
		cardGameDTO rank = cardRankingMapper.getRank(card);
		
		return rank.getRank()+"";
	}
	
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/rank")
	public String colorgamerank(Model model, @RequestParam HashMap<String,String> paramMap) {
		int c1= Integer.parseInt(paramMap.get("c1"));
		int c2= Integer.parseInt(paramMap.get("c2"));
		int co= Integer.parseInt(paramMap.get("co"));
		cardGameDTO card = new cardGameDTO();
		card.setC1(c1);
		card.setC2(c2);
		card.setCo(co);
		List<cardGameDTO> list = cardRankingMapper.getRankList(card);
		for(cardGameDTO cardc : list) {
			long time = cardc.getRecord();
			long ms = time%1000;
			time -= ms;
			time /=1000;
			long mm = time/60;
			long ss = time%60;
			cardc.setShowRecord(String.format("%02d : %02d : %03d",mm,ss,ms));
		}
		model.addAttribute("rank",list);
		return "colorgamerank";
	}
	
}
