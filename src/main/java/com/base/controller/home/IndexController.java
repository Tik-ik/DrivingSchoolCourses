package com.base.controller.home;

import com.base.entity.admin.News;
import com.base.service.common.admin.NewsService;
import com.base.service.common.admin.RecommendService;
import com.base.service.common.CoursesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 前台首页控制器
 *
 * @author Administrator
 */
@RequestMapping("/home/index")
@Controller
public class IndexController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private CoursesService coursesService;

    @Autowired
    private RecommendService recommendService;


    /**
     * 首页列表页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/index")
    public String list(Model model) {

        model.addAttribute("hitsTop3",newsService.findTop3ByOrderByHitsDesc());
        List<News> top6ByOrderByCreateTimeDesc = newsService.findTop6ByOrderByCreateTimeDesc();
        for (News news : top6ByOrderByCreateTimeDesc) {
            String trim = news.getContent().trim();
            news.setContent(trim);
        }
        model.addAttribute("createTimeTop6",top6ByOrderByCreateTimeDesc);
        model.addAttribute("hitsTop4",coursesService.findTop4ByOrderByHitsDesc(1));
        model.addAttribute("recommends", recommendService.findTop5ByOrderByIdDesc());

        return "home/index/index";
    }




}
