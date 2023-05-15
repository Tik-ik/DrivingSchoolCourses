package com.base.entity.common;

import com.base.entity.admin.BaseEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Table;

@Entity
@Table(name = "ylrc_achievement")
@EntityListeners(AuditingEntityListener.class)
public class Achievement extends BaseEntity {

    @Column(name = "experience")
    public Integer experience; //经验

    @Column(name="awards")
    public Integer awards; //奖项

    @Column(name="remark")
    public String remark;  //备注

    public Integer getExperience() {
        return experience;
    }

    public void setExperience(Integer experience) {
        this.experience = experience;
    }

    public Integer getAwards() {
        return awards;
    }

    public void setAwards(Integer awards) {
        this.awards = awards;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
