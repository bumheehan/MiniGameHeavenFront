package com.bumbing.service;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.bumbing.common.MailHandler;
import com.bumbing.common.TempKey;
import com.bumbing.domain.AuthVO;
import com.bumbing.domain.CertiVO;
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
	
	
	
	public boolean signUp(MemberVO mem) {
		
		
		
		String email = mem.getEmail();
		if(memberMapper.readcount(mem)>0) {
			MemberVO mem2 =memberMapper.read(email);
			if(mem2.getState()==0) {
				memberMapper.delMem(mem);
			}else if(mem2.getState()==1) {
				return false;
			}
		}
		
		String post = email.substring(email.indexOf("@")+1).trim();

	
		if (post.equals("applabo.xyz"))
		{
			log.info("admin Signup");
			
			String subject = "Confirm Your MiniGameHeaven Account";
			String templete = "<img src=\"http://www.applabo.xyz/resources/res/mainlogo.png\" style=\"width: 100px;height: 100px\" alt=\"\" id=\"logo\"><div style=\"border-top: 1px solid;border-bottom: 1px solid\"><h2>Confirm Your Account</h2></div><div style=\"margin-top: 20px; margin-bottom:20px\"><p>Welcome to MiniGameHeaven, @name@ !<br/>Please verify your email address to confirm your account. It’s easy - just click below.</p></div><a href=\" @url@ \" style=\"text-decoration:none\"><div style=\"width: 80px; height: 40px;background: black;color: aliceblue;border-radius: 5px;font-size: 14px;text-align: center\">Confirm Now</div></a>";
			mem.setPwd(bcryptPasswordEncoder.encode(mem.getPwd()));
			
			CertiVO cer = new CertiVO();
			cer.setEmail(email);
			cer.setKey(new TempKey().getKey(30,true));
			cer.setType(1);
			templete = templete.replace("@name@", mem.getName());
			templete = templete.replace("@url@", "http://www.applabo.xyz/register?key="+cer.getKey());
			if(mail.sendMail(mem.getEmail(), subject, templete)) {
				memberMapper.signUp(mem);
				memberMapper.addCerti(cer);
				return true;
			}else {
				return false;
			}
		}else {
			String subject = "Confirm Your MiniGameHeaven Account";
			String templete = "<img src=\"http://www.applabo.xyz/resources/res/mainlogo.png\" style=\"width: 100px;height: 100px\" alt=\"\" id=\"logo\"><div style=\"border-top: 1px solid;border-bottom: 1px solid\"><h2>Confirm Your Account</h2></div><div style=\"margin-top: 20px; margin-bottom:20px\"><p>Welcome to MiniGameHeaven, @name@ !<br/>Please verify your email address to confirm your account. It’s easy - just click below.</p></div><a href=\" @url@ \" style=\"text-decoration:none\"><div style=\"width: 80px; height: 40px;background: black;color: aliceblue;border-radius: 5px;font-size: 14px;text-align: center\">Confirm Now</div></a>";
			mem.setPwd(bcryptPasswordEncoder.encode(mem.getPwd()));
			
			CertiVO cer = new CertiVO();
			cer.setEmail(email);
			cer.setKey(new TempKey().getKey(30,true));
			cer.setType(0);
			templete = templete.replace("@name@", mem.getName());
			templete = templete.replace("@url@", "http://www.applabo.xyz/register?key="+cer.getKey());
			if(mail.sendMail(mem.getEmail(), subject, templete)) {
				memberMapper.signUp(mem);
				memberMapper.addCerti(cer);
				return true;
			}else {
				return false;
			}
		}
		
		
		
		
	}
	
	public int activeUser(String key) {
	
		CertiVO cert =memberMapper.selCerti(key);
		if(cert !=null) {
			String email = cert.getEmail();
			if(email!=null) {
				int type = cert.getType();
				if(type==0) {
					memberMapper.activeUser(email);
					memberMapper.delCerti(email);
					memberMapper.addAuth(new AuthVO(email,"ROLE_MEMBER"));
					return 1;
				}else if(type==1) {
					memberMapper.activeUser(email);
					memberMapper.delCerti(email);
					memberMapper.addAuth(new AuthVO(email,"ROLE_MEMBER"));
					memberMapper.addAuth(new AuthVO(email,"ROLE_ADMIN"));
					return 1;
				}else {
					return -1;
				}
				
			}else {
				System.out.println("잘못된 키입력");
				return -1;
			}
		}else {
			return -1;
		}
		
	}
	
	
	public int findpwd(MemberVO mem) {
		
		memberMapper.delCerti(mem.getEmail());
		CertiVO cer = new CertiVO();
		cer.setEmail(mem.getEmail());
		cer.setKey(new TempKey().getKey(10,true));
		cer.setType(3);
		memberMapper.addCerti(cer);
		String subject = "Reset your MiniGame password";
		String templete = "<img src=\"http://www.applabo.xyz/resources/res/mainlogo.png\" style=\"width: 100px;height: 100px\" alt=\"\" id=\"logo\"><div style=\"border-top: 1px solid;border-bottom: 1px solid\"><h2>Forgot your password? No problem!</h2></div><div style=\"margin-top: 20px; margin-bottom:20px\"><p>You can set a new one now! Click the link below.</p></div><a href=\" @url@ \" style=\"text-decoration:none\"><div style=\"width: 80px; height: 40px;background: black;color: aliceblue;border-radius: 5px;font-size: 14px;text-align: center\">Reset Password</div></a>";
		templete = templete.replace("@url@", "http://www.applabo.xyz/findpwdchk.do?key="+cer.getKey());
		mail.sendMail(mem.getEmail(), subject, templete);
		
		return 1;
	}
	public int changePwd(MemberVO mem) {
		CertiVO cert =memberMapper.selCerti(mem.getKey());
		log.info("changePwd"+cert);
		if(cert!=null) {
			String email = cert.getEmail();
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
		}else {
			return -1;
		}
		
		
	}
	
	public String emchk(MemberVO mem) {
		return memberMapper.emchk(mem);
		
	}
	public String namechk(MemberVO mem) {
		return memberMapper.namechk(mem);
	}
	public String delnotconuser() {
		return memberMapper.delnotconuser()+"명이 삭제 되었습니다.";
	}
	
	public long updateProfile1(MemberVO mem) {
		log.info("MemberService  - updateProfile1");
		if(mem.getProfile()==0) {
			File profile = new File("C:\\SOO\\Store\\minigame\\profile\\"+mem.getEmail());
			if(profile.exists()) profile.delete();
			log.info("PROFILE DELETE : "+mem.getEmail());
		}
		if(mem.getPwd().equals("")) {
			return memberMapper.upUser2(mem);
		}else {
			mem.setPwd(bcryptPasswordEncoder.encode(mem.getPwd()));
			return memberMapper.upUser1(mem);
		}
		
		
	}
	public long updateProfile2(MultipartFile mfile,MemberVO mem) {
		
		File profile = new File("C:\\SOO\\Store\\minigame\\profile\\"+mem.getEmail());
		if(profile.exists()) {
			profile.delete();
			System.out.println(profile.exists());
		}
		try {
			mfile.transferTo(profile);
			if(mem.getPwd().equals("")) {
				return memberMapper.upUser2(mem);
			}else {
				mem.setPwd(bcryptPasswordEncoder.encode(mem.getPwd()));
				return memberMapper.upUser1(mem);
			}
			
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		
		
		
		
		
	}
	
}
