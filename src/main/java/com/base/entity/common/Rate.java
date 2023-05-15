package com.base.entity.common;

import com.base.entity.admin.BaseEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name="ylrc_rate")
@EntityListeners(AuditingEntityListener.class)
public class Rate extends BaseEntity {

    @JoinColumn(name ="course_id")
    @ManyToOne
    public Courses courses;

    @Column(name = "value")
    public BigDecimal value = new BigDecimal(0);

    public Courses getCourses() {
        return courses;
    }

    public void setCourses(Courses courses) {
        this.courses = courses;
    }

    public BigDecimal getValue() {
        return value;
    }

    public void setValue(BigDecimal value) {
        this.value = value;
    }
}
