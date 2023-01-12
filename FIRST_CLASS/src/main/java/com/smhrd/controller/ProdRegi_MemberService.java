package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemVO;
import com.smhrd.model.ProdDAO;
import com.smhrd.model.ProdVO;

public class ProdRegi_MemberService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("charset=UTF-8");

		MemVO info = (MemVO) session.getAttribute("info");

		String prodName = request.getParameter("prodName");
		int mem_num = info.getMem_num();
		String isUrg = request.getParameter("isUrg");

		ProdVO vo = new ProdVO(prodName, mem_num, isUrg);
		
		ProdDAO dao = new ProdDAO();

		int res = dao.prodReg_mem(vo);

		if (res > 0) {
			System.out.println("물품등록 성공");
			RequestDispatcher re = request.getRequestDispatcher("main.jsp");
			re.forward(request, response);
		} else {
			System.out.println("물품등록 실패");
		}

	}

}
