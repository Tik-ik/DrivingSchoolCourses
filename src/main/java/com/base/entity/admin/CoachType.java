package com.base.entity.admin;

import com.base.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Table;

/**
 * 教练职称
 */
@Entity
@Table(name = "ylrc_coach_type")
@EntityListeners(AuditingEntityListener.class)
public class CoachType extends BaseEntity{

    @Column(name = "name",nullable = false)
    @ValidateEntity(required = true, errorRequiredMsg = "不能为空")
    public String name; //教练类型


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
