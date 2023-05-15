package com.base.entity.admin;

import com.base.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name = "ylrc_recommend")
@EntityListeners(AuditingEntityListener.class)
public class Recommend extends BaseEntity {

    @Column(name = "content")
    @ValidateEntity(required = false)
    public String content;

    @ManyToOne
    @JoinColumn(name = "user_id")
    public User user;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
