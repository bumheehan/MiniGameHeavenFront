package com.bumbing.controller;

import java.io.File;
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
public class LoginController {
	
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
	
	

	@PostMapping("/findpwd.do")
	public String find (MemberVO mem) {
		log.info(mem);
		memberService.findpwd(mem);
		return "login";
	}
	
	@GetMapping("/changePwd")
	public void changePwd () {
	}
	
	@GetMapping("/user")
	public void user(MemberVO mem,Model model) {
		
		File f = new File("C:\\SOO\\Store\\minigame\\profile\\"+mem.getEmail());
		if (f.isFile()) {
			model.addAttribute("profile", "1");
		}else {
			model.addAttribute("profile", "0");
		}
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
