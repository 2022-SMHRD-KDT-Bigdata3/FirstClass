package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemDAO;
import com.smhrd.model.MemVO;

public class PointCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemVO info = (MemVO)session.getAttribute("info");
		int mem_num = info.getMem_num();
		MemDAO dao = new MemDAO();
		int res = dao.PointCheck(mem_num);
		
		
		if (res> 0) {
			System.out.println("포인트 조회 성공");
			RequestDispatcher re = request.getRequestDispatcher("PointCheck.jsp");
			re.forward(request, response);
		}
		else {
			System.out.println("포인트 조회 실패");
			RequestDispatcher re = request.getRequestDispatcher("PointCheck.jsp");
			re.forward(request, response);
		}
		
		
		
		
		
	}

}
