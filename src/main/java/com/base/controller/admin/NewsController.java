package com.base.controller.admin;

import com.base.bean.CodeMsg;
import com.base.entity.admin.Comments;
import com.base.service.common.admin.CommentsService;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.entity.admin.News;
import com.base.entity.admin.User;
import com.base.service.common.admin.LabelService;
import com.base.service.common.admin.NewsService;
import com.base.service.common.admin.OperaterLogService;
import com.base.util.SessionUtil;
import com.base.util.ValidateEntityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author wangzihan
 * @date : 2020/11/10 17:58
 * 新闻控制层
 */
@RequestMapping("/admin/news")
@Controller
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private LabelService labelService;

    @Autowired
    private CommentsService commentsService;

    @Autowired
    private OperaterLogService operaterLogService;


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
        model.addAttribute("title", news.getTitle());
        model.addAttribute("pageBean", newsService.findList(news, pageBean));
        return "admin/news/list";
    }

    /**
     * 新增新闻页面
     * @return
     */
    @RequestMapping(value="/add",method= RequestMethod.GET)
    public String add(Model model){
        model.addAttribute("labels",labelService.findAll());
        return "admin/news/add";
    }

    /**
     * 新闻添加表单提交处理
     * @param news
     * @return
     */
    @RequestMapping(value="/add",method=RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> add(News news){
        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(news);
        if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
            return Result.error(validate);
        }
        if(news.getLabel() == null || news.getLabel().getId() == null){
            return Result.error(CodeMsg.ADMIN_NEWS_LABEL_EMPTY);
        }
        //设置发布人
        User user = SessionUtil.getLoginedUser();
        news.setUser(user);
        //到这说明一切符合条件，进行数据库新增
        news.setHits(0l);
        if(newsService.save(news) == null){
            return Result.error(CodeMsg.ADMIN_NEWS_ADD_ERROR);
        }
        operaterLogService.add("添加新闻，新闻标题：" + news.getTitle());
        return Result.success(true);
    }

    /**
     * 新闻编辑页面
     * @param model
     * @return
     */
    @RequestMapping(value="/edit",method=RequestMethod.GET)
    public String edit(Model model,@RequestParam(name="id",required=true)Long id){
        model.addAttribute("labels", labelService.findAll());
        model.addAttribute("news", newsService.find(id));
        return "admin/news/edit";
    }

    /**
     * 编辑新闻信息表单提交处理
     * @param news
     * @return
     */
    @RequestMapping(value="/edit",method=RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> edit(News news){
        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(news);
        if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
            return Result.error(validate);
        }
        if(news.getLabel() == null || news.getLabel().getId() == null){
            return Result.error(CodeMsg.ADMIN_NEWS_LABEL_EMPTY);
        }
        if(news.getId() == null || news.getId().longValue() <= 0){
            return Result.error(CodeMsg.ADMIN_NEWS_NO_EXIST);
        }
        //到这说明一切符合条件，进行数据库保存
        News findById = newsService.find(news.getId());
        //讲提交的新闻信息指定字段复制到已存在的news对象中,该方法会覆盖新字段内容
        BeanUtils.copyProperties(news, findById, "id","createTime","updateTime","user","hits");
        if(newsService.save(findById) == null){
            return Result.error(CodeMsg.ADMIN_NEWS_EDIT_ERROR);
        }
        operaterLogService.add("编辑新闻，新闻标题：" + news.getTitle());
        return Result.success(true);
    }

    /**
     * 删除新闻
     * @param id
     * @return
     */
    @RequestMapping(value="/delete",method=RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
        try {
            //要删除的新闻
            News news = newsService.find(id);
            //查询出该新闻下的所有评论并进行删除
            List<Comments> newsCommentsAll = commentsService.findNewsCommentsAll(news.getId());
            for (Comments comments : newsCommentsAll) {
                commentsService.delete(comments.getId());
            }
            newsService.delete(id);
        } catch (Exception e) {
            return Result.error(CodeMsg.ADMIN_NEWS_DELETE_ERROR);
        }
        operaterLogService.add("添加新闻，新闻ID：" + id);
        return Result.success(true);
    }



}
