package com.base.service.common.admin;

import com.base.bean.PageBean;
import com.base.dao.admin.LabelDao;
import com.base.entity.admin.Label;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangzihan
 * @date : 2020/11/10 17:23
 * 标签分类业务处理层
 */
@Service
public class LabelService {

    @Autowired
    private LabelDao labelDao;


    /**
     * 根据分类标签id查询
     * @param id
     * @return
     */
    public Label find(Long id){
        return labelDao.find(id);
    }


    /**
     * 获取所有的标签列表
     * @return
     */
    public List<Label> findAll(){
        return labelDao.findAll();
    }

    /**
     * 按照分类标签名查找分类标签
     * @param name
     * @return
     */
    public Label findByName(String name){
        return labelDao.findByName(name);
    }

    /**
     * 分类标签添加/编辑操作
     * @param label
     * @return
     */
    public Label save(Label label){
        return labelDao.save(label);
    }

    /**
     * 分页查询分类标签列表
     * @param label
     * @param pageBean
     * @return
     */
    public PageBean<Label> findList(Label label, PageBean<Label> pageBean){
        ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("name", ExampleMatcher.GenericPropertyMatchers.contains());
        Example<Label> example = Example.of(label, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
        Page<Label> findAll = labelDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    /**
     * 判断分类标签名是否存在，添加和编辑均可判断
     * @param name
     * @param id
     * @return
     */
    public boolean isExistLabelName(String name,Long id){
        Label label = labelDao.findByName(name);
        if(label != null){
            //表示分类标签名存在，接下来判断是否是编辑分类标签的本身
            if(label.getId().longValue() != id.longValue()){
                return true;
            }
        }
        return false;
    }

    /**
     * 按照分类标签id删除
     * @param id
     */
    public void delete(Long id){
        labelDao.deleteById(id);
    }

    /**
     * 返回分类标签总数
     * @return
     */
    public long total(){
        return labelDao.count();
    }


}
