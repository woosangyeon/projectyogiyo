package coupon.model;

public class Coupon {
		String CouponId;
		String CustomerId;
		int discountPrice;
		
		public String getCouponId() {
			return CouponId;
		}
		public void setCouponId(String couponId) {
			CouponId = couponId;
		}
		public String getCustomerId() {
			return CustomerId;
		}
		public void setCustomerId(String customerId) {
			CustomerId = customerId;
		}
		public int getDiscountPrice() {
			return discountPrice;
		}
		public void setDiscountPrice(int discountPrice) {
			this.discountPrice = discountPrice;
		}
		
}
