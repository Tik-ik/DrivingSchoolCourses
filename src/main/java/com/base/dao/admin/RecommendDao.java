package com.base.dao.admin;

import com.base.entity.admin.Recommend;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecommendDao extends JpaRepository<Recommend, Long> {

    @Query("select r from Recommend r where r.id = :id")
    Recommend find(@Param("id")Long id);


    Recommend findByContent(String content);

    List<Recommend> findTop5ByOrderByIdDesc();
}
