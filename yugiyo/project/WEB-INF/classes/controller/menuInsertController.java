package controller;

import menu.model.*;
import shop.service.ShopService;
import util.HttpUtil;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.MenuService;

public class menuInsertController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String MenuID = req.getParameter("MenuID");
		String MBoardID = req.getParameter("MBoardID");
		String name = req.getParameter("name");
		int price = Integer.parseInt(req.getParameter("price"));
		
		Menu menu = new Menu();
		menu.setMenuID(MenuID);
		menu.setMBoardID(MBoardID);
		menu.setName(name);
		menu.setPrice(price);
		
		MenuService service = MenuService.getInstance();
		int result = service.MenuInsert(menu);
		
		if (result == 1) {
			HttpUtil.forward(req, resp, "/result/addmenuResult.jsp");
		}
		else if(result == 0) {
			HttpUtil.forward(req, resp, "/result/addmenuFail.jsp");
		}
		
		
	}

}
