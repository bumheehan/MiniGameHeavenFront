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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@GetMapping("/auth")
	public String auth () {
		return "auth";
	}
	
	@RequestMapping("/login")
	public void login () {
	}
	@RequestMapping("/signup")
	public void signup () {
	}
	
	
	@PostMapping("/signup.do")
	public String test (MemberVO mem) {
		log.info(mem);
		memberService.signUp(mem);
		return "login";
	}
	
	@PostMapping("/findpwd.do")
	public String find (MemberVO mem) {
		log.info(mem);
		memberService.findpwd(mem);
		return "login";
	}
	
	@PostMapping("/emailchk.do")
	@ResponseBody
	public String emchk (MemberVO mem) {
		log.info(mem);
		return mem.getEmail();//memberService.emchk(mem);
	}
	/*
	@PostMapping("/namechk.do")
	public @ResponseBody int namechk (MemberVO mem) {
		return 1; //memberService.namechk(mem);
	}
	
	*/
	@GetMapping("/changePwd")
	public void changePwd () {
	}
	
	@GetMapping("/user")
	public void user() {
	}
	
	
	@GetMapping("/findpwdchk.do")
	public String findck (MemberVO mem,RedirectAttributes rttr) {
		log.info(mem);
		
		return "redirect:/changePwd?key="+mem.getKey();
	}
	@PostMapping("/changePwd.do")
	public String changePwd (MemberVO mem) {
		log.info(mem);
		memberService.changePwd(mem);
		return "login";
	}
	
	@GetMapping("/register")
	public String activeUser (MemberVO mem) {
		int suc = memberService.activeUser(mem.getKey());
		
		if (suc ==1) {
			return "redirect:/login";
		}
			
		else {
			return "error";
		}
		
	}

}
