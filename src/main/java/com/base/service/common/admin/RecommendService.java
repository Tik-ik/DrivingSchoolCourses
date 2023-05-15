package com.base.service.common.admin;

import com.base.bean.PageBean;
import com.base.dao.admin.RecommendDao;
import com.base.entity.admin.Recommend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecommendService {

    @Autowired
    RecommendDao recommendDao;


    public Recommend find(Long id)
    {
        return recommendDao.find(id);
    }


    public Recommend findByContent(String content)
    {
        return  recommendDao.findByContent(content);
    }

    public Recommend save(Recommend recommend)
    {
        return recommendDao.save(recommend);
    }

    public void delete(Long id)
    {
        recommendDao.deleteById(id);
    }

    public List<Recommend> findAll()
    {
        return recommendDao.findAll();
    }

    public PageBean<Recommend> findList(Recommend recommend, PageBean<Recommend> pageBean)
    {
        ExampleMatcher withMatcher = ExampleMatcher
                .matching()
                .withMatcher("content", ExampleMatcher.GenericPropertyMatchers.contains());

        Sort sort = new Sort(Sort.Direction.DESC,"id");
        Example<Recommend> example = Example.of(recommend, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize(), sort);
        Page<Recommend> findAll = recommendDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }


    public List<Recommend> findTop5ByOrderByIdDesc()
    {
        return recommendDao.findTop5ByOrderByIdDesc();
    }

}
