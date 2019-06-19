package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.MboardService;
import mBoard.model.MBoard;
import util.HttpUtil;

public class mboardInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String MBoardID = req.getParameter("MBoardID");
		String ShopId = req.getParameter("ShopId");
		
		MBoard mboard = new MBoard();
		mboard.setMBoardID(MBoardID);
		mboard.setShopId(ShopId);
		
		MboardService service = MboardService.getInstance();
		service.MboardInsert(mboard);
		
		HttpUtil.forward(req, resp, "/result/addshopResult.jsp");
		
		
	}

}
