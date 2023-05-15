package com.base.dao.admin;

import com.base.entity.admin.CoachType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * 教练类型
 */
@Repository
public interface CoachTypeDao extends JpaRepository<CoachType, Long> {

    @Query("select ct from CoachType ct where ct.id = :id")
    CoachType find(@Param("id")Long id);


    CoachType findByName(String name);
}
