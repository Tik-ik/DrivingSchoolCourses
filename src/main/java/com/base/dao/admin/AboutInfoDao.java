package com.base.dao.admin;

import com.base.entity.admin.AboutInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AboutInfoDao extends JpaRepository<AboutInfo, Long> {

    @Query("select ai from AboutInfo ai where ai.id = :id")
    AboutInfo find(@Param("id")Long id);

    AboutInfo findByCaption(String caption);

    AboutInfo findTop1ByOrderByIdDesc();
}
