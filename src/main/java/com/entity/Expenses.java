package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Expenses {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private int id;
	 private String ExpenseName;
	 private int amount;
	 private String date;
	 private String time;
	 private String category;
	 
	 @ManyToOne
	 private User user;
	 
	public String getExpenseName() {
		return ExpenseName;
	}
	public void setExpenseName(String expenseName) {
		ExpenseName = expenseName;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
