package com.example.java_web_04.model;

public class Revenue {
    private String month;
    private double revenue;

    public Revenue(String month, double revenue) {
        this.month = month;
        this.revenue = revenue;
    }

    public Revenue() {
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }
}


