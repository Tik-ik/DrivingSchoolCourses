package com.base.controller.home;

import com.base.bean.CodeMsg;
import com.base.entity.admin.Comments;
import com.base.entity.admin.News;
import com.base.entity.home.Account;
import com.base.service.common.admin.CommentsService;
import com.base.service.common.admin.NewsService;
import com.base.bean.PageBean;
import com.base.bean.Result;

import com.base.entity.admin.Label;

import com.base.service.common.admin.LabelService;
import com.base.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


/**
 * @author
 * 前台新闻页面控制层
 */
@RequestMapping("/home/news")
@Controller
public class HomeNewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private CommentsService commentsService;

    @Autowired
    private LabelService labelService;





    /**
     * 新闻列表页面
     * @param model
     * @param news
     * @param pageBean
     * @return
     */
    @RequestMapping(value="/list")
    public String list(Model model, News news, PageBean<News> pageBean){
        model.addAttribute("titles", "新闻列表");
        model.addAttribute("labels",labelService.findAll());
        pageBean.setPageSize(6);
        PageBean<News> list = newsService.findList(news, pageBean);
        List<News> content = list.getContent();
        for (News news1 : content) {
            String trim = news1.getContent().trim();
            news1.setContent(trim);
        }
        Label label = news.getLabel();
        model.addAttribute("label",label == null ?  "-1" : label.getId());
        model.addAttribute("pageBean",list);
        return "home/news/list";
    }

    /**
     * 新闻详情页面
     * @param model
     * @return
     */
    @RequestMapping(value="/details",method= RequestMethod.GET)
    public String newsDetails(Model model,@RequestParam(name="id",required=true)Long id){
        Account logindeAccount = SessionUtil.getLogindeAccount();
        model.addAttribute("logindeAccount", logindeAccount);
        List<News> top5ByOrderByHitsDesc = newsService.findTop5ByOrderByHitsDesc();
        model.addAttribute("hitsTop5", top5ByOrderByHitsDesc);
        News news = newsService.find(id);
        model.addAttribute("news", news);
        news.setHits(news.getHits()+1);
        newsService.save(news);
        model.addAttribute("newscountTotal",commentsService.newscountTotal(id));
        List<Comments> comments = commentsService.listComments();
        model.addAttribute("comments", comments);

        return "home/news/details";
    }

    /**
     * 跳转到前台新闻页面
     * @return
     */
    @RequestMapping(value="/add",method= RequestMethod.GET)
    public String list(){
        return "home/news/list";
    }


    /**
     * 添加评论
     * @param comments
     * @param parentId
     * @param newsId
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/add",method=RequestMethod.POST)
    public Result<Boolean> add(@RequestParam(name = "parentId",required = false) Long parentId,Long newsId,Comments comments){

        Account loginedAccount =  SessionUtil.getLogindeAccount();
        comments.setAccount(loginedAccount);

        if (parentId != null) {
            comments.setParentCommentId(parentId);
        }
        if (newsId !=null){
            News news = newsService.find(newsId);
            comments.setNews(news);
        }
        //到这说明一切符合条件，进行数据库新增
        if(commentsService.save(comments) == null){
            return Result.error(CodeMsg.ADMIN_LEAVEWORD_ADD_ERROR);
        }
        return Result.success(true);
    }
}
