package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DB.SqlSessionManager;

public class Join3DAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;

	public ArrayList<Join3VO> AucResSuc() {
		// 낙찰된 상품들
		session = sqlSessionFactory.openSession(true);
		List<Join3VO> list = session.selectList("AucResSuc");
		session.close();
		return (ArrayList<Join3VO>) list;
	}
	
	public ArrayList<Join3VO> AucResFail() {
		// 유찰된 상품들
		session = sqlSessionFactory.openSession(true);
		List<Join3VO> list = session.selectList("AucResFail");
		session.close();
		return (ArrayList<Join3VO>) list;
	}
}
