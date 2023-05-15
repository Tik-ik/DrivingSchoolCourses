package com.base.dao.common;

/**
 * 课程Dao
 */

import com.base.entity.common.Courses;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CoursesDao extends JpaRepository<Courses, Long> {

    @Query("select c from Courses c where c.id = :id")
    Courses find(@Param("id") Long id);

    /**
     * 根据教练查找课程
     * @param coachId
     * @return
     */
    List<Courses> findByCoachId(@Param("coachId") Long coachId);

    /**
     * 查询出点击量最高的4个
     * @return
     */
    List<Courses> findTop4ByStatusOrderByHitsDesc(Integer status);
}
