package com.base.dao.common;

import com.base.entity.common.Rate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RateDao extends JpaRepository<Rate, Long> {

    @Query(value = "SELECT r.course_id, avg (r.value) as 'count' FROM `ylrc_rate` r GROUP BY r.course_id",
            nativeQuery = true)
    List<Object> groupByCourse();

    @Query(value="SELECT count(0) FROM `ylrc_rate` WHERE `value` >= 4", nativeQuery = true)
    Integer getCount();

    @Query(value = "SELECT count(0) FROM `ylrc_rate`", nativeQuery = true)
    Integer getCountAll();
}
