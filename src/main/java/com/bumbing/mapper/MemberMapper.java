
package com.bumbing.mapper;

import java.util.List;

import com.bumbing.domain.AuthVO;
import com.bumbing.domain.CertiVO;
import com.bumbing.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String email);
	public List<MemberVO> memList();
	public int readcount(MemberVO mem);
	public int signUp(MemberVO mem);
	
	public int delMem(MemberVO mem);
	
	public int activeUser(String email);
	
	public void addAuth(AuthVO au);
	
	public void addCerti(CertiVO cer);
	
	public void delCerti(String email);
	
	public CertiVO selCerti(String key);

	public void delAuth(String email,String auth);
	
	public void changePwd(MemberVO mem);
	
	public String emchk(MemberVO mem);
	
	public String namechk(MemberVO mem);
	
	public long delnotconuser();
	
	public long upUser1(MemberVO mem);
	
	public long upUser2(MemberVO mem);
	
	
	
}
