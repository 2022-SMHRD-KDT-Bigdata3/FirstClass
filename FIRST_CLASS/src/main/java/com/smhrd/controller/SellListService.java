package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemVO;
import com.smhrd.model.ProdDAO;
import com.smhrd.model.ProdVO;

public class SellListService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("구매목록 기능 요청");
		request.setCharacterEncoding("UTF-8");
		MemVO info = (MemVO)session.getAttribute("info");
		int mem_num = info.getMem_num();
		ProdDAO dao = new ProdDAO();
		ArrayList<ProdVO> list = dao.Sell_List(mem_num);
		ArrayList<ProdVO> list2 = dao.Sell_List2(mem_num);
		
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list);
		}
		for (int i = 0; i < list2.size(); i++) {
			System.out.println(list2);
		}

		RequestDispatcher re = request.getRequestDispatcher("SellList.jsp");
		re.forward(request, response);

	}

}
