package com.bumbing.controller;

import java.awt.PageAttributes.MediaType;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bumbing.domain.MemberVO;
import com.bumbing.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RestController
@Log4j
public class LoginControllerRest {
	
	@Autowired
	MemberService memberService;
	
	@PostMapping("/signup.do")
	public String test (MemberVO mem) {
		log.info(mem);
		if(memberService.signUp(mem)) {
			return "1";
		}else {
			return "0";
		}
		
	}
	
	@PostMapping(value="/emailchk.do" ,produces="text/plain; charset=UTF-8")
	public String emchk (MemberVO mem) {
		log.info(mem);
		return memberService.emchk(mem);
	}

	
	@PostMapping("/namechk.do")
	public String namechk (MemberVO mem) {
		log.info(mem);
		return memberService.namechk(mem);
	}
	@GetMapping(value="/delnotconuser.do" ,produces="text/plain; charset=UTF-8")
	public String delnotconuser () {
		return memberService.delnotconuser();
	}
	
	@PostMapping("/profile.do")
	public void profile (MultipartFile mfile,MemberVO mem) {
		if(mfile==null) {
			memberService.updateProfile1(mem);
		}else {
			memberService.updateProfile2(mfile,mem);
		}

		
	}
}
