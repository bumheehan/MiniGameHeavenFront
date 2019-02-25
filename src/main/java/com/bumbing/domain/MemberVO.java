package com.bumbing.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String email;
	private String pwd;
	private String userName;
	private boolean enabled;
	private Date cDate;
	private Date dDate;
	private int state;
	private long profile;
	private String aboutMe;
	private String key;
	private List<AuthVO> authList;

}