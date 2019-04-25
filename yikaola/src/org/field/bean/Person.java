package org.field.bean;

//封装数据
public class Person {
	private int  id ;
	private String name;
	private boolean isChina;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isChina() {
		return isChina;
	}
	public void setChina(boolean isChina) {
		this.isChina = isChina;
	}
}
