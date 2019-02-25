
package com.bumbing.mapper;

import com.bumbing.domain.AuthVO;
import com.bumbing.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String email);
	
	public MemberVO readname(String username);
	
	public int signUp(MemberVO mem);
	
	public int activeUser(String email);
	
	public void addAuth(AuthVO au);
	
	public void addCerti(MemberVO mem);
	
	public void delCerti(String email);
	
	public String selCerti(String key);

	public void delAuth(String email,String auth);
	
	public void changePwd(MemberVO mem);
	
	public String emchk(MemberVO mem);
	
	public String namechk(MemberVO mem);
	
	public long delnotconuser();
	
	public long upUser1(MemberVO mem);
	
	public long upUser2(MemberVO mem);
	
	
	
}
