package com.base.controller.home;

import com.alibaba.fastjson.JSONArray;
import com.base.entity.common.Courses;
import com.base.service.common.ScheduleService;
import com.base.bean.CourseType;
import com.base.bean.PageBean;
import com.base.entity.home.ClazzSchedule;
import com.base.service.common.admin.OperaterLogService;
import com.base.service.common.AppointmentService;
import com.base.service.common.CoursesService;
import com.base.service.common.RateService;
import com.base.util.DateUtil;
import com.base.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.ParseException;
import java.util.*;

/**
 * 前台课程控制器
 *
 * @author Administrator
 */
@RequestMapping("/home/course")
@Controller
public class HomeCourseController {

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private CoursesService coursesService;

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private OperaterLogService operaterLogService;


    @Autowired
    private RateService rateService;

    @Value("${ylrc.make.max}")
    private Integer maxMake;

    /**
     * 前台课程列表
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String courseList(Model model, Courses courses, PageBean<Courses> pageBean) {

        Map<Long,Map> rates = new HashMap<>();
        for (Object item : rateService.groupByCourse()) {
            Object[] array = (Object[]) item;
            Map row = new HashMap();
            row.put("courseId", ((BigInteger)array[0]).longValue());
            row.put("count",((BigDecimal)array[1]).doubleValue());
            rates.put(((BigInteger)array[0]).longValue(), row);
        }
        model.addAttribute("pageBean", coursesService.findListGetRate(courses, pageBean, rates));
        model.addAttribute("title", courses.getTitle() == "" ? "" : courses.getTitle());
        model.addAttribute("courseTypeList", CourseType.values());

        return "home/course/list";
    }

    /**
     * 课程详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable("id") Long id, Model model) {
        Map<Long,Map> rates = new HashMap<>();
        for (Object item : rateService.groupByCourse()) {
            Object[] array = (Object[]) item;
            Map row = new HashMap();
            row.put("courseId", ((BigInteger)array[0]).longValue());
            row.put("count",((BigDecimal)array[1]).doubleValue());
            rates.put(((BigInteger)array[0]).longValue(), row);
        }

        model.addAttribute("course", coursesService.findGetRate(id, rates));
        return "home/course/detail";
    }

    /**
     * 查看课程的课程表
     *
     * @param courseId
     * @return
     */
    @RequestMapping(value = "/scheduleDetail")
    public String scheduleDetail(@RequestParam("id") Long courseId,Model modelMap) throws ParseException {
        ClazzSchedule clazzSchedule = scheduleService.findByCoursesId(courseId);
        if(clazzSchedule==null){
            modelMap.addAttribute("clazzSchedule",clazzSchedule);
            modelMap.addAttribute("msg","暂无课程");
            return "/home/course/schedule_detail";
        }
        List<String> totalCount = appointmentService.findTotalCount(courseId, maxMake);
        String totalCountList = JSONArray.toJSONString(totalCount);
        System.out.println(totalCount);
        Date startDate = clazzSchedule.getStartDate();
        Date endDate = clazzSchedule.getEndDate();
        List<Date> dateList = DateUtil.getBetweenDates(startDate, endDate);
        List<String> slotList = DateUtils.getDateSlot(clazzSchedule.getStartTime(), clazzSchedule.getEndTime(), clazzSchedule.getSlot());
        modelMap.addAttribute("dateList",dateList);
        modelMap.addAttribute("slotList",slotList);
        modelMap.addAttribute("clazzSchedule",clazzSchedule);
        modelMap.addAttribute("appointmentList",totalCountList);
        modelMap.addAttribute("makeMax",maxMake);
        return "/home/course/schedule_detail";
    }
}
