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
	
	public ArrayList<Join3VO> selAllBid(int prod_num){
		// 낙찰된 상품에 입찰했던 모든 사용자들 보려고 씀
		session = sqlSessionFactory.openSession(true);
		List<Join3VO> list = session.selectList("selAllBid", prod_num);
		session.close();
		return (ArrayList<Join3VO>) list;
	}
	
	
}
