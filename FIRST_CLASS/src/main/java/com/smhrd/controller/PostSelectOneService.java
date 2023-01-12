package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.PostDAO;
import com.smhrd.model.PostVO;

public class PostSelectOneService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// PostMain.jsp에서 클릭한 해당 게시글의 고유 번호를 가져온다
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		PostDAO dao = new PostDAO();
		// 포스트 넘버와 일치하는 해당 게시글 정보 하나를 가져온다
		ArrayList<PostVO> list = dao.postSelectOne(post_num);
		//System.out.println(vo.toString());
		// 게시글 하나를 볼 수 있는 곳으로 페이지 이동
		// 게시글 정보는 postSelectOne.jsp에서만 보기때문에 request영역에 저장 후
		// forward로 페이지 이동
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("PostSelectOne.jsp");
		rd.forward(request, response);
	}

}
