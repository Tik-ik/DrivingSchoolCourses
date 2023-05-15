package com.base.dao.admin;

import com.base.entity.admin.News;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author wangzihan
 * @date : 2020/11/10 17:52
 * 新闻数据处理层
 */
@Repository
public interface NewsDao extends JpaRepository<News, Long> {

    /**
     * 根据新闻id查询
     * @param id
     * @return
     */
    @Query("select n from News n where id = :id")
    News find(@Param("id")Long id);


    /**
     * 查询出点击量最高的三个
     * @return
     */
    List<News> findTop3ByOrderByHitsDesc();


    /**
     * 查询出点击量最高的五个
     * @return
     */
    List<News> findTop5ByOrderByHitsDesc();

    /**
     * 查询出最新发布的八个
     * @return
     */
    List<News> findTop6ByOrderByCreateTimeDesc();




}
