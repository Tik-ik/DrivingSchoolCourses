package com.base.dao.common;

import com.base.entity.common.Achievement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AchievementDao extends JpaRepository<Achievement, Long> {

    @Query("select a from Achievement a where a.id = :id")
    Achievement find(@Param("id")Long id);


    Achievement findTop1ByOrderByIdDesc();
}
