package com.base.controller.admin;

import com.base.bean.CodeMsg;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.entity.admin.CoachType;
import com.base.service.common.admin.CoachTypeService;
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
@RequestMapping("/admin/coach_type")
public class CoachTypeController {

    @Autowired
    CoachTypeService coachTypeService;

    @Autowired
    OperaterLogService operaterLogService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model, CoachType coachType, PageBean<CoachType> pageBean)
    {
        model.addAttribute("title","教练类型管理");
        model.addAttribute("pageBean",coachTypeService.findList(coachType, pageBean));
        model.addAttribute("name",coachType.getName());
        return "admin/coach_type/list";
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public Result<Boolean> delete(@RequestParam("id") Long id)
    {
        try{
            coachTypeService.delete(id);
        }catch (Exception e)
        {
            return Result.error(CodeMsg.ADMIN_COACH_TYPE_DELETE_ERROR);
        }

        operaterLogService.add("删除成功教练类型id:" + id);
        return Result.success(true);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model)
    {
        return "admin/coach_type/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> add(CoachType coachType)
    {
        if(coachType == null)
        {
            return Result.error(CodeMsg.ADMIN_COACH_TYPE_ADD_ERROR);
        }

        CodeMsg codeMsg = ValidateEntityUtil.validate(coachType);
        if(codeMsg.getCode() != CodeMsg.SUCCESS.getCode())
        {
            return Result.error(codeMsg);
        }

        if(coachType.name != null && coachTypeService.findByName(coachType.name) != null)
        {
            return Result.error(CodeMsg.ADMIN_COACH_TYPE_ADD_ERROR);
        }

        if(coachType.name.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_COACH_TYPE_ADD_ERROR);
        }

        if(coachTypeService.save(coachType) == null)
        {
            return Result.error(CodeMsg.ADMIN_COACH_TYPE_ADD_ERROR);
        }

        operaterLogService.add("用户类型添加成功:" + coachType.name);
        return Result.success(true);
    }

    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String edit(Model model, @RequestParam("id")Long id)
    {
        CoachType coachType = coachTypeService.find(id);
        model.addAttribute("coachType",coachType);
        return "admin/coach_type/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> edit(CoachType coachType)
    {
        if(coachType == null)
        {
            return Result.error(CodeMsg.ADMIN_COACH_TYPE_EDIT_ERROR);
        }

        if(coachType != null && coachType.getId() == null)
        {
            return Result.error(CodeMsg.ADMIN_COACH_TYPE_EDIT_ERROR);
        }

        CodeMsg codeMsg = ValidateEntityUtil.validate(coachType);
        if(codeMsg.getCode() != CodeMsg.SUCCESS.getCode())
        {
            return Result.error(codeMsg);
        }

        CoachType findByName = coachTypeService.findByName(coachType.name);
        if(findByName != null)
        {
            if(findByName.getId() != coachType.getId())
            {
                if(coachType.name != null &&  findByName.getName().equals(coachType.getName()))
                {
                    return Result.error(CodeMsg.ADMIN_COACH_TYPE_EDIT_ERROR);
                }
            }
            else
            {
                if(coachType.name != null &&  findByName.getName().equals(coachType.getName()))
                {
                    return Result.success(true);
                }
            }
        }


        if(coachType.name.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_COACH_TYPE_EDIT_ERROR);
        }

        CoachType findById = coachTypeService.find(coachType.getId());
        findById.setName(coachType.getName());
        if(coachTypeService.save(findById) == null)
        {
            return Result.error(CodeMsg.ADMIN_COACH_TYPE_EDIT_ERROR);
        }
        operaterLogService.add("用户类型编辑成功:" + coachType.name);

        return Result.success(true);
    }
}
