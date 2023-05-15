package com.base.entity.admin;


import com.base.entity.home.Account;
import com.base.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * @author wangzihan
 * @date : 2020/11/10 15:53
 * 前台用户留言实体类
 */

@Entity
@Table(name="ylrc_leave_word")
@EntityListeners(AuditingEntityListener.class)
public class LeaveWord extends BaseEntity{



    @ManyToOne
    @JoinColumn(name="account_id")
    private Account account; //留言的用户

    @ValidateEntity(required=true,requiredLeng=true,minLength=5,maxLength=255,errorRequiredMsg="留言不能为空!",
            errorMinLengthMsg="留言内容太短",errorMaxLengthMsg="留言内容过长!")
    @Column(name="content",nullable=false)
    private String content;  //前台用户联系我们具体内容

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
