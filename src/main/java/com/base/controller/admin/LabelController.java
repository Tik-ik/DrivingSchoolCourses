package com.base.controller.admin;

import com.base.bean.CodeMsg;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.entity.admin.Label;
import com.base.service.common.admin.LabelService;
import com.base.service.common.admin.OperaterLogService;
import com.base.util.ValidateEntityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author wangzihan
 * @date : 2020/11/10 17:30
 * 分类标签控制层
 */
@RequestMapping("/admin/label")
@Controller
public class LabelController {

    @Autowired
    private LabelService labelService;

    @Autowired
    private OperaterLogService operaterLogService;


    /**
     * 分类标签列表页面
     * @param model
     * @param label
     * @param pageBean
     * @return
     */
    @RequestMapping(value="/list")
    public String list(Model model, Label label, PageBean<Label> pageBean){
        model.addAttribute("title", "分类标签列表");
        model.addAttribute("name", label.getName());
        model.addAttribute("pageBean", labelService.findList(label, pageBean));
        return "admin/label/list";
    }

    /**
     * 新增分类标签页面
     * @return
     */
    @RequestMapping(value="/add",method= RequestMethod.GET)
    public String add(){
        return "admin/label/add";
    }

    /**
     * 分类标签添加表单提交处理
     * @param label
     * @return
     */
    @RequestMapping(value="/add",method=RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> add(Label label){
        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(label);
        if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
            return Result.error(validate);
        }
        //判断分类标签名是否存在
        if(labelService.isExistLabelName(label.getName(), 0l)){
            return Result.error(CodeMsg.ADMIN_LABELNAME_EXIST);
        }
        //到这说明一切符合条件，进行数据库新增
        if(labelService.save(label) == null){
            return Result.error(CodeMsg.ADMIN_LABEL_ADD_ERROR);
        }
        operaterLogService.add("添加分类标签，分类标签名：" + label.getName());
        return Result.success(true);
    }

    /**
     * 分类标签编辑页面
     * @param model
     * @return
     */
    @RequestMapping(value="/edit",method=RequestMethod.GET)
    public String edit(Model model,@RequestParam(name="id",required=true)Long id){
        model.addAttribute("label", labelService.find(id));
        return "admin/label/edit";
    }

    /**
     * 编辑分类标签信息表单提交处理
     * @param label
     * @return
     */
    @RequestMapping(value="/edit",method=RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> edit(Label label){
        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(label);
        if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
            return Result.error(validate);
        }
        if(label.getId() == null || label.getId().longValue() <= 0){
            return Result.error(CodeMsg.ADMIN_LABEL_NO_EXIST);
        }
        if(labelService.isExistLabelName(label.getName(), label.getId())){
            return Result.error(CodeMsg.ADMIN_LABELNAME_EXIST);
        }
        //到这说明一切符合条件，进行数据库保存
        Label findById = labelService.find(label.getId());
        //讲提交的分类标签信息指定字段复制到已存在的label对象中,该方法会覆盖新字段内容
        BeanUtils.copyProperties(label, findById, "id","createTime","updateTime");
        if(labelService.save(findById) == null){
            return Result.error(CodeMsg.ADMIN_LABEL_EDIT_ERROR);
        }
        operaterLogService.add("编辑分类标签，分类标签名：" + label.getName());
        return Result.success(true);
    }

    /**
     * 删除分类标签
     * @param id
     * @return
     */
    @RequestMapping(value="/delete",method=RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
        try {
            labelService.delete(id);
        } catch (Exception e) {
            return Result.error(CodeMsg.ADMIN_LABEL_DELETE_ERROR);
        }
        operaterLogService.add("添加分类标签，分类标签ID：" + id);
        return Result.success(true);
    }
}
