package com.base.service.common.admin;

import com.base.bean.PageBean;
import com.base.dao.admin.AboutInfoDao;
import com.base.entity.admin.AboutInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AboutInfoService {

    @Autowired
    AboutInfoDao aboutInfoDao;

    public AboutInfo find(Long id)
    {
        return aboutInfoDao.find(id);
    }

    public AboutInfo findByTitle(String title)
    {
        return aboutInfoDao.findByCaption(title);
    }

    public AboutInfo save(AboutInfo aboutInfo)
    {
        return aboutInfoDao.save(aboutInfo);
    }

    public void delete(Long id)
    {
        aboutInfoDao.deleteById(id);
    }

    public List<AboutInfo> findAll()
    {
        return aboutInfoDao.findAll();
    }

    public PageBean<AboutInfo> findList(AboutInfo aboutInfo, PageBean<AboutInfo> pageBean)
    {
        ExampleMatcher withMatcher = ExampleMatcher
                .matching()
                .withMatcher("caption", ExampleMatcher.GenericPropertyMatchers.contains());

        Sort sort = new Sort(Sort.Direction.DESC,"id");
        Example<AboutInfo> example = Example.of(aboutInfo, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize(), sort);
        Page<AboutInfo> findAll = aboutInfoDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    public AboutInfo findTop1ByOrderByIdDesc()
    {
        return aboutInfoDao.findTop1ByOrderByIdDesc();
    }
}
