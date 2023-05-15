package com.base.controller.admin;

import com.base.bean.CodeMsg;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.entity.admin.AboutInfo;
import com.base.service.common.admin.AboutInfoService;
import com.base.service.common.admin.OperaterLogService;
import com.base.util.ValidateEntityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/about_info")
public class AboutInfoController {

    @Autowired
    AboutInfoService aboutInfoService;

    @Autowired
    OperaterLogService operaterLogService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model, AboutInfo aboutInfo, PageBean<AboutInfo> pageBean)
    {
        model.addAttribute("title","关于介绍");
        model.addAttribute("pageBean", aboutInfoService.findList(aboutInfo, pageBean));
        model.addAttribute("caption", aboutInfo.getCaption());

        return "admin/about_info/list";
    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(Model model)
    {
        return "admin/about_info/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> add(AboutInfo aboutInfo)
    {
        if(aboutInfo == null)
        {
            return Result.error(CodeMsg.ADMIN_ABOUT_INFO_ADD_ERROR);
        }

        CodeMsg codeMsg = ValidateEntityUtil.validate(aboutInfo);
        if(codeMsg.getCode() != CodeMsg.SUCCESS.getCode())
        {
            return Result.error(codeMsg);
        }

        if(aboutInfo.caption.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_ABOUT_INFO_ADD_ERROR);
        }

        if(aboutInfo.content.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_ABOUT_INFO_ADD_ERROR);
        }

        if(aboutInfoService.save(aboutInfo) == null)
        {
            return Result.error(CodeMsg.ADMIN_ABOUT_INFO_ADD_ERROR);
        }
        operaterLogService.add("添加关于成功:" + aboutInfo.getCaption());
        return Result.success(true);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> delete(@RequestParam("id")Long id)
    {
        try
        {
            aboutInfoService.delete(id);
        }catch (Exception e)
        {
            return Result.error(CodeMsg.ADMIN_ABOUT_INFO_DELETE_ERROR);
        }
        return Result.success(true);
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Model model, @RequestParam("id")Long id)
    {
        AboutInfo aboutInfo = aboutInfoService.find(id);
        model.addAttribute("aboutInfo",aboutInfo);

        return "admin/about_info/edit";
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> edit(AboutInfo aboutInfo)
    {
        if(aboutInfo == null)
        {
            return Result.error(CodeMsg.ADMIN_ABOUT_INFO_ADD_ERROR);
        }

        if(aboutInfo.getId() == null)
        {
            return Result.error(CodeMsg.ADMIN_ABOUT_INFO_ADD_ERROR);
        }

        CodeMsg codeMsg = ValidateEntityUtil.validate(aboutInfo);
        if(codeMsg.getCode() != CodeMsg.SUCCESS.getCode())
        {
            return Result.error(codeMsg);
        }

        if(aboutInfo.caption.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_ABOUT_INFO_ADD_ERROR);
        }

        if(aboutInfo.content.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_ABOUT_INFO_ADD_ERROR);
        }

        AboutInfo findById = aboutInfoService.find(aboutInfo.getId());
        findById.setCaption(aboutInfo.getCaption());
        findById.setContent(aboutInfo.getContent());
        if(aboutInfoService.save(findById) == null)
        {
            return Result.error(CodeMsg.ADMIN_ABOUT_INFO_ADD_ERROR);
        }

        operaterLogService.add("编辑关于成功:" + aboutInfo.getCaption());
        return Result.success(true);
    }
}
