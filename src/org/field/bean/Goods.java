package org.field.bean;

public class Goods {
	private int id;
	private String goodName;
	private double price;
	private String imgUrl;
	private int num;
	private String desc;
	private int type;
	private double oldPrice;
	
	
	public Goods(int i, String string, double d, String string2, String string3){
		
	}

	public Goods(int id, String goodName,int num ,double d ,double oldPrice,String desc,String imgUrl, int type) {
		this.id = id;
		
		this.goodName = goodName;
		
		this.price = d;
		
		this.imgUrl = imgUrl;
		
		this.desc = desc;
		
		this.type = type;
		
		this.num = num;
		
		this.setOldPrice(oldPrice);
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public double getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(double oldPrice) {
		this.oldPrice = oldPrice;
	}
}