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

public class MemUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
		String mem_addr = request.getParameter("mem_addr");
		String mem_ph = request.getParameter("mem_ph");
		
		HttpSession session = request.getSession();
		MemVO info = (MemVO)session.getAttribute("info");
		
		String mem_email = info.getMem_email();
		
		MemVO vo  = new MemVO(mem_email,mem_pw, mem_name, mem_addr, mem_ph);
		
		MemDAO dao = new MemDAO();
		int cnt = dao.update(vo);
		
		
		if(cnt>0) {
			RequestDispatcher re = request.getRequestDispatcher("main.jsp");
			re.forward(request, response);
		}
		else {
			RequestDispatcher re = request.getRequestDispatcher("main.jsp");
			re.forward(request, response);
		}
	}

}
