
package com.bumbing.mapper;

import com.bumbing.domain.AuthVO;
import com.bumbing.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String email);
	
	public int signUp(MemberVO mem);
	
	public int activeUser(String email);
	
	public int addAuth(AuthVO au);
}
