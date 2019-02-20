package com.bumbing.service;

import java.lang.reflect.Member;

import com.bumbing.domain.MemberVO;

public interface MemberService {
	
	public int signUp(MemberVO mem);
	public int activeUser(String key);
	public int findpwd(MemberVO mem);
	public int changePwd(MemberVO mem);
	public int emchk(MemberVO mem);
	public int namechk(MemberVO mem);
}
