package com.base.entity.common;

import com.base.entity.home.Account;
import com.base.entity.admin.BaseEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * 预约实体
 */

@Entity
@Table(name = "ylrc_appointment")
@EntityListeners(AuditingEntityListener.class)
public class Appointment extends BaseEntity {
    public static int RATE = 1;
    public static int NO_RATE = 0;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "make_date", nullable = false)
    private Date makeDate;//预约日期

    @Column(name = "make_time", nullable = false, length = 26)
    private String makeTime;//预约时间

    @ManyToOne
    @JoinColumn(name = "courses_id")
    private Courses courses;//预约课程

    @ManyToOne
    @JoinColumn(name = "account_id")
    private Account account;//预约用户

    @Column(name = "status",length = 2)
    private int status;

    @Column(name = "overdue")
    private String overdue;//过期时间

    @Column(name="is_rate")
    private int isRate = NO_RATE; //1为评论过 0未评论

    public Date getMakeDate() {
        return makeDate;
    }

    public int getIsRate() {
        return isRate;
    }

    public void setIsRate(int isRate) {
        this.isRate = isRate;
    }

    public void setMakeDate(Date makeDate) {
        this.makeDate = makeDate;
    }

    public String getMakeTime() {
        return makeTime;
    }

    public void setMakeTime(String makeTime) {
        this.makeTime = makeTime;
    }

    public Courses getCourses() {
        return courses;
    }

    public void setCourses(Courses courses) {
        this.courses = courses;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getOverdue() {
        return overdue;
    }

    public void setOverdue(String overdue) {
        this.overdue = overdue;
    }
}
