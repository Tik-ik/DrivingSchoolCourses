package com.base.dao.common;

/**
 * 课程预约表Dao
 */

import com.base.entity.common.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface AppointmentDao extends JpaRepository<Appointment, Long>,JpaSpecificationExecutor<Appointment> {

    @Query("select c from Appointment c where c.id = :id")
    Appointment find(@Param("id") Long id);

    /**
     * 检查预约是否超过maxCount次
     * @param courseId
     * @param maxCount
     * @return
     */
    @Query(value = "select count(courses_id)count,make_date,make_time from ylrc_appointment where courses_id=:courseId group by courses_id,make_date,make_time HAVING count>=:maxCount",nativeQuery = true)
    List<Object> findTotalCount(@Param("courseId")Long courseId, @Param("maxCount")Integer maxCount);

    /**
     * 检查用户是否已经预约过这个课程了
     * @param accountId
     * @param coursesId
     * @return
     */
    Appointment findByCoursesIdAndAccountIdAndMakeDateAndMakeTime( @Param("coursesId")Long coursesId,@Param("accountId")Long accountId, @Param("makeDate")Date makeDate, @Param("makeTime")String makeTime);


}
