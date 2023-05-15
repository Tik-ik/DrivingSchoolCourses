package com.base.service.common;

/**
 * 课程业务逻辑层
 */

import com.base.dao.common.CoursesDao;
import com.base.entity.common.Courses;
import com.base.bean.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Service
public class CoursesService {

    @Autowired
    CoursesDao coursesDao;

    public void delete(Long id) {
        coursesDao.deleteById(id);
    }

    public Courses save(Courses courses) {
        return coursesDao.save(courses);
    }

    public Courses find(Long id) {
        return coursesDao.find(id);
    }

    public Courses findGetRate(Long id, Map<Long, Map> rates)
    {
        Courses item = coursesDao.find(id);
        BigDecimal value = new BigDecimal(5);
        Map rate = rates.get(item.getId());
        if(rate != null)
        {
            Object count =  rate.get("count");
            value = new BigDecimal((double)count);
        }
        item.setRate(value);

        return item;
    }


    public List<Courses> findTop4ByOrderByHitsDesc(Integer status)
    {
        return coursesDao.findTop4ByStatusOrderByHitsDesc(status);
    }

    public List<Courses> findAll() {
        return coursesDao.findAll();
    }

    public PageBean<Courses> findList(Courses courses, PageBean<Courses> pageBean) {
        ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("title", ExampleMatcher.GenericPropertyMatchers.contains());
        withMatcher = withMatcher.withIgnorePaths("status", "rate", "price");
        Example<Courses> example = Example.of(courses, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize());
        Page<Courses> findAll = coursesDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }


    /**
     * 根据教练查找课程
     *
     * @param coachId
     * @return
     */
    public List<Courses> findByCoachId(Long coachId) {
        return coursesDao.findByCoachId(coachId);
    }


    public PageBean<Courses> findListGetRate(Courses courses, PageBean<Courses> pageBean, Map<Long, Map> rates) {
        pageBean = HomefindList(courses, pageBean);
        List<Courses> coursesList = pageBean.getContent();
        for (Courses item : coursesList) {
            BigDecimal value = new BigDecimal(5);
            Map rate = rates.get(item.getId());
            if(rate != null)
            {
                Object count =  rate.get("count");
                value = new BigDecimal((double)count);
            }
            item.setRate(value);
        }

        return  pageBean;
    }


    public PageBean<Courses> HomefindList(Courses courses, PageBean<Courses> pageBean) {
        if(courses == null)
            courses = new Courses();
        courses.setStatus(1);

        ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("title", ExampleMatcher.GenericPropertyMatchers.contains());
        withMatcher = withMatcher.withIgnorePaths("rate", "price");
        Example<Courses> example = Example.of(courses, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize());
        Page<Courses> findAll = coursesDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

}
