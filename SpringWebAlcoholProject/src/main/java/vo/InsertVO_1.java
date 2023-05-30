package vo;

public class InsertVO_1 {
	private String producer_name;
	private int producer_idx, subscription_price;
	private String producer_addr;

	public int getSubscription_price() {
		try {
			int a = this.subscription_price;
		} catch (Exception e) {
			// TODO: handle exception
			return 5000;
		}
		return subscription_price;
	}

	public void setSubscription_price(int subscription_price) {
		this.subscription_price = subscription_price;
	}

	public String getProducer_addr() {
		if (this.producer_addr == null) {
			return "서울시 마포구";
		}
		return producer_addr;
	}

	public void setProducer_addr(String producer_addr) {
		this.producer_addr = producer_addr;
	}

	public String getProducer_name() {
		return producer_name;
	}

	public void setProducer_name(String producer_name) {
		this.producer_name = producer_name;
	}

	public int getProducer_idx() {
		return producer_idx;
	}

	public void setProducer_idx(int producer_idx) {
		this.producer_idx = producer_idx;
	}

}
