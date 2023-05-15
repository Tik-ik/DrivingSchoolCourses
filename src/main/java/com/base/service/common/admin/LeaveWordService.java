package com.base.service.common.admin;

import com.base.bean.PageBean;
import com.base.dao.admin.LeaveWordDao;
import com.base.entity.admin.LeaveWord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

/**
 * @author wangzihan
 * @date : 2020/11/11 13:33
 * 前台用户留言业务处理层
 */
@Service
public class LeaveWordService {
    
    @Autowired
    private LeaveWordDao leaveWordDao;

    /**
     * 根据用户留言id查询
     * @param id
     * @return
     */
    public LeaveWord find(Long id){
        return leaveWordDao.find(id);
    }

    /**
     * 用户留言添加/编辑操作
     * @param leaveWord
     * @return
     */
    public LeaveWord save(LeaveWord leaveWord){
        return leaveWordDao.save(leaveWord);
    }
    /**
     * 分页查询用户留言列表
     * @param leaveWord
     * @param pageBean
     * @return
     */
    public PageBean<LeaveWord> findList(LeaveWord leaveWord, PageBean<LeaveWord> pageBean) {
        ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("content", ExampleMatcher.GenericPropertyMatchers.contains());
        Example<LeaveWord> example = Example.of(leaveWord, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize());
        Page<LeaveWord> findAll = leaveWordDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    /**
     * 按照新闻id删除
     * @param id
     */
    public void delete(Long id) {
        leaveWordDao.deleteById(id);
    }

    /**
     * 返回用户留言总数
     * @return
     */
    public long total() {
        return leaveWordDao.count();
    }



}

