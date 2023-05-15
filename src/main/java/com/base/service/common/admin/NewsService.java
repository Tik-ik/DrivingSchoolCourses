package com.base.service.common.admin;

import com.base.dao.admin.NewsDao;
import com.base.entity.admin.News;
import com.base.bean.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangzihan
 * @date : 2020/11/10 17:55
 * 新闻业务处理层
 */
@Service
public class NewsService {

    @Autowired
    private NewsDao newsDao;

    /**
     * 根据新闻id查询
     * @param id
     * @return
     */
    public News find(Long id){
        return newsDao.find(id);
    }

    /**
     * 新闻添加/编辑操作
     * @param news
     * @return
     */
    public News save(News news){
        return newsDao.save(news);
    }

    /**
     * 分页查询新闻列表
     * @param news
     * @param pageBean
     * @return
     */
    public PageBean<News> findList(News news, PageBean<News> pageBean){
        ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("title", ExampleMatcher.GenericPropertyMatchers.contains());
        Example<News> example = Example.of(news, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
        Page<News> findAll = newsDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    /**
     * 按照新闻id删除
     * @param id
     */
    public void delete(Long id){
        newsDao.deleteById(id);
    }



    /**
     * 返回新闻总数
     * @return
     */
    public long total(){
        return newsDao.count();
    }

    /**
     * 查询出点击量最高的三个新闻
     * @return
     */
    public List<News> findTop3ByOrderByHitsDesc(){
        return newsDao.findTop3ByOrderByHitsDesc();
    }

    /**
     * 查询出点击量最高的五个新闻
     * @return
     */
    public List<News> findTop5ByOrderByHitsDesc(){
        return newsDao.findTop5ByOrderByHitsDesc();
    }

    /**
     * 查询出点击量最高的八个新闻
     * @return
     */
    public List<News> findTop6ByOrderByCreateTimeDesc(){
        return newsDao.findTop6ByOrderByCreateTimeDesc();
    }


}
