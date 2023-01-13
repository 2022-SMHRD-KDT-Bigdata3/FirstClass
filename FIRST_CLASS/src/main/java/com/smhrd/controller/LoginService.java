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

public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// session 영역에 로그인된 정보 저장하기!
		HttpSession session = request.getSession();
		
		String mem_email = request.getParameter("mem_email");
		String mem_pw = request.getParameter("mem_pw");

		MemVO vo = new MemVO(mem_email, mem_pw);
//		System.out.println(vo.toString());

		MemDAO dao = new MemDAO();
		MemVO info = dao.login(vo);

		if (info != null) {
			System.out.println("로그인 성공!");
//			System.out.println(info.toString());
			session.setAttribute("info", info);
		} else {
			System.out.println("로그인 실패...");
		}

		String prevPage = (String) session.getAttribute("prevPage");		
		System.out.println("이전페이지 : "+ prevPage);
		
		// 페이지 이동
//		RequestDispatcher re = request.getRequestDispatcher("main.jsp");
		RequestDispatcher re = request.getRequestDispatcher(prevPage);
		re.forward(request, response);
		

	}

}