package com.base.entity.common;

import com.base.entity.admin.BaseEntity;
import com.base.annotion.ValidateEntity;
import com.base.entity.admin.Label;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name="ylrc_picture")
@EntityListeners(AuditingEntityListener.class)
public class Picture extends BaseEntity {

    @Column(name = "head_pic")
    @ValidateEntity(required = false)
    public String headPic;


    @JoinColumn(name ="label_id")
    @ManyToOne
    public Label label;


    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public Label getLabel() {
        return label;
    }

    public void setLabel(Label label) {
        this.label = label;
    }
}
