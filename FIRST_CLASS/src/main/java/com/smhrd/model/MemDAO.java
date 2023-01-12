package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DB.SqlSessionManager;

public class MemDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;

	public int join(MemVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res = 0;
		res = session.insert("join_mem", vo);
		session.close();
		return res;
	}

	public MemVO login(MemVO vo) {
		session = sqlSessionFactory.openSession(true);
		MemVO info = null;
		info = session.selectOne("login", vo);
		System.out.println(vo);
		session.close();
		return info;
	}

	public int update(MemVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res = session.update("update_mem", vo);
		session.close();
		return res;
	}

	public int PointCheck(int mem_num) {
		session = sqlSessionFactory.openSession(true);
		int res = session.selectOne("pointCheck", mem_num);
		session.close();
		return res;
	}

	public ArrayList<MemVO> memberList() {
		session = sqlSessionFactory.openSession(true);
		List<MemVO> list = session.selectList("memberList");
		session.close();
		return (ArrayList<MemVO>) list;
	}

	public int memberDelete(int mem_num) {
		session = sqlSessionFactory.openSession(true);
		int res = 0;
		res = session.delete("memberDelete", mem_num);
		session.close();
		return res;
	}

	public MemVO search_id(String mem_email) {
		session = sqlSessionFactory.openSession(true);
		MemVO info = null;
		info = session.selectOne("serch_id", mem_email);
		session.close();
		return info;
	}

	public int updatePoint(MemVO mvo) {
		session = sqlSessionFactory.openSession(true);
		int mres = session.update("updatePoint", mvo);
		session.close();
		return mres;
	}

	public MemVO selectOne(int mem_num) {
		session = sqlSessionFactory.openSession(true);
		MemVO mvo1 = session.selectOne("selectOne", mem_num);
		session.close();		
		return mvo1;
	}
	
	public int updatePoint2(MemVO mvo2) {
		session = sqlSessionFactory.openSession(true);
		int mres2 = session.update("updatePoint2", mvo2);
		session.close();
		return mres2;
	}

}
