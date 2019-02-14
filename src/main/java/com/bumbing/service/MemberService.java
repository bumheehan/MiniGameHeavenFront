package com.bumbing.service;

import com.bumbing.domain.MemberVO;

public interface MemberService {
	
	public int signUp(MemberVO mem);
	public int activeUser(String key);
	public int findpwd(MemberVO mem);
	public int changePwd(MemberVO mem);
}
