package com.bumbing.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bumbing.common.MailHandler;
import com.bumbing.common.TempKey;
import com.bumbing.domain.AuthVO;
import com.bumbing.domain.MemberVO;
import com.bumbing.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private PasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MailHandler mail;
	
	
	
	public int signUp(MemberVO mem) {
		String subject = "Confirm Your MiniGameHeaven Account";
		String templete = "<img src=\"http://www.applabo.xyz/resources/res/mainlogo.png\" style=\"width: 100px;height: 100px\" alt=\"\" id=\"logo\"><div style=\"border-top: 1px solid;border-bottom: 1px solid\"><h2>Confirm Your Account</h2></div><div style=\"margin-top: 20px; margin-bottom:20px\"><p>Welcome to MiniGameHeaven, @name@ !<br/>Please verify your email address to confirm your account. It’s easy - just click below.</p></div><a href=\" @url@ \" style=\"text-decoration:none\"><div style=\"width: 80px; height: 40px;background: black;color: aliceblue;border-radius: 5px;font-size: 14px;text-align: center\">Confirm Now</div></a>";
		mem.setPwd(bcryptPasswordEncoder.encode(mem.getPwd()));
		mem.setKey(new TempKey().getKey(30,true));
		int state = memberMapper.signUp(mem);
		memberMapper.addCerti(mem);
		templete = templete.replace("@name@", mem.getUserName());
		templete = templete.replace("@url@", "http://www.applabo.xyz/register?key="+mem.getKey());
		mail.sendMail(mem.getEmail(), subject, templete);
		return 0;
	}
	
	public int activeUser(String key) {
		String email =memberMapper.selCerti(key);
	
		if(email!=null) {
			memberMapper.activeUser(email);
			memberMapper.delCerti(email);
			
			
			memberMapper.addAuth(new AuthVO(email,"MEMBER"));
			return 1;
		}else {
			System.out.println("잘못된 키입력");
			return -1;
		}
	}
	
	public int findpwd(MemberVO mem) {
		
		memberMapper.delCerti(mem.getEmail());
		mem.setKey(new TempKey().getKey(10,true));
		memberMapper.addCerti(mem);
		String subject = "Reset your MiniGame password";
		String templete = "<img src=\"http://www.applabo.xyz/resources/res/mainlogo.png\" style=\"width: 100px;height: 100px\" alt=\"\" id=\"logo\"><div style=\"border-top: 1px solid;border-bottom: 1px solid\"><h2>Forgot your password? No problem!</h2></div><div style=\"margin-top: 20px; margin-bottom:20px\"><p>You can set a new one now! Click the link below.</p></div><a href=\" @url@ \" style=\"text-decoration:none\"><div style=\"width: 80px; height: 40px;background: black;color: aliceblue;border-radius: 5px;font-size: 14px;text-align: center\">Reset Password</div></a>";
		templete = templete.replace("@url@", "http://www.applabo.xyz/findpwdchk.do?key="+mem.getKey());
		mail.sendMail(mem.getEmail(), subject, templete);
		
		return 1;
	}
	public int changePwd(MemberVO mem) {
		String email =memberMapper.selCerti(mem.getKey());
		mem.setEmail(email);
		
		if(email!=null) {
			mem.setPwd(bcryptPasswordEncoder.encode(mem.getPwd()));
			memberMapper.changePwd(mem);
			memberMapper.delCerti(email);
			return 1;
		}else {
			System.out.println("잘못된 키입력");
			return -1;
		}
		
	}
	
	public int emchk(MemberVO mem) {
		return memberMapper.emchk(mem);
		
	}
	public int namechk(MemberVO mem) {
		return memberMapper.namechk(mem);
	}
	
	
	
	
}
