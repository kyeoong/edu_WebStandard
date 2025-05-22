package och08;

public class Product {
	private String code;
	private String name;
	private int price;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
		if(price<10000) {
			System.out.println("10,000 이하는 등록이 안됩니다");
			return;
		} 
		this.price = price;
	}
	
	
}
