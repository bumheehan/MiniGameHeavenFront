package com.bumbing.service;

import java.lang.reflect.Member;

import org.springframework.web.multipart.MultipartFile;

import com.bumbing.domain.MemberVO;

public interface MemberService {
	
	public boolean signUp(MemberVO mem);
	public int activeUser(String key);
	public int findpwd(MemberVO mem);
	public int changePwd(MemberVO mem);
	public String emchk(MemberVO mem);
	public String namechk(MemberVO mem);
	
	public String delnotconuser();
	public long updateProfile1(MemberVO mem);
	public long updateProfile2(MultipartFile mfile,MemberVO mem);
}
