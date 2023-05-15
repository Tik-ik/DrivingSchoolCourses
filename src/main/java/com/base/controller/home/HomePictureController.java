package com.base.controller.home;

import com.base.entity.common.Picture;
import com.base.entity.common.PictureItem;
import com.base.service.common.admin.LabelService;
import com.base.service.common.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/home/index")
public class HomePictureController {
    @Autowired
    PictureService pictureService;

    @Autowired
    LabelService labelService;

    @RequestMapping(value = "/picture", method = RequestMethod.GET)
    public String picture(Model model, Picture picture)
    {
        List<PictureItem> pictureItems = PictureItem.getPictureItem(pictureService.findAll());

        model.addAttribute("pictureItems", pictureItems);
        model.addAttribute("labels", labelService.findAll());
        model.addAttribute("label", picture.label == null ? "-1" : picture.label.getId());
        return "home/index/picture";
    }
}
