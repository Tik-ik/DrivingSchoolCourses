package com.base.entity.admin;


import com.base.annotion.ValidateEntity;
import com.base.entity.home.Account;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author wangzihan
 * @date : 2020/11/10 15:53
 * 新闻页面用户评论
 */

@Entity
@Table(name="ylrc_comments")
@EntityListeners(AuditingEntityListener.class)
public class Comments extends BaseEntity{

    @ManyToOne
    @JoinColumn(name="news_id")
    private News news; //评论所属的新闻

    @ManyToOne
    @JoinColumn(name="account_id")
    private Account account; //评论的用户

    @ValidateEntity(required=true,requiredLeng=true,minLength=1,maxLength=50,errorRequiredMsg="评论不能为空!",
            errorMinLengthMsg="评论内容太短",errorMaxLengthMsg="评论内容过长!")
    @Column(name="content",nullable=false)
    private String content;//评论内容

    @Column(name = "parent_comment_id")
    private  Long parentCommentId;  //回复谁的评论 父id

    @Column(name = "ancestor_comment_id")
    private Long ancestorId;  //祖id，可根据祖id删除和查询评论下的所有子评论

    @Transient
    private List<Comments> replyComments = new ArrayList<>();//回复评论

    @Transient
    private Comments parentComment;  //回复哪个评论

    @Transient
    private String parentName;  //回复的人姓名


    public Long getAncestorId() {
        return ancestorId;
    }

    public void setAncestorId(Long ancestorId) {
        this.ancestorId = ancestorId;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public Long getParentCommentId() {
        return parentCommentId;
    }

    public void setParentCommentId(Long parentCommentId) {
        this.parentCommentId = parentCommentId;
    }

    public List<Comments> getReplyComments() {
        return replyComments;
    }

    public void setReplyComments(List<Comments> replyComments) {
        this.replyComments = replyComments;
    }

    public Comments getParentComment() {
        return parentComment;
    }

    public void setParentComment(Comments parentComment) {
        this.parentComment = parentComment;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }


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
