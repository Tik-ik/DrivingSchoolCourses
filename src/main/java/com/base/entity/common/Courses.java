package com.base.entity.common;

import com.base.annotion.ValidateEntity;
import com.base.bean.CourseSkills;
import com.base.bean.CourseType;
import com.base.entity.admin.BaseEntity;
import com.base.entity.admin.Coach;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * 后台课程实体类
 *
 * @author Administrator
 */
@Entity
@Table(name = "ylrc_courses")
@EntityListeners(AuditingEntityListener.class)
public class Courses extends BaseEntity {

    @ValidateEntity(required = true, errorRequiredMsg = "标题不能为空", minLength = 10, errorMinLengthMsg = "标题最少为10个文字")
    @Column(name = "title", nullable = false, length = 32)
    private String title;//课程标题

    @ValidateEntity(required = true,errorRequiredMsg = "课程内容不能为空",minLength = 25,errorMinLengthMsg = "课程内容不能小于25个字",maxLength = 2000,errorMaxValueMsg = "课程内容超过限制了")
    @Column(name = "content", length = 512)
    private String content;//课程内容

    @ValidateEntity(required = true, errorRequiredMsg = "地址不能为空")
    @Column(name = "address", nullable = false, length = 64)
    private String address;//练车地址

    @Column(name = "cover_photo", length = 64)
    private String coverPhoto;//封面图片

    @Column(name = "type", length = 128)
    private String type;//标签

    @Column(name = "skills", length = 128)
    private String skills;//课程技能

    @Column(name = "rate", length = 12)
    private BigDecimal rate = new BigDecimal(0);//评分

    @Column(name = "price", length = 12)
    private BigDecimal price;//价格


    @Column(name = "video", length = 64)
    private String video;//视频

    @Column(name = "hits",length = 20)
    private Long hits;   //点击量

    @ManyToOne
    @JoinColumn(name = "coach_id")
    private Coach coach;//教练

    @Column(name = "status", length = 2)
    private Integer status;//状态

    @Transient
    private List<CourseType> typeList;//用于直接显示在页面的课程类型.不需要保存到数据库

    @Transient
    private List<CourseSkills> skillsList;//课程技能list


    public Long getHits() {
        return hits;
    }

    public void setHits(Long hits) {
        this.hits = hits;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCoverPhoto() {
        return coverPhoto;
    }

    public void setCoverPhoto(String coverPhoto) {
        this.coverPhoto = coverPhoto;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public Coach getCoach() {
        return coach;
    }

    public void setCoach(Coach coach) {
        this.coach = coach;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public List<CourseType> getTypeList() {
        if (this.type != null) {
            typeList = new ArrayList<CourseType>();
            String[] split = this.type.split(",");
            for (String t : split) {
                CourseType courseType = CourseType.valueOf(t);
                if (courseType != null) {
                    typeList.add(courseType);
                }
            }
        }
        return typeList;
    }

    public void setTypeList(List<CourseType> typeList) {
        this.typeList = typeList;
    }
    public List<CourseSkills> getSkillsList() {
        if (this.skills != null) {
            skillsList = new ArrayList<>();
            String[] split = this.skills.split(",");
            for (String s : split) {
                CourseSkills courseSkills = CourseSkills.valueOf(s);
                if (courseSkills != null) {
                    skillsList.add(courseSkills);
                }
            }
        }
        return skillsList;
    }
    public void setSkillsList(List<CourseSkills> skillsList) {
        this.skillsList = skillsList;
    }
}
