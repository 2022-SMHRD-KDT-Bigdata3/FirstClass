package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DB.SqlSessionManager;

public class TestDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;

	public int join(TestVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res = 0;
		res = session.insert("join", vo);
		session.close();
		return res;
	}

}
