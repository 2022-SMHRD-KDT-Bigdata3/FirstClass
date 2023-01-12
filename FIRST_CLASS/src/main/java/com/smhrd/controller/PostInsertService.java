package com.smhrd.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemVO;
import com.smhrd.model.PostDAO;
import com.smhrd.model.PostVO;
import com.sun.jdi.request.EventRequestManager;

public class PostInsertService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("게시글입력 기능요청");

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		// 사용자가 입력한 게시글 정보 가져오기
		String post_title = request.getParameter("post_title");
		String post_con = request.getParameter("post_con");
		MemVO mvo = (MemVO)session.getAttribute("info");
		int mem_num = mvo.getMem_num();
		
		PostVO vo = new PostVO(mem_num, post_title, post_con);
		System.out.println(vo.toString());

		PostDAO dao = new PostDAO();
		int res = dao.postInsert(vo);

		if (res > 0) {
			System.out.println("게시글 입력 성공");
		} else {
			System.out.println("게시글 입력 실패");
		}

		response.sendRedirect("PostMain.jsp");

	}

}
