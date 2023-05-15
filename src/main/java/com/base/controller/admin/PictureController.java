package com.base.controller.admin;

import com.base.bean.CodeMsg;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.entity.admin.Label;
import com.base.entity.common.Picture;
import com.base.entity.common.PictureItem;
import com.base.service.common.admin.LabelService;
import com.base.service.common.admin.OperaterLogService;
import com.base.service.common.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
@RequestMapping("/admin/picture")
public class PictureController {


    @Autowired
    PictureService pictureService;

    @Autowired
    OperaterLogService operaterLogService;

    @Autowired
    LabelService labelService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model, Picture picture, PageBean<Picture> pageBean)
    {
        pageBean = pictureService.findList(picture, pageBean);
        
        model.addAttribute("title","图库管理");
        PageBean<PictureItem> pageBean1 = new PageBean<>();
        pageBean1.setCurrentPage(pageBean.getCurrentPage());
        pageBean1.setTotalPage(pageBean.getTotalPage());
        pageBean1.setTotal(pageBean.getTotal());
        pageBean1.setContent(PictureItem.getPictureItem(pageBean.getContent() == null ? new ArrayList<>() : pageBean.getContent()));

        model.addAttribute("pageBean", pageBean1);
        model.addAttribute("name", picture.label == null ? "" : picture.label.getName());

        return "admin/picture/list";
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public Result<Boolean> delete(@RequestParam("id")Long id)
    {
        try{
            pictureService.delete(id);
        }catch (Exception e)
        {
            return Result.error(CodeMsg.ADMIN_PICTURE_DELETE);
        }
        return Result.success(true);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model)
    {
        model.addAttribute("labels", labelService.findAll());
        return "admin/picture/add";
    }

    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Result<Boolean> add(@RequestParam("images")String images, @RequestParam("label")Long labelId)
    {
        if(images.trim().length() == 0)
        {
            return Result.error(CodeMsg.ADMIN_PICTURE_ADD_ERROR);
        }

        if(labelId == null)
        {
            return Result.error(CodeMsg.ADMIN_PICTURE_ADD_ERROR);
        }

        Picture p = new Picture();
        p.label = new Label();
        p.label.setId(labelId);
        p.setHeadPic(images);

        if(pictureService.save(p) == null)
        {
            return Result.error(CodeMsg.ADMIN_PICTURE_ADD_ERROR);
        }

        return Result.success(true);
    }

}
