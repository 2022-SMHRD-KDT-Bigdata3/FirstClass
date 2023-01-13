package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.BidDAO;
import com.smhrd.model.BidVO;
import com.smhrd.model.Join3DAO;
import com.smhrd.model.Join3VO;
import com.smhrd.model.MemDAO;
import com.smhrd.model.MemVO;
import com.smhrd.model.ProdDAO;
import com.smhrd.model.ProdVO;
import com.smhrd.model.TrdDAO;
import com.smhrd.model.TrdVO;

public class setSucBidderService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
//		int bidder_id = Integer.parseInt(request.getParameter("bidder_id"));
		int bid_price = Integer.parseInt(request.getParameter("bid_price"));
		int seller_id = Integer.parseInt(request.getParameter("seller_id"));

		ProdDAO dao = new ProdDAO();

		BidDAO bdao = new BidDAO();
		BidVO bvo = new BidVO(prod_num, bid_price);

		// 최대 입찰 건 찾아오기(누가 최대 입찰 불렀니?)
		BidVO maxBidVO = bdao.selectOneBid(bvo);
		int bidder_id = maxBidVO.getMem_num();

		// 낙찰자 prod 테이블에 저장할 VO(update vo)
		ProdVO upvo = new ProdVO(prod_num, 0, bidder_id);
		int res = dao.updateBidder(upvo);

		if (res > 0) {
			System.out.println("낙찰자 등록 성공!");
		} else {
			System.out.println("낙찰자 등록 실패...");
		}

		MemDAO mdao = new MemDAO();
		int mem_num = bidder_id;

		// 구매자 정보 trd 테이블에 저장할 vo
		MemVO mvo1 = mdao.selectOne(mem_num);
		String receiver_addr = mvo1.getMem_addr();
		String receiver_name = mvo1.getMem_name();
		String receiver_phone = mvo1.getMem_ph();

		TrdVO tvo = new TrdVO(receiver_addr, receiver_name, receiver_phone, prod_num);
		TrdDAO tdao = new TrdDAO();
		int tres = tdao.insertInfo(tvo);
		if (tres > 0) {
			System.out.println("낙찰자 정보 업데이트 성공!");
		} else {
			System.out.println("낙찰자 정보 업데이트 실패...");
		}
		
		// 모든 입찰 건 찾아오기(누가누가 입찰 했니?)
		Join3DAO j3dao = new Join3DAO();
		ArrayList<Join3VO> allBidList = j3dao.selAllBid(prod_num);
		System.out.println(allBidList.toString());
		
		for(int i=0;i<allBidList.size();i++) {
			mem_num = allBidList.get(i).getBidder();
			int mem_po = allBidList.get(i).getBid_price();
			int mres=0;
			MemVO bidMemvo = new MemVO(mem_num, mem_po);
			if(i==0) {
				mres = mdao.pointMinus(bidMemvo);
				if(mres>0) {
					System.out.println(mem_num+"에게"+mem_po+"포인트 차감 성공!");
				} else {
					System.out.println(mem_num+"에게"+mem_po+"포인트 차감 실패...");
				}
			} else {
				mres = mdao.pointPlus(bidMemvo);
				if(mres>0) {
					System.out.println(mem_num+"에게"+mem_po+"포인트 반환 성공!");
				} else {
					System.out.println(mem_num+"에게"+mem_po+"포인트 반환 실패...");
				}
			}
		}

		response.sendRedirect("AuctionConfirm.jsp");
	}

}
