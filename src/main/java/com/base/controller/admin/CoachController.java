package com.base.controller.admin;

import com.base.bean.CodeMsg;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.entity.admin.Coach;
import com.base.entity.admin.CoachType;
import com.base.service.common.admin.CoachService;
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

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/admin/coach")
public class CoachController {
    @Autowired
    CoachService coachService;

    @Autowired
    OperaterLogService operaterLogService;

    @Autowired
    CoachTypeService coachTypeService;


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model, Coach coach, PageBean<Coach> pageBean)
    {
        model.addAttribute("title","教练管理");
        model.addAttribute("pageBean",coachService.findList(coach,pageBean));
        model.addAttribute("name",coach.getName());
        return "admin/coach/list";
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public Result<Boolean> delete(@RequestParam("id")Long id)
    {
        try
        {
            coachService.delete(id);
        }catch (Exception e)
        {
            return Result.error(CodeMsg.ADMIN_COACH_DELETE_ERROR);
        }

        return Result.success(true);
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String add(Model model)
    {
        model.addAttribute("coachTypes",coachTypeService.findAll());
        return "admin/coach/add";
    }

    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Result<Boolean> add(Coach coach)
    {
        //手机号验证
        String phone = "^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";

        Pattern r = Pattern.compile(phone);
        Matcher m = r.matcher(coach.getPhone());
        if (!m.matches()) {
            return Result.error(CodeMsg.ADMIN_PHONE_FORRMAT_ERROR);
        }

        //邮箱验证
        String pattern = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
        Pattern emailReg = Pattern.compile(pattern);
        Matcher email = emailReg.matcher(coach.getEmail());
        if (!email.matches()) {
            return Result.error(CodeMsg.ADMIN_EAMIL_FORRMAT_ERROR);
        }

        //内容不能为空
        if(coach == null)
        {
            return Result.error(CodeMsg.ADMIN_COACH_ADD_ERROR);
        }

        CodeMsg codeMsg = ValidateEntityUtil.validate(coach);
        if(codeMsg.getCode() != CodeMsg.SUCCESS.getCode())
        {
            return Result.error(codeMsg);
        }


        if(coach.coachType != null && coach.coachType.getId() == null)
        {
            return Result.error(CodeMsg.ADMIN_COACH_SELECT_ADD_ERROR);
        }

        if(coach.name.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_COACH_ADD_ERROR);
        }

        if(coach.signature.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_COACH_ADD_ERROR);
        }

        if(coach.introduce.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_COACH_ADD_ERROR);
        }

        if(coach.introduce.trim().length() > 1500 || coach.introduce.trim().length() < 60)
        {
            return Result.error(CodeMsg.ADMIN_COACH_INTRODUCE_ADD_ERROR);
        }

        if(coachService.save(coach) == null)
        {
            return Result.error(CodeMsg.ADMIN_COACH_ADD_ERROR);
        }

        operaterLogService.add("教练添加成功:" + coach.name);
        return Result.success(true);
    }


    @RequestMapping(value="/edit", method = RequestMethod.GET)
    public String edit(Model model,@RequestParam("id")Long id)
    {
        Coach coach = coachService.find(id);
        List<CoachType> coachTypes = coachTypeService.findAll();

        model.addAttribute("coach", coach);
        model.addAttribute("coachTypes", coachTypes);
        
        return "admin/coach/edit";
    }

    @ResponseBody
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public Result<Boolean> edit(Coach coach)
    {
        //手机号验证
        String phone = "^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";

        Pattern r = Pattern.compile(phone);
        Matcher m = r.matcher(coach.getPhone());
        if (!m.matches()) {
            return Result.error(CodeMsg.ADMIN_PHONE_FORRMAT_ERROR);
        }

        //邮箱验证
        String pattern = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
        Pattern emailReg = Pattern.compile(pattern);
        Matcher email = emailReg.matcher(coach.getEmail());
        if (!email.matches()) {
            return Result.error(CodeMsg.ADMIN_EAMIL_FORRMAT_ERROR);
        }

        //内容不能为空
        if(coach == null)
        {
            return Result.error(CodeMsg.ADMIN_COACH_EDIT_ERROR);
        }

        CodeMsg codeMsg = ValidateEntityUtil.validate(coach);
        if(codeMsg.getCode() != CodeMsg.SUCCESS.getCode())
        {
            return Result.error(codeMsg);
        }

        if(coach.coachType == null)
        {
            return Result.error(CodeMsg.ADMIN_COACH_SELECT_ADD_ERROR);
        }

        if(coach.coachType != null && coach.coachType.getId() == null)
        {
            return Result.error(CodeMsg.ADMIN_COACH_SELECT_ADD_ERROR);
        }

        if(coach.name.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_COACH_EDIT_ERROR);
        }

        if(coach.signature.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_COACH_EDIT_ERROR);
        }

        if(coach.introduce.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_COACH_EDIT_ERROR);
        }

        if(coach.introduce.trim().length() > 500 || coach.introduce.trim().length() < 60)
        {
            return Result.error(CodeMsg.ADMIN_COACH_INTRODUCE_ADD_ERROR);
        }

        Coach findById = coachService.find(coach.getId());
        findById.setName(coach.name);
        findById.setSignature(coach.getSignature());
        findById.setPhone(coach.getPhone());
        findById.setEmail(coach.getEmail());
        findById.setCoachType(coachTypeService.find(coach.getCoachType().getId()));
        findById.setIntroduce(coach.getIntroduce());
        findById.setHeadPic(coach.getHeadPic());

        if(coachService.save(findById) == null)
        {
            return Result.error(CodeMsg.ADMIN_COACH_EDIT_ERROR);
        }

        operaterLogService.add("教练编辑成功:" + coach.name);
        return Result.success(true);
    }
}
