package com.bumbing.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.bumbing.domain.AuthVO;
import com.bumbing.domain.MemberVO;
import com.bumbing.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Autowired
	private MemberMapper memberMapper;
	

	
	public int signUp(MemberVO mem) {
		mem.setPwd(pwencoder.encode(mem.getPwd()));
		int state = memberMapper.signUp(mem);
		
		
		if(state ==1) {
			//권한 등록
			//memberMapper.addAuth(new AuthVO(mem.getEmail(),"role1"));
			//메일보내기
			
			
			
		    
			//메일성공
			return 1;
		}
		
		return 0;
	}

}
