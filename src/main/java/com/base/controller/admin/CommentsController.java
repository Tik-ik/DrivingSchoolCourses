package com.base.controller.admin;

import com.base.bean.CodeMsg;
import com.base.entity.admin.Comments;
import com.base.service.common.admin.CommentsService;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.service.common.admin.OperaterLogService;
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
 * @date : 2020/11/11 14:39
 * 用户评论控制层
 */
@RequestMapping("/admin/comments")
@Controller
public class CommentsController {

    @Autowired
    private CommentsService commentsService;

    @Autowired
    private OperaterLogService operaterLogService;


    /**
     * 用户评论列表页面
     * @param model
     * @param comments
     * @param pageBean
     * @return
     */
    @RequestMapping(value="/list")
    public String list(Model model, Comments comments, PageBean<Comments> pageBean){
        model.addAttribute("title", "用户评论列表");
        model.addAttribute("pageBean", commentsService.findList(comments, pageBean));
        return "admin/comments/list";
    }


    /**
     * 删除用户评论
     * @param id
     * @return
     */
    @RequestMapping(value="/delete",method=RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
        try {

            Comments comments = commentsService.find(id);
            //判断当前评论下面有没有子评论，如果有就删除
            List<Comments> ancestorIdAll = commentsService.findAncestorIdAll(comments.getId());
            if (ancestorIdAll != null){
                for (Comments comments1 : ancestorIdAll) {
                    commentsService.delete(comments1.getId());
                }
            }
            if (comments != null){
                commentsService.delete(id);
            }
        } catch (Exception e) {
            return Result.error(CodeMsg.ADMIN_COMMENTS_DELETE_ERROR);
        }
        operaterLogService.add("添加用户评论，用户评论ID：" + id);
        return Result.success(true);
    }
}
