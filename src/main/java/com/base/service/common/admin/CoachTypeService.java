package com.base.service.common.admin;

import com.base.bean.PageBean;
import com.base.dao.admin.CoachTypeDao;
import com.base.entity.admin.CoachType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoachTypeService {

    @Autowired
    CoachTypeDao coachTypeDao;



    public void delete(Long id)
    {
        coachTypeDao.deleteById(id);
    }

    public CoachType save(CoachType coachType)
    {
        return coachTypeDao.save(coachType);
    }

    public CoachType find(Long id)
    {
        return coachTypeDao.find(id);
    }

    public CoachType findByName(String name)
    {
        return coachTypeDao.findByName(name);
    }

    public List<CoachType> findAll()
    {
        return coachTypeDao.findAll();
    }

    public PageBean<CoachType> findList(CoachType coachType, PageBean<CoachType> pageBean)
    {
        ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("name", ExampleMatcher.GenericPropertyMatchers.contains());

        Example<CoachType> example = Example.of(coachType, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
        Page<CoachType> findAll = coachTypeDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }
}
