package shop.model;

public class Shop {
	String ShopId;
	String type;
	String name;
	int reqprice;
	String payment;
	String info;
	String tel;
	String address;
	String availTime;
	int reputation;
	public String getShopId() {
		return ShopId;
	}
	public void setShopId(String shopId) {
		ShopId = shopId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getReqprice() {
		return reqprice;
	}
	public void setReqprice(int reqprice) {
		this.reqprice = reqprice;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAvailTime() {
		return availTime;
	}
	public void setAvailTime(String availTime) {
		this.availTime = availTime;
	}
	public int getReputation() {
		return reputation;
	}
	public void setReputation(int reputation) {
		this.reputation = reputation;
	}
	
	
}
