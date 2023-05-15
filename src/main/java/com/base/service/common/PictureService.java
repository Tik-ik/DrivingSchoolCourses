package com.base.service.common;

import com.base.bean.PageBean;
import com.base.dao.common.PictureDao;
import com.base.entity.common.Picture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PictureService {

    @Autowired
    PictureDao pictureDao;


    public Picture find(Long id)
    {
        return pictureDao.find(id);
    }

    public Picture save(Picture picture)
    {
        return  pictureDao.save(picture);
    }

    public void delete(Long id)
    {
        pictureDao.deleteById(id);
    }

    public List<Picture> findAll()
    {
        return pictureDao.findAll();
    }

    public PageBean<Picture> findList(Picture picture, PageBean<Picture> pageBean) {
        ExampleMatcher withMatcher = ExampleMatcher.matching()
                .withMatcher("label.name", ExampleMatcher.GenericPropertyMatchers.contains());

        Example<Picture> example = Example.of(picture, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize());
        Page<Picture> findAll = pictureDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

}
