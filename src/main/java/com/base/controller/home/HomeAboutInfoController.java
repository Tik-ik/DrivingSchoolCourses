package com.base.controller.home;

import com.base.bean.PageBean;
import com.base.entity.admin.Coach;
import com.base.service.common.admin.AboutInfoService;
import com.base.service.common.admin.CoachService;
import com.base.service.common.admin.RecommendService;
import com.base.service.common.AchievementService;
import com.base.service.common.RateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/home/index")
public class HomeAboutInfoController {

    //关于
    @Autowired
    AboutInfoService aboutInfoService;

    //推荐
    @Autowired
    RecommendService recommendService;

    //成就
    @Autowired
    AchievementService achievementService;

    //教练
    @Autowired
    CoachService coachService;

    //评分
    @Autowired
    RateService rateService;

    @RequestMapping(value="/about",method = RequestMethod.GET)
    public String about(Model model, Coach coach, PageBean<Coach> pageBean)
    {
        coach = new Coach();
        coach.name = "";

        //设置只显示4条
        pageBean.setPageSize(4);

        model.addAttribute("aboutInfo",aboutInfoService.findTop1ByOrderByIdDesc());
        model.addAttribute("recommends", recommendService.findTop5ByOrderByIdDesc());
        model.addAttribute("achievement", achievementService.findTop1ByOrderByIdDesc());
        Integer count = rateService.getCount();
        Integer countAll = rateService.getCountAll();
        Double pro =  (count.doubleValue() / 5) * 100;

        model.addAttribute("count", count);
        model.addAttribute("pro", pro);
        pageBean = coachService.findList(coach,pageBean);
        for (Coach item : pageBean.getContent()) {
            if(item.introduce.trim().length() > 65)
            {
                item.introduce = item.introduce.trim().substring(0,65) + "...";
            }
        }
        model.addAttribute("pageBean", pageBean);
        return "home/index/about";
    }

    @RequestMapping(value = "/teacher_details", method = RequestMethod.GET)
    public String teacherDetails(Model model, @RequestParam("id")Long id)
    {
        model.addAttribute("coach",coachService.find(id));
        return "home/index/teacher_details";
    }
}
