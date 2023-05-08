package vo;

public class ProducerVO {
	private int producer_idx, subscription_price;
	private String producer_name, producer_addr;
	public int getProducer_idx() {
		return producer_idx;
	}
	public void setProducer_idx(int producer_idx) {
		this.producer_idx = producer_idx;
	}
	public int getSubscription_price() {
		return subscription_price;
	}
	public void setSubscription_price(int subscription_price) {
		this.subscription_price = subscription_price;
	}
	public String getProducer_name() {
		return producer_name;
	}
	public void setProducer_name(String producer_name) {
		this.producer_name = producer_name;
	}
	public String getProducer_addr() {
		return producer_addr;
	}
	public void setProducer_addr(String producer_addr) {
		this.producer_addr = producer_addr;
	}
}
