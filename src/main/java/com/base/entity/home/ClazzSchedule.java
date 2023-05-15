package com.base.entity.home;

import com.base.entity.common.Courses;
import com.base.entity.admin.BaseEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * 后台课程表实体类
 *
 * @author Administrator
 */
@Entity
@Table(name = "ylrc_clazz_schedule")
@EntityListeners(AuditingEntityListener.class)
public class ClazzSchedule extends BaseEntity {

    @ManyToOne
    @JoinColumn(name="courses_id")
    private Courses courses; //课程

    @DateTimeFormat(pattern="yyyy-mm-dd")
    @Column(name = "start_date",nullable = false)
    private Date startDate;//开始日期

    @DateTimeFormat(pattern="yyyy-mm-dd")
    @Column(name ="end_date",nullable = false)
    private Date endDate;//结束日期

    @Column(name="start_time",length = 16,nullable = false)
    private String startTime;//开始时间

    @Column(name = "end_time",length = 16,nullable = false)
    private String endTime;//结束时间

    @Column(name = "slot",length = 16)
    private Integer slot;//时间段

    public Courses getCourses() {
        return courses;
    }

    public void setCourses(Courses courses) {
        this.courses = courses;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Integer getSlot() {
        return slot;
    }

    public void setSlot(Integer slot) {
        this.slot = slot;
    }
}
