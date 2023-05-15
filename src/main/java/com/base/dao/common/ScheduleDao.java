package com.base.dao.common;

/**
 * 课程表Dao
 */

import com.base.entity.home.ClazzSchedule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ScheduleDao extends JpaRepository<ClazzSchedule, Long> {

    @Query("select c from ClazzSchedule c where c.id = :id")
    ClazzSchedule find(@Param("id") Long id);

    /**
     * 根据课程id查找课程表
     *
     * @param id
     * @return
     */
    ClazzSchedule findByCoursesId(@Param("id") Long id);

    @Query("select sc from ClazzSchedule sc where sc.courses.id=:courseId and ((start_date<=:startDate and end_date >=:startDate) or (start_date<=:endDate and end_date>=:endDate))")
    ClazzSchedule getScheduleCount(@Param("courseId") Long courseId, @Param("startDate") String startDate, @Param("endDate") String endDate);

    @Modifying
    @Query(value = "delete from ylrc_clazz_schedule where end_date<NOW()",nativeQuery = true)
    void deleteClazzSchedule();
}
