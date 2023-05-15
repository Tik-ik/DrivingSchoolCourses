package com.base.dao.admin;

import com.base.entity.admin.LeaveWord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * @author wangzihan
 * @date : 2020/11/11 13:31
 * 前台用户留言数据处理层
 */
@Repository
public interface LeaveWordDao extends JpaRepository<LeaveWord, Long> {

    /**
     * 根据新闻id查询
     * @param id
     * @return
     */
    @Query("select l from LeaveWord l where id = :id")
    public LeaveWord find(@Param("id")Long id);

}
