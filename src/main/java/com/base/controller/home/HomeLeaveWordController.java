package com.base.controller.home;

import com.base.bean.CodeMsg;
import com.base.bean.Result;
import com.base.entity.admin.LeaveWord;
import com.base.entity.home.Account;
import com.base.service.common.admin.LeaveWordService;
import com.base.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author
 * 前台用户留言反馈页面控制层
 */
@RequestMapping("/home/leave_word")
@Controller
public class HomeLeaveWordController {

    @Autowired
    private LeaveWordService leaveWordService;

    /**
     * 跳转到前台留言页面
     * @return
     */
    @RequestMapping(value="/add",method= RequestMethod.GET)
    public String add(){
        Account loginedAccount =  SessionUtil.getLogindeAccount();
        if(loginedAccount == null){
            return "redirect:/home/index/login";
        }
        return "/home/leave_word/add";
    }

    /**
     * 用户评论添加表单提交处理
     * @param leaveWord
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/add",method=RequestMethod.POST)
    public Result<Boolean> add(LeaveWord leaveWord){

        Account loginedAccount =  SessionUtil.getLogindeAccount();
        leaveWord.setAccount(loginedAccount);

        if(leaveWordService.save(leaveWord) == null){
            return Result.error(CodeMsg.ADMIN_LEAVEWORD_ADD_ERROR);
        }
        return Result.success(true);
    }
}
