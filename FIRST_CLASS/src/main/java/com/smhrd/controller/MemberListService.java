package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemDAO;
import com.smhrd.model.MemVO;

public class MemberListService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemDAO dao = new MemDAO();
		ArrayList<MemVO> list =dao.memberList();
		request.setAttribute("list", list);
		RequestDispatcher re = request.getRequestDispatcher("Memberlist.jsp");
		re.forward(request, response);
		
	}

}
