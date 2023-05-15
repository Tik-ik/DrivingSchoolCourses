package com.base.dao.common;

import com.base.entity.common.Picture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PictureDao extends JpaRepository<Picture, Long> {

    @Query("select p from Picture  p where p.id = :id")
    Picture find(@Param("id")Long id);
}
