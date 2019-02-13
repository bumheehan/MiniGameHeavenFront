package com.bumbing.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bumbing.domain.MemberVO;
import com.bumbing.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class testcontroller {
	
	@Autowired
	MemberService memberService;
	
	
	@GetMapping("/")
	public String main () {
		return "mainm";
	}
	
	@GetMapping("/{path}")
	public String test (@PathVariable String path) {
		return path;
	}
	@PostMapping("/signup.do")
	public String test (MemberVO mem) {
		log.info(mem);
		memberService.signUp(mem);
		return "login";
	}
	
	@GetMapping("/register")
	public String activeUser (MemberVO mem) {
		int suc = memberService.activeUser(mem.getKey());
		
		if (suc ==1) {
			return "login";
		}
			
		else {
			return "erroe";
		}
		
	}

}
