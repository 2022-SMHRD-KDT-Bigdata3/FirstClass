package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DB.SqlSessionManager;

public class ProdDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;

	public int prodReg_mem(ProdVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res = 0;
		res = session.insert("prodReg_mem", vo);
		session.close();
		return res;
	}

	public ArrayList<ProdVO> prodList() {
		session = sqlSessionFactory.openSession(true);
		List<ProdVO> list = session.selectList("prodList");
		session.close();
		return (ArrayList<ProdVO>) list;
	}

	public int ProdRegi_Admin_Input(ProdVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res = 0;
		res = session.update("ProdRegi_Admin_Input", vo);
		session.close();
		return res;
	}

	public ArrayList<ProdVO> selectCate(int cate_num) {
		session = sqlSessionFactory.openSession(true);
		List<ProdVO> list = session.selectList("selectCate", cate_num);
		session.close();
		return (ArrayList<ProdVO>) list;
	}

	public ArrayList<ProdVO> selectAllProd() {
		session = sqlSessionFactory.openSession(true);
		List<ProdVO> list = session.selectList("selectAll");
		session.close();
		return (ArrayList<ProdVO>) list;
	}

	public ArrayList<ProdVO> selectUrg() {
		session = sqlSessionFactory.openSession(true);
		List<ProdVO> list = session.selectList("selectUrg");
		session.close();
		return (ArrayList<ProdVO>) list;
	}

	public ProdVO selectOneProd(int prod_num) {
		session = sqlSessionFactory.openSession(true);
		ProdVO vo = session.selectOne("selectOneProd", prod_num);
		session.close();
		return vo;
	}

	public ArrayList<ProdVO> Sell_List(int mem_num) {

		session = sqlSessionFactory.openSession(true);
		List<ProdVO> list = session.selectList("Sell_List", mem_num);
		session.close();
		return (ArrayList<ProdVO>) list;

	}

	public ArrayList<ProdVO> Sell_List2(int mem_num) {
		session = sqlSessionFactory.openSession(true);
		List<ProdVO> list = session.selectList("Sell_List2", mem_num);
		session.close();
		return (ArrayList<ProdVO>) list;
	}

	public int updateCur(ProdVO pvo) {
		session = sqlSessionFactory.openSession(true);
		int Cres = session.update("updateCur", pvo);
		session.close();
		return Cres;
	}

	public int aucClose(int prod_num) {
		session = sqlSessionFactory.openSession(true);
		int ires = session.update("aucClose", prod_num);
		session.close();
		return ires;
	}

	public ArrayList<ProdVO> searchProd(String prod_name) {
		session = sqlSessionFactory.openSession(true);
		List<ProdVO> list = session.selectList("searchProd", prod_name);
		session.close();
		return (ArrayList<ProdVO>) list;
	}

	public int updateBidder(ProdVO upvo) {
		session = sqlSessionFactory.openSession(true);
		int res = session.update("updateBidder", upvo);
		session.close();
		return res;
	}

}
