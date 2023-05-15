package com.base.bean;

public enum CourseStatus {
    GROUNDING(1,"上架"),OFFTHESHELF(2,"下架");
    private int code;

    private String name;

    CourseStatus(int code, String name){
        this.code=code;
        this.name=name;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
