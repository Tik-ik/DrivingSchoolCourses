package com.base.entity.admin;


import com.base.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * @author wangzihan
 * @date : 2020/11/10 15:52
 * 新闻列表实体类
 */

@Entity
@Table(name="ylrc_news")
@EntityListeners(AuditingEntityListener.class)
public class News extends BaseEntity{

    @ManyToOne
    @JoinColumn(name="label_id")
    private Label label;//用户所属角色

    @ValidateEntity(required=true,errorRequiredMsg="新闻封面图片不能为空!")
    @Column(name="pic",nullable=false)
    private String pic;// 新闻封面图片

    @ValidateEntity(required=true,requiredLeng=true,minLength=2,maxLength=30,errorRequiredMsg="新闻标题不能为空!",
            errorMinLengthMsg="新闻标题长度需大于2!",errorMaxLengthMsg="新闻标题长度不能大于30!")
    @Column(name="title",nullable=false,length=30)
    private String title;//新闻标题

    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;  //发布人

    @ValidateEntity(required=true,requiredLeng=true,minLength=2,maxLength = 65532,
            errorRequiredMsg="新闻内容不能为空!",errorMinLengthMsg="新闻内容过短!",errorMaxLengthMsg="新闻内容过长!")
    @Column(name="content",nullable=false)
    private String content;//新闻内容

    @Column(name = "hits",nullable = false)
    private Long hits;    //点击量

    public Long getHits() {
        return hits;
    }

    public void setHits(Long hits) {
        this.hits = hits;
    }

    public Label getLabel() {
        return label;
    }

    public void setLabel(Label label) {
        this.label = label;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
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

    @Override
    public String toString() {
        return "News{" +
                "label=" + label +
                ", pic='" + pic + '\'' +
                ", title='" + title + '\'' +
                ", user=" + user +
                ", content='" + content + '\'' +
                ", hits=" + hits +
                '}';
    }
}
