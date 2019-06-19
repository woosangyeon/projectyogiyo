package menu.model;

public class Menu {
		String MenuID;
		String MBoardID;
		String name;
		int price;
		
		public String getMenuID() {
			return MenuID;
		}
		public void setMenuID(String menuID) {
			MenuID = menuID;
		}
		public String getMBoardID() {
			return MBoardID;
		}
		public void setMBoardID(String mBoardID) {
			MBoardID = mBoardID;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		
}
