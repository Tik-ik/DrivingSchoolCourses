package com.base.dao.admin;

import com.base.entity.admin.Comments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author wangzihan
 * @date : 2020/11/11 14:35
 * 用户评论数据处理层
 */
@Repository
public interface CommentsDao extends JpaRepository<Comments, Long> {

    /**
     * 根据评论id查询
     * @param id
     * @return
     */
    @Query("select c from Comments c where id = :id")
    Comments find(@Param("id")Long id);

    /**
     * 查询父评论下面所有的子评论
     * @param id
     * @return
     */
    @Query("select c from Comments c where c.ancestorId = :id")
    List<Comments> findAncestorIdAll(@Param("id")Long id);


    /**
     * 查询一条新闻下面所有的评论
     * @param id
     * @return
     */
    @Query(value = "SELECT * FROM ylrc_comments  WHERE news_id = :id",nativeQuery = true)
    List<Comments> findNewsCommentsAll(@Param("id")Long id);

    /**
     * 查询当前新闻所有的评论总数
     * @param id
     * @return
     */
    @Query(value = "select count(*) from ylrc_comments where news_id = :id",nativeQuery = true)
    Long newscountTotal(@Param("id") Long id);


    //查询父级评论
    @Query(" select c from Comments c where c.parentCommentId = :parentId order by create_time desc")
    List<Comments> fujipinglun(@Param("parentId") Long parentId);

    //查询一级回复
    @Query(" select c from Comments c where c.parentCommentId = :id order by create_time desc")
    List<Comments> yijihuifu(@Param("id") Long id);

    //查询二级以及所有子集回复
    @Query(" select c from Comments c where c.parentCommentId = :childId order by create_time desc")
    List<Comments> erjihuifu(@Param("childId") Long childId);


}
