package com.base.controller.admin;

import com.base.bean.CodeMsg;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.entity.home.Account;
import com.base.service.common.admin.OperaterLogService;
import com.base.service.common.AccountService;
import com.base.util.ValidateEntityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/account")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private OperaterLogService operaterLogService;

    /**
     * 前台用户展示列表页面
     * @param model
     * @param account
     * @param pageBean
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(Model model, Account account, PageBean<Account> pageBean) {
        model.addAttribute("title", "前台用户列表");
        model.addAttribute("username", account.getUsername());
        model.addAttribute("pageBean", accountService.findList(account, pageBean));
        return "admin/account/list";
    }

    /**
     * 前台用户编辑页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Model model, @RequestParam(name = "id", required = true) Long id) {
        model.addAttribute("account", accountService.find(id));
        return "admin/account/edit";
    }

    /**
     * 修改前台用户信息表单提交处理
     * @param account
     * @return
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> edit(Account account) {
        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(account);
        if (validate.getCode() != CodeMsg.SUCCESS.getCode()) {
            return Result.error(validate);
        }
        if (account.getId() == null || account.getId().longValue() <= 0) {
            return Result.error(CodeMsg.ADMIN_ACCOUNT_NO_EXIST);
        }
        //到这说明一切符合条件，进行数据库保存
        Account findById = accountService.find(account.getId());
        //讲提交的用户信息指定字段复制到已存在的user对象中,该方法会覆盖新字段内容
        BeanUtils.copyProperties(account, findById, "id", "createTime", "updateTime","headPic","sex");
        if (accountService.save(findById) == null) {
            return Result.error(CodeMsg.ADMIN_ACCOUNT_EDIT_ERROR);
        }
        operaterLogService.add("编辑前台用户，前台用户名：" + account.getUsername());
        return Result.success(true);
    }

    /**
     * 删除前台用户
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> delete(@RequestParam(name = "id", required = true) Long id) {
        try {
            accountService.delete(id);
        } catch (Exception e) {
            return Result.error(CodeMsg.ADMIN_ACCOUNT_DELETE_ERROR);
        }
        operaterLogService.add("添加前台用户，用户名ID：" + id);
        return Result.success(true);
    }
}
