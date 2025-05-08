package com.example.java_web_04.model;

public class Student {
    private int id;
    private String name;
    private int age;
    private double avgScore;

    public Student(int id, String name, int age, double avgScore) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.avgScore = avgScore;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public double getAvgScore() {
        return avgScore;
    }
}