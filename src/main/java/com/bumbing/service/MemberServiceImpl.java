package com.bumbing.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bumbing.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	public int signup(MemberVO mem) {
		
		log.info(pwencoder.encode(mem.getPwd()));
		return 1;
	}

}
