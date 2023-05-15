package com.base.controller.common;

import com.alibaba.fastjson.JSONObject;
import com.base.bean.CodeMsg;
import com.base.entity.common.Courses;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.entity.common.Appointment;
import com.base.entity.home.Account;
import com.base.service.common.admin.OperaterLogService;
import com.base.service.common.AppointmentService;
import com.base.service.common.CoursesService;
import com.base.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 预约管理控制器
 *
 * @author Administrator
 */
@Controller
public class AppointmentController {


    @Autowired
    private CoursesService coursesService;

    @Autowired
    private OperaterLogService operaterLogService;

    @Autowired
    private AppointmentService appointmentService;

    /**
     * 预约列表页面
     *
     * @param model
     * @param
     * @param pageBean
     * @return
     */
    @RequestMapping(value = "/home/appointment/list")
    public String list(Model model, Appointment appointment, PageBean<Appointment> pageBean) {
        model.addAttribute("title", "预约列表");
        model.addAttribute("coachList", appointmentService.findAll());
        model.addAttribute("courseTitle",appointment.getCourses().getTitle()==null?"":appointment.getCourses().getTitle());
        model.addAttribute("pageBean", appointmentService.findList(appointment, pageBean));
        return "admin/courses/list";
    }
    @RequestMapping(value = "/admin/appointment/list2")
    public String list2(Model model, Appointment appointment, PageBean<Appointment> pageBean)
    {
        model.addAttribute("title", "前台用户预约");
        model.addAttribute("courseTitle", appointment.getCourses() == null ? "" : appointment.getCourses().getTitle());
        model.addAttribute("pageBean",appointmentService.findList2(appointment, pageBean));
        return "admin/appointment/list2";
    }
    /**
     * 预约添加表单提交处理
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/home/appointment/add", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> add(@RequestParam(name ="makeData",required = false) String appointMent,
                               @RequestParam(name = "courseId")Long courseId) throws Exception{
        List<Appointment> appointmentList = JSONObject.parseArray(appointMent, Appointment.class);
        Courses courses = coursesService.find(courseId);
        SimpleDateFormat sft = new SimpleDateFormat("yyyy-MM-dd");
        Account account = SessionUtil.getLogindeAccount();
        if(account == null)
        {
            return Result.error(CodeMsg.SESSION_EXPIRED);
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (Appointment item : appointmentList)
        {
            String dateStr = sft.format(item.getMakeDate());
            String time = item.getMakeTime().split("-")[0];
            String datetimeStr = dateStr + " " + time + ":00";
            System.out.println(datetimeStr);

            Date datetime = sdf.parse(datetimeStr);
            Date now = new Date();
            System.out.println(sdf.format(now));
            if(datetime.getTime() < now.getTime())
            {
                return Result.error(CodeMsg.HOME_APPOINTMENT_ADD_ERROR);
            }
        }

        for(Appointment appointment:appointmentList){
            Appointment appoint = appointmentService.findByCoursesIdAndAccountIdAndMakeDateAndMakeTime(courseId, account.getId(),appointment.getMakeDate(),appointment.getMakeTime());
            if(appoint!=null){
                return Result.error(CodeMsg.ADMIN_APPOINTMENT_EXIST_ERROR);
            }
            appointment.setCourses(courses);
            appointment.setAccount(account);
            appointment.setOverdue(sft.format(appointment.getMakeDate())+" "+appointment.getMakeTime());
        }
        Boolean aBoolean = appointmentService.insertAll(appointmentList);
        if(!aBoolean){
            return Result.error(CodeMsg.ADMIN_APPOINTMENT_ADD_ERROR);
        }
        return Result.success(true);
    }



   /**
     * 删除预约
     * @param id
     * @return
     */
	@RequestMapping(value="/home/appointment/delete",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
		try {
			coursesService.delete(id);
		} catch (Exception e) {
			return Result.error(CodeMsg.ADMIN_COURSE_DELETE_ERROR);
		}
		operaterLogService.add("删除预约，预约ID：" + id);
		return Result.success(true);
	}
}
