package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemDAO;

public class MemberDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int mem_num=Integer.parseInt(request.getParameter("mem_num"));
		
		MemDAO dao = new MemDAO();
		
		dao.memberDelete(mem_num);
		
        response.sendRedirect("MemberListService");
	}

}
