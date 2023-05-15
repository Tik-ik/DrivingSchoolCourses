package com.base.dao.admin;

import com.base.entity.admin.Label;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * @author wangzihan
 * @date : 2020/11/10 17:20
 * 标签分类数据处理层
 */
@Repository
public interface LabelDao extends JpaRepository<Label, Long> {

    /**
     * 按照分类标签名查找分类标签信息
     * @param name
     * @return
     */
    public Label findByName(String name);

    /**
     * 根据分类标签id查询
     * @param id
     * @return
     */
    @Query("select l from Label l where id = :id")
    public Label find(@Param("id")Long id);

}
