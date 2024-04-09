package com.entity;

import javax.persistence.*;

@Entity
public class Income {
    @Id()
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int incomeId;
    private long  amount;
    private String soursce;
    private String Income_date;
    @ManyToOne
    private User user;

    public int getIncomeId() {
        return incomeId;
    }

    public void setIncomeId(int incomeId) {
        this.incomeId = incomeId;
    }

    public long getAmount() {
        return amount;
    }

    public void setAmount(long amount) {
        this.amount = amount;
    }

    public String getSoursce() {
        return soursce;
    }

    public void setSoursce(String soursce) {
        this.soursce = soursce;
    }

    public String getIncome_date() {
        return Income_date;
    }

    public void setIncome_date(String income_date) {
        Income_date = income_date;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Income() {
        super();

    }
}
