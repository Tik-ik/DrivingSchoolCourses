package com.base.dao.admin;

import com.base.entity.admin.Coach;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CoachDao extends JpaRepository<Coach, Long> {

    @Query("select c from Coach c where c.id = :id")
    Coach find(@Param("id")Long id);

    Coach findByName(String name);
}
