package com.base.controller.admin;

import com.base.bean.CodeMsg;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.entity.admin.Recommend;
import com.base.entity.admin.User;
import com.base.service.common.admin.OperaterLogService;
import com.base.service.common.admin.RecommendService;
import com.base.util.SessionUtil;
import com.base.util.ValidateEntityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author zhong
 * @Date 2020-11-11
 */
@Controller
@RequestMapping("/admin/recommend")
public class RecommendController {

    @Autowired
    RecommendService recommendService;

    @Autowired
    OperaterLogService operaterLogService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model, Recommend recommend, PageBean<Recommend> pageBean)
    {
        model.addAttribute("title","推荐展示");
        model.addAttribute("pageBean", recommendService.findList(recommend, pageBean));
        model.addAttribute("content", recommend.getContent());

        return "admin/recommend/list";
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public Result<Boolean> delete(@RequestParam("id")Long id)
    {
        try
        {
            recommendService.delete(id);
        }
        catch (Exception e)
        {
            return Result.error(CodeMsg.ADMIN_RECOMMEND_DELETE_ERROR);
        }
        return Result.success(true);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model)
    {
        return "admin/recommend/add";
    }


    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Result<Boolean> add(Recommend recommend)
    {
        if(recommend == null)
        {
            return Result.error(CodeMsg.ADMIN_RECOMMEND_ADD_ERROR);
        }

        CodeMsg codeMsg = ValidateEntityUtil.validate(recommend);
        if(codeMsg.getCode() != CodeMsg.SUCCESS.getCode())
        {
            return Result.error(codeMsg);
        }

        if(recommend.content == null)
        {
            return Result.error(CodeMsg.ADMIN_RECOMMEND_ADD_ERROR);
        }

        if(recommend.content.trim().length() == 0) {
            return Result.error(CodeMsg.ADMIN_RECOMMEND_ADD_ERROR);
        }

        User user = SessionUtil.getLoginedUser();
        if(user == null)
        {
            return Result.error(CodeMsg.USER_SESSION_EXPIRED);
        }

        recommend.setUser(user);

        if(recommendService.save(recommend) == null)
        {
            return Result.error(CodeMsg.ADMIN_RECOMMEND_ADD_ERROR);
        }

        return Result.success(true);
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Model model, @RequestParam("id") Long id)
    {
        model.addAttribute("recommend",recommendService.find(id));
        return "admin/recommend/edit";
    }

    /**
     * 编辑保存方法
     * @param recommend
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public Result<Boolean> edit(Recommend recommend)
    {
        if(recommend == null)
        {
            return Result.error(CodeMsg.ADMIN_RECOMMEND_EDIT_ERROR);
        }

        if(recommend.getId() == null)
        {
            return Result.error(CodeMsg.ADMIN_RECOMMEND_EDIT_ERROR);
        }

        CodeMsg codeMsg = ValidateEntityUtil.validate(recommend);
        if(codeMsg.getCode() != CodeMsg.SUCCESS.getCode())
        {
            return Result.error(codeMsg);
        }

        if(recommend.content == null)
        {
            return Result.error(CodeMsg.ADMIN_RECOMMEND_EDIT_ERROR);
        }

        if(recommend.content.trim().length() == 0) {
            return Result.error(CodeMsg.ADMIN_RECOMMEND_EDIT_ERROR);
        }

        Recommend findById = recommendService.find(recommend.getId());
        findById.setContent(recommend.content);
        if(recommendService.save(findById) == null)
        {
            return Result.error(CodeMsg.ADMIN_RECOMMEND_EDIT_ERROR);
        }

        return Result.success(true);
    }
}
