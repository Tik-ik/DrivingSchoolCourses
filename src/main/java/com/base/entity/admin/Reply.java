package com.base.entity.admin;


import com.base.entity.home.Account;
import com.base.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Table;

/**
 * @author wangzihan
 * @date : 2020/11/10 15:53
 * 新闻页面用户评论回复
 */


@Entity
@Table(name="ylrc_reply")
@EntityListeners(AuditingEntityListener.class)
public class Reply extends BaseEntity{

    @ValidateEntity(required=true,requiredLeng=true,errorRequiredMsg="回复用户不能为空!")
    @Column(name="account_id",nullable=false)
    private Account account; //回复的用户

    @ValidateEntity(required=true,requiredLeng=true,minLength=1,maxLength=50,errorRequiredMsg="回复评论不能为空!",
            errorMinLengthMsg="回复评论内容太短",errorMaxLengthMsg="回复评论内容过长!")
    @Column(name="content",nullable=false)
    private String content;//回复评论内容

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
