package com.base.entity.admin;

import com.base.annotion.ValidateEntity;
import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Table;
@Data

@Entity
@Table(name = "ylrc_about_info")
@EntityListeners(AuditingEntityListener.class)
public class AboutInfo extends BaseEntity{

    @Column(name = "caption")
    @ValidateEntity(required = false)
    public String caption;

    @Column(name = "content")
    @ValidateEntity(required = false)
    public String content;

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
