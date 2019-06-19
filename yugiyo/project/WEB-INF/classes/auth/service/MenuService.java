package auth.service;

import auth.dao.MenuDAO;
import menu.model.Menu;

public class MenuService {
	
	private static MenuService service = new MenuService();
	public MenuDAO dao = MenuDAO.getInstance();
	private MenuService() {}
	
	public static MenuService getInstance() {
		return service;
	}
	
	public int MenuInsert(Menu menu) {
		 return dao.MenuInsert(menu);
	}
	//public Menu MenuSearch(String id) {
		//return dao.menuSearch(id);
	//}

}
