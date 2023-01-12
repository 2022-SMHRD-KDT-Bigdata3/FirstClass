package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.DB.SqlSessionManager;

public class PostDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;

	// 글쓰기 기능
	public int postInsert(PostVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res = session.insert("postInsert", vo);
		System.out.println(vo);
		session.close();
		return res;
	}

	// 글 전체 목록 보기
	public ArrayList<PostVO> postList() {
		session = sqlSessionFactory.openSession(true);
		List<PostVO> list = session.selectList("postList");
		System.out.println(list);
		session.close();
		return (ArrayList<PostVO>) list;
	}

	// 내 게시글 보기
	public ArrayList<PostVO> postSelectOne(int post_num) {
		session = sqlSessionFactory.openSession(true);
		List<PostVO> list = session.selectList("postSelectOne", post_num);
		session.close();
		return (ArrayList<PostVO>) list;
	}

	// 삭제 기능
	public int postDelete(PostVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res = session.delete("postDelete", vo);
		session.close();
		return res;
	}

}
