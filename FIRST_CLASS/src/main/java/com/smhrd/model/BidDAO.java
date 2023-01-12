package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DB.SqlSessionManager;

public class BidDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;

	public ArrayList<BidVO> Buy_List(int mem_num) {
		session = sqlSessionFactory.openSession(true);
		List<BidVO> list = session.selectList("Buy_List", mem_num);
		session.close();
		return (ArrayList<BidVO>) list;
	}

	public ArrayList<BidVO> Buy_List2(int mem_num) {
		session = sqlSessionFactory.openSession(true);
		List<BidVO> list = session.selectList("Buy_List2", mem_num);
		session.close();
		return (ArrayList<BidVO>) list;
	}

	public ArrayList<BidVO> bidCheck(int prod_num) {
		session = sqlSessionFactory.openSession(true);
		List<BidVO> bidCheck = session.selectList("bidCheck", prod_num);
		session.close();
		return (ArrayList<BidVO>) bidCheck;
	}

	public int bidInsert(BidVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res= 0; 
		res = session.insert("bidInsert", vo);
		session.close();
		return res;
	}
}
