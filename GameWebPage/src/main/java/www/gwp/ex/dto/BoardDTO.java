package www.gwp.ex.dto;

public class BoardDTO {
	private int b_num;
	private String title;
	private String imgSrc;
	private String sIntro;
	private int price;
	private String tag;
	private String lIntro;
	private int cnt;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public String getsIntro() {
		return sIntro;
	}
	public void setsIntro(String sIntro) {
		this.sIntro = sIntro;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getlIntro() {
		return lIntro;
	}
	public void setlIntro(String lIntro) {
		this.lIntro = lIntro;
	}
	
	
}
