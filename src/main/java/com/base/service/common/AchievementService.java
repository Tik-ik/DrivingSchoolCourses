package com.base.service.common;

import com.base.bean.PageBean;
import com.base.dao.common.AchievementDao;
import com.base.entity.common.Achievement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AchievementService {

    @Autowired
    AchievementDao achievementDao;

    public Achievement find(Long id)
    {
        return achievementDao.find(id);
    }

    public Achievement findTop1ByOrderByIdDesc()
    {
        return achievementDao.findTop1ByOrderByIdDesc();
    }

    public Achievement save(Achievement achievement)
    {
        return achievementDao.save(achievement);
    }

    public void delete(Long id)
    {
        achievementDao.deleteById(id);
    }

    public List<Achievement> findAll()
    {
        return achievementDao.findAll();
    }

    public PageBean<Achievement> findList(Achievement achievement, PageBean<Achievement> pageBean)
    {
        ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("remark", ExampleMatcher.GenericPropertyMatchers.contains()).withIgnorePaths("awards","experience");

        Sort sort = new Sort(Sort.Direction.DESC,"id");
        Example<Achievement> example = Example.of(achievement, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize(), sort);
        Page<Achievement> findAll = achievementDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }
}
