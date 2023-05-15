package com.base.controller.admin;

import com.base.bean.CodeMsg;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.entity.admin.LeaveWord;
import com.base.service.common.admin.LeaveWordService;
import com.base.service.common.admin.OperaterLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author wangzihan
 * @date : 2020/11/11 13:39
 */

@RequestMapping("/admin/leave_word")
@Controller
public class LeaveWordController {
    
    @Autowired
    private LeaveWordService leaveWordService;

    @Autowired
    private OperaterLogService operaterLogService;

    /**
     * 用户留言列表页面
     * @param model
     * @param leaveWord
     * @param pageBean
     * @return
     */
    @RequestMapping(value="/list")
    public String list(Model model, LeaveWord leaveWord, PageBean<LeaveWord> pageBean){
        model.addAttribute("title", "用户留言列表");
        model.addAttribute("pageBean", leaveWordService.findList(leaveWord, pageBean));
        return "admin/leave_word/list";
    }


    /**
     * 删除用户留言
     * @param id
     * @return
     */
    @RequestMapping(value="/delete",method=RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
        try {
            leaveWordService.delete(id);
        } catch (Exception e) {
            return Result.error(CodeMsg.ADMIN_LEAVEWORD_DELETE_ERROR);
        }
        operaterLogService.add("添加用户留言，用户留言ID：" + id);
        return Result.success(true);
    }


}
