package com.bumbing.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	
	//@Autowired
	//private JavaMailSender mailSender;

	
	public int signUp(MemberVO mem) {
		mem.setPwd(pwencoder.encode(mem.getPwd()));
		int state = memberMapper.signUp(mem);
		/*
		
		if(state ==1) {
			//권한 등록
			//memberMapper.addAuth(new AuthVO(mem.getEmail(),"role1"));
			//메일보내기
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

				messageHelper.setFrom("admin"); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo("kjhhjk1234@naver.com"); // 받는사람 이메일
				messageHelper.setSubject("test"); // 메일제목은 생략이 가능하다
				messageHelper.setText("test"); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}
			
			//메일성공
			return 1;
		}
	*/
		
		return 0;
	}

}
