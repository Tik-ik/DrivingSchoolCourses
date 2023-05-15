package com.base.controller.admin;

import com.base.bean.CodeMsg;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.entity.common.Achievement;
import com.base.service.common.AchievementService;
import com.base.util.ValidateEntityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/achievement")
public class AchievementController {

    @Autowired
    AchievementService achievementService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model, Achievement achievement, PageBean<Achievement> pageBean)
    {
        model.addAttribute("title","成果展示");
        model.addAttribute("pageBean", achievementService.findList(achievement, pageBean));
        model.addAttribute("remark",achievement.getRemark());
        return "admin/achievement/list";
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public Result<Boolean> delete(@RequestParam("id")Long id)
    {
        try
        {
            achievementService.delete(id);
        }
        catch (Exception e)
        {
            return Result.error(CodeMsg.ADMIN_ACHIEVEMENT_DELETE_ERROR);
        }
        return Result.success(true);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model)
    {
        return "admin/achievement/add";
    }


    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> add(Achievement achievement)
    {
        if(achievement == null)
        {
            return Result.error(CodeMsg.ADMIN_ACHIEVEMENT_ADD_ERROR);
        }

        CodeMsg codeMsg = ValidateEntityUtil.validate(achievement);
        if(codeMsg.getCode() != CodeMsg.SUCCESS.getCode())
        {
            return Result.error(codeMsg);
        }

        if(achievement.awards == null)
        {
            return Result.error(CodeMsg.ADMIN_ACHIEVEMENT_ADD_ERROR);
        }

        if(achievement.experience == null)
        {
            return Result.error(CodeMsg.ADMIN_ACHIEVEMENT_ADD_ERROR);
        }

        if(achievement.remark.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_ACHIEVEMENT_ADD_ERROR);
        }

        if(achievementService.save(achievement) == null)
        {
            return Result.error(CodeMsg.ADMIN_ACHIEVEMENT_ADD_ERROR);
        }

        return Result.success(true);
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Model model, @RequestParam("id")Long id)
    {
        model.addAttribute("achievement",achievementService.find(id));
        return "admin/achievement/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> edit(Achievement achievement)
    {
        if(achievement == null)
        {
            return Result.error(CodeMsg.ADMIN_ACHIEVEMENT_EDIT_ERROR);
        }

        CodeMsg codeMsg = ValidateEntityUtil.validate(achievement);
        if(codeMsg.getCode() != CodeMsg.SUCCESS.getCode())
        {
            return Result.error(codeMsg);
        }

        if(achievement.awards == null)
        {
            return Result.error(CodeMsg.ADMIN_ACHIEVEMENT_EDIT_ERROR);
        }

        if(achievement.experience == null)
        {
            return Result.error(CodeMsg.ADMIN_ACHIEVEMENT_EDIT_ERROR);
        }

        if(achievement.remark.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_ACHIEVEMENT_EDIT_ERROR);
        }

        if(achievement.getId() == null)
        {
            return Result.error(CodeMsg.ADMIN_ACHIEVEMENT_EDIT_ERROR);
        }

        Achievement findById = achievementService.find(achievement.getId());
        if(findById == null)
        {
            return Result.error(CodeMsg.ADMIN_ACHIEVEMENT_EDIT_ERROR);
        }

        findById.setRemark(achievement.getRemark());
        findById.setExperience(achievement.getExperience());
        findById.setAwards(achievement.getAwards());
        if(achievementService.save(findById) == null)
        {
            return Result.error(CodeMsg.ADMIN_ACHIEVEMENT_EDIT_ERROR);
        }

        return Result.success(true);
    }
}
