package org.konghao.service;

public class User {
	private int id;
	private String name;
	private Group group;
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
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	
	public User() {
	}
	public User(int id, String name, Group group) {
		super();
		this.id = id;
		this.name = name;
		this.group = group;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", group=" + group + "]";
	}
	
	
}
