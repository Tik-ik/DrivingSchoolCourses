package com.base.entity.admin;

import com.base.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * @author zhong
 * @date 2020-11-10
 * 教练表
 */
@Entity
@Table(name = "ylrc_coach")
@EntityListeners(AuditingEntityListener.class)
public class Coach extends BaseEntity{

    @Column(name = "name")
    @ValidateEntity(required=false)
    public String name;  //教练名

    @Column(name = "introduce")
    @ValidateEntity(required=false)
    public String introduce; //教练简介

    @Column(name = "signature")
    @ValidateEntity(required=false)
    public String signature; //教练个性签名

    @ValidateEntity(required=false)
    @Column(name="head_pic",length=128)
    public String headPic; //教练图片

    @Column(name = "phone")
    @ValidateEntity(required = false)
    public String phone;   //手机号

    @Column(name = "email")
    @ValidateEntity(required = false)
    public String email;  //邮箱

    @JoinColumn(name = "coach_type_id")
    @ManyToOne
    public CoachType coachType; //类型


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public CoachType getCoachType() {
        return coachType;
    }

    public void setCoachType(CoachType coachType) {
        this.coachType = coachType;
    }
}
