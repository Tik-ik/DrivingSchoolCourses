package com.base.entity.admin;


import com.base.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Table;

/**
 * @author wangzihan
 * @date : 2020/11/10 15:53
 * 标签分类实体类
 */

@Entity
@Table(name="ylrc_laber")
@EntityListeners(AuditingEntityListener.class)
public class Label extends BaseEntity{

    @ValidateEntity(required=true,errorRequiredMsg="标签分类不能为空!")
    @Column(name="name",nullable = false)
    private String name;  //分类标签名

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
