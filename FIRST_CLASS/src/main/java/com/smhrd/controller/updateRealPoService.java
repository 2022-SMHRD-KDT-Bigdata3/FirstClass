package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemDAO;
import com.smhrd.model.MemVO;

public class updateRealPoService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		MemVO info = (MemVO) session.getAttribute("info");
		int mem_po = (int) session.getAttribute("realDecPo");
		int mem_num = info.getMem_num();

		MemDAO dao = new MemDAO();
		MemVO vo = new MemVO(mem_num, mem_po);
		int res = dao.pointMinus(vo);

		if (res > 0) {
			System.out.println("포인트 차감 성공!");
			System.out.println(mem_num + "의 포인트 차감액 : " + mem_po);
		} else {
			System.out.println("포인트 차감 실패...");
		}

	}

}
