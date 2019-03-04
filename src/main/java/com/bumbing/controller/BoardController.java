package com.bumbing.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bumbing.domain.board.BoardPagingVO;
import com.bumbing.domain.board.BoardVO;
import com.bumbing.domain.board.Criteria;
import com.bumbing.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model,int boardnum) {
		String tableName = service.getTableName(boardnum);
		log.info("board : " +tableName);
		cri.setTableName(tableName);
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);
		log.info("total: " + total);

		model.addAttribute("pageMaker", new BoardPagingVO(cri, total));

	}
	
	
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr ,int boardnum) {
		String tableName = service.getTableName(boardnum);
		board.setTableName(tableName);
		log.info("register : "+board);
		
		service.register(board);
		rttr.addFlashAttribute("result", board.getNo());
		
		return "redirect:/board/list?boardnum="+boardnum;
	}
	@GetMapping("/register")
	public void register() {
		
	}
	/*
	@GetMapping({"/get", "/modify" })
	public void get(@RequestParam("no") Long no, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify ");
		model.addAttribute("board", service.get());
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : "+ board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list"+cri.getListLink();
	}
	*/
	@PostMapping("/remove")
	public String remove(Long no,int boardnum, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		String tableName = service.getTableName(boardnum);
		BoardVO board = new BoardVO();
		board.setTableName(tableName);
		board.setNo(no);
		log.info("remove..."+board);
		/*
		if(service.remove(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		*/
		return "redirect:/board/list"+cri.getListLink()+"boardnum="+boardnum;
	}
	
	
}
