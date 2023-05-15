package com.base.controller.common;

import com.base.bean.CodeMsg;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.entity.common.Courses;
import com.base.service.common.CoursesService;
import com.base.service.common.ScheduleService;
import com.base.entity.home.ClazzSchedule;
import com.base.service.common.admin.CoachService;
import com.base.service.common.admin.OperaterLogService;
import com.base.util.DateUtil;
import com.base.util.ValidateEntityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 后台课程表表管理控制器
 *
 * @author Administrator
 */
@RequestMapping("/admin/clazz_schedule/")
@Controller
public class ClazzScheduleController {

    @Autowired
    private CoachService coachService;

    @Autowired
    private CoursesService coursesService;

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private OperaterLogService operaterLogService;

    @Value("${ylrc.date.diff}")
    private Integer maxDiffDay;

    private Logger log = LoggerFactory.getLogger(ClazzScheduleController.class);


    /**
     * 课程表列表页面
     *
     * @param model
     * @param clazzSchedule
     * @param pageBean
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(Model model, ClazzSchedule clazzSchedule, PageBean<ClazzSchedule> pageBean) {
        model.addAttribute("title", "课程表列表");
        model.addAttribute("courseTitle", clazzSchedule.getCourses() == null ? "" : clazzSchedule.getCourses().getTitle());
        model.addAttribute("pageBean", scheduleService.findList(clazzSchedule, pageBean));
        return "admin/clazz_schedule/list";
    }

    /**
     * 新增课程表页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("coachList", coachService.findAll());
        return "admin/clazz_schedule/add";
    }

    /**
     * 课程表添加表单提交处理
     *
     * @param clazzSchedule
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> add(ClazzSchedule clazzSchedule,
                               @RequestParam("startDate") String startDateStr,
                               @RequestParam("endDate") String endDateStr) throws ParseException {
        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(clazzSchedule);
        if (validate.getCode() != CodeMsg.SUCCESS.getCode()) {
            return Result.error(validate);
        }

        ClazzSchedule byCoursesId = scheduleService.findByCoursesId(clazzSchedule.getCourses().getId());
        if (byCoursesId != null) {
            return Result.error(CodeMsg.ADMIN_SCHEDULE_COURSE_EXIST_ERROR);
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        clazzSchedule.setStartDate(sdf.parse(startDateStr));
        clazzSchedule.setEndDate(sdf.parse(endDateStr));

        //开始日期和结束日期比较
        Date startDate = clazzSchedule.getStartDate();
        Date endDate = clazzSchedule.getEndDate();
        String strStartDateTime = startDateStr + " " + clazzSchedule.getStartTime();
        String strEndDateTime = endDateStr + " " + clazzSchedule.getEndTime();

        SimpleDateFormat sdf_df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date startDateTime = sdf_df.parse(strStartDateTime);
        Date endDateTime = sdf_df.parse(strEndDateTime);

        if (startDateTime.getTime() > endDateTime.getTime()) {
            return Result.error(CodeMsg.ADMIN_SCHEDULE_DATE_ERROR);
        }

        int currentDay = DateUtil.daysBetween(startDate, endDate);
        if (maxDiffDay < currentDay) {
            return Result.error(CodeMsg.ADMIN_SCHEDULE_DIFFDAY_ERROR);
        }

        //开始时间和结束时间比较
        SimpleDateFormat sf = new SimpleDateFormat("HH:mm");
        Date startTime = sf.parse(clazzSchedule.getStartTime());
        Date endTime = sf.parse(clazzSchedule.getEndTime());
        if (!startTime.before(endTime)) {
            return Result.error(CodeMsg.ADMIN_SCHEDULE_DATE_TIME_ERROR);
        }
        //时间段判断
        if (clazzSchedule.getSlot() <= 0) {
            return Result.error(CodeMsg.ADMIN_SCHEDULE_SLOT_ERROR);
        }


        //到这说明一切符合条件，进行数据库新增
        if (scheduleService.save(clazzSchedule) == null) {
            return Result.error(CodeMsg.ADMIN_SCHEDULE_ADD_ERROR);
        }
        //  operaterLogService.add("添加课程表，课程表标题：" + courses.getTitle());
        return Result.success(true);
    }

    /**
     * 课程表编辑页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Model model, @RequestParam(name = "id", required = true) Long id) {
        ClazzSchedule clazzSchedule = scheduleService.find(id);
        model.addAttribute("coachList", coachService.findAll());
        model.addAttribute("clazzSchedule", clazzSchedule);
        return "admin/clazz_schedule/edit";
    }

    /**
     * 编辑课程表信息表单提交处理
     *
     * @param clazzSchedule
     * @return
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> edit(ClazzSchedule clazzSchedule) throws ParseException {
        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(clazzSchedule);
        if (validate.getCode() != CodeMsg.SUCCESS.getCode()) {
            return Result.error(validate);
        }
        //开始日期和结束日期比较
        Date startDate = clazzSchedule.getStartDate();
        Date endDate = clazzSchedule.getEndDate();
        if (!startDate.before(endDate)) {
            return Result.error(CodeMsg.ADMIN_SCHEDULE_DATE_ERROR);
        }
        //开始时间和结束时间比较
        SimpleDateFormat sf = new SimpleDateFormat("HH:mm");
        Date startTime = sf.parse(clazzSchedule.getStartTime());
        Date endTime = sf.parse(clazzSchedule.getEndTime());
        if (!startTime.before(endTime)) {
            return Result.error(CodeMsg.ADMIN_SCHEDULE_DATE_TIME_ERROR);
        }
        //时间段判断
        if (clazzSchedule.getSlot() <= 0) {
            return Result.error(CodeMsg.ADMIN_SCHEDULE_SLOT_ERROR);
        }
        //到这说明一切符合条件，进行数据库保存
        ClazzSchedule findById = scheduleService.find(clazzSchedule.getId());
        //讲提交的课程表信息指定字段复制到已存在的user对象中,该方法会覆盖新字段内容
        BeanUtils.copyProperties(clazzSchedule, findById, "id", "createTime", "updateTime");
        if (scheduleService.save(findById) == null) {
            return Result.error(CodeMsg.ADMIN_SCHEDULE_EDIT_ERROR);
        }
        operaterLogService.add("编辑课程表，课程标题：" + clazzSchedule.getCourses().getTitle());
        return Result.success(true);
    }

    /**
     * 删除课程表
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> delete(@RequestParam(name = "id", required = true) Long id) {
        try {
            coursesService.delete(id);
        } catch (Exception e) {
            return Result.error(CodeMsg.ADMIN_COURSE_DELETE_ERROR);
        }
        operaterLogService.add("删除课程表，课程表ID：" + id);
        return Result.success(true);
    }

    /**
     * 根据教练获取课程
     *
     * @param coachId
     * @return
     */
    @RequestMapping(value = "/gainCourse", method = RequestMethod.GET)
    @ResponseBody
    public Result<List<Courses>> gainCourse(@RequestParam("coachId") Long coachId) {
        List<Courses> coursesList = coursesService.findByCoachId(coachId);
        return Result.success(coursesList);
    }
}
