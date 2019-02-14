package com.bumbing.test;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bumbing.domain.MemberVO;
import com.bumbing.mapper.MemberMapper;
import com.bumbing.mapper.TimeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MapperTest {
	
	@Autowired
	private MemberMapper memberMapper ;
	
	@Test
	public void testExist() {
		
		log.info(memberMapper.read("kjhhjk1234@naver.com"));
		MemberVO mem =memberMapper.read("kjhhjk1234@naver.com");
	}


}