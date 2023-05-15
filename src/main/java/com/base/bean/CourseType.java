package com.base.bean;

public enum CourseType {
    DRIVER(1,"驾驶"),GUIDEPOST(2,"路标"),LANECHANGE(3,"变道"),PARKING(4,"路边停车");
    private int code;

    private String name;

    CourseType(int code,String name){
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
