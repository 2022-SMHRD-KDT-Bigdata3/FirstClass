package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DB.SqlSessionManager;

public class TrdDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;

	public int insertInfo(TrdVO tvo) {
		session = sqlSessionFactory.openSession(true);
		int tres = session.insert("insertInfo", tvo);
		session.close();
		return tres;
	}

}
