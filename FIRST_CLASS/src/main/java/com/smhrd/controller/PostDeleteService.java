package com.smhrd.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.PostDAO;
import com.smhrd.model.PostVO;

public class PostDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));

		PostDAO dao = new PostDAO();
		PostVO vo=new PostVO(post_num, mem_num);
		int res = dao.postDelete(vo);
		
		if(res > 0 ) {
			System.out.println("게시글삭제 성공");
		}else {
			System.out.println("게시글삭제 실패");
		}
		response.sendRedirect("PostMain.jsp");
	}

}
