package org.field.bean;

public class Goods {
	int id;
	String goodName;
	double price;
	String imgUrl;
	String desc;
	public Goods(){
		
	}

	public Goods(int id, String goodName, double d, String imgUrl, String desc) {
		this.id = id;
		this.goodName = goodName;
		this.price = d;
		this.imgUrl = imgUrl;
		this.desc = desc;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
}