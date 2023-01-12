package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.TestDAO;
import com.smhrd.model.TestVO;

public class TestService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("name");

		TestVO vo = new TestVO(num, name);
		System.out.println(vo.toString());

		TestDAO dao = new TestDAO();
		int res = dao.join(vo);
		if (res > 0) {
			System.out.println("테스트 성공!");
		} else {
			System.out.println("테스트 실패...");
		}

	}

}
