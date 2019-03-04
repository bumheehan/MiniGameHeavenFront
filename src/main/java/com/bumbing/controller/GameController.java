package com.bumbing.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bumbing.domain.CommentVO;
import com.bumbing.domain.GameVO;
import com.bumbing.domain.MemberVO;
import com.bumbing.domain.PagingVO;
import com.bumbing.service.GameCommentService;
import com.bumbing.service.GameCommentServiceImpl;
import com.bumbing.service.GameService;
import com.bumbing.service.MemberService;
import com.bumbing.service.RankingService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class GameController {
	
	@Autowired
	GameCommentService comment;
	
	@Autowired
	GameService gameService;
	
	@Autowired
	RankingService service;
	
	@GetMapping(value="/game")
	public String game (Model model,GameVO game ) {
		model.addAttribute("GameVO", gameService.game(game));
		return "game";
	}
	
	
	@GetMapping("/gamecomment")
	public String gamecomment (Model model,PagingVO pag) {
		model.addAttribute("game", pag.getGame());
		GameVO gam = new GameVO();
		gam.setGame(pag.getGame());
		model.addAttribute("list",comment.paginglist(pag));
		long count = comment.count(gam);
		
		pag.setCount(count);
		pag.setStart((int)(pag.getPageNum()/10)*10+1);
		if(((int)(pag.getPageNum()/10)*10+10)>((count-1)/pag.getAmount()+1)) {
			
			pag.setEnd((int)(count-1)/pag.getAmount()+1);
		}
		else { 
			pag.setEnd((int)(pag.getPageNum()/10)*10+10);
		}
		log.info(pag);
		model.addAttribute("pagingVO",pag);
		return "gamecomment";
	}
	
	@PostMapping("addcomment")
	public String add (CommentVO com) {
	
		comment.add(com);
		return "mainm";
	}
	@PostMapping("delcomment")
	public String del (CommentVO com) {
		
		log.info("delcomment"+com);
		comment.del(com);
		return "mainm";
	}
	@GetMapping("/ranking")
	public String rank(Model model) {

		model.addAttribute("list", service.showRanking());
		return "ranking";
	}
	
}
