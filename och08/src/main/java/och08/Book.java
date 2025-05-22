package och08;

public class Book extends Product	{ // 책이 Product를 상속 받았으니까 코드, name, price 다 있는거다 즉 5개 coloum 이 있다
	private String writer;
	private int page;
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	

}
