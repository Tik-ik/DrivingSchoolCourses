package com.base.service.common.admin;

import com.base.bean.PageBean;
import com.base.dao.admin.CoachDao;
import com.base.entity.admin.Coach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoachService {

    @Autowired
    CoachDao coachDao;

    public void delete(Long id) {
        coachDao.deleteById(id);
    }

    public Coach save(Coach coach) {
        return coachDao.save(coach);
    }

    public Coach find(Long id) {
        return coachDao.find(id);
    }

    public Coach findByName(String name) {return coachDao.findByName(name);}

    public List<Coach> findAll() {
        return coachDao.findAll();
    }

    public PageBean<Coach> findList(Coach coach, PageBean<Coach> pageBean) {
        ExampleMatcher withMatcher = ExampleMatcher.matching()
                .withMatcher("name", ExampleMatcher.GenericPropertyMatchers.contains());

        Example<Coach> example = Example.of(coach, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize());
        Page<Coach> findAll = coachDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }
}
