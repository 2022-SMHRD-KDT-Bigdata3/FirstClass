package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DB.SqlSessionManager;

public class JoinDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;

	public ArrayList<JoinVO> buyingList(int mem_num) {
		session = sqlSessionFactory.openSession(true);
		List<JoinVO> jlist = session.selectList("buyingList", mem_num);
		session.close();
		return (ArrayList<JoinVO>) jlist;
	}
}
