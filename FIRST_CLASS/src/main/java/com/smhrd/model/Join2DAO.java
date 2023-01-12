package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DB.SqlSessionManager;

public class Join2DAO {
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;

	public ArrayList<Join2VO> selectPopProd() {
		session = sqlSessionFactory.openSession(true);
		List<Join2VO> list = session.selectList("selectPopProd");
		session.close();
		return (ArrayList<Join2VO>) list;
	}

}
