package vo;

public class ReviewVO {
	private int review_idx, user1_idx, product_idx;
	private String review_content, review_filename;
	private double review_rating;
	
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	
	public int getUser1_idx() {
		return user1_idx;
	}
	public void setUser1_idx(int user1_idx) {
		this.user1_idx = user1_idx;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_filename() {
		return review_filename;
	}
	public void setReview_filename(String review_filename) {
		this.review_filename = review_filename;
	}
	public double getReview_rating() {
		return review_rating;
	}
	public void setReview_rating(double review_rating) {
		this.review_rating = review_rating;
	}

}
