package com.base.bean;

public enum CourseSkills {
    SKILLS_ONE(1,"拉出并返回路边"),SKILLS_TOW(2,"在路上行驶"),SKILLS_THREE(3,"了解你的盲点"),SKILLS_FOUR(4,"扫描危害"),SKILLS_FIVE(5,"堵车（手动）"),SKILLS_SIX(6,"铁路道口"),SKILLS_SEVENT(7,"穿越平交道口"),SKILLS_EIGHT(8,"侧方停车"),SKILLS_NINE(9,"上坡停车"),SKILLS_TEN(10,"S弯");
    private int code;

    private String name;

     CourseSkills(int code, String name){
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
