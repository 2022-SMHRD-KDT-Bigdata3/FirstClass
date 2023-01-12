package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemDAO;
import com.smhrd.model.MemVO;

public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String mem_email = request.getParameter("mem_email");
		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
		String mem_addr = request.getParameter("mem_addr");
		String mem_ph = request.getParameter("mem_ph");

		MemVO vo = new MemVO(mem_email, mem_pw, mem_name, mem_addr, mem_ph);
		System.out.println(vo.toString());

		MemDAO dao = new MemDAO();

		int res = dao.join(vo);

		if (res > 0) {
			System.out.println("회원가입 성공!");
		} else {
			System.out.println("회원가입 실패...");
		}

		response.sendRedirect("main.jsp");

	}

}
