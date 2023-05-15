package com.base.controller.common;

import com.base.bean.*;
import com.base.entity.common.Courses;
import com.base.service.common.CoursesService;
import com.base.service.common.admin.CoachService;
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

import java.math.BigDecimal;

/**
 * 后台课程管理控制器
 *
 * @author Administrator
 */
@RequestMapping("/admin/course")
@Controller
public class CoursesController {

    @Autowired
    private CoachService coachService;

    @Autowired
    private CoursesService coursesService;

    @Autowired
    private OperaterLogService operaterLogService;

    /**
     * 课程列表页面
     *
     * @param model
     * @param courses
     * @param pageBean
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(Model model, Courses courses, PageBean<Courses> pageBean) {
        model.addAttribute("title", "课程列表");
        model.addAttribute("coachList", coachService.findAll());
        model.addAttribute("courseTitle",courses.getTitle()==null?"":courses.getTitle());
        model.addAttribute("pageBean", coursesService.findList(courses, pageBean));

        return "admin/courses/list";
    }

    /**
     * 新增课程页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("coachList", coachService.findAll());
        model.addAttribute("courseType", CourseType.values());
        model.addAttribute("courseSkills", CourseSkills.values());
        return "admin/courses/add";
    }

    /**
     * 课程添加表单提交处理
     *
     * @param courses
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> add(Courses courses) {
        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(courses);
        if (validate.getCode() != CodeMsg.SUCCESS.getCode()) {
            return Result.error(validate);
        }
        BigDecimal price = courses.getPrice();
        if (price.compareTo(BigDecimal.ZERO) == -1) {
            return Result.error(CodeMsg.ADMIN_COURSE_PRICE_ERROR);
        }
        //到这说明一切符合条件，进行数据库新增
        if (coursesService.save(courses) == null) {
            return Result.error(CodeMsg.ADMIN_COURSE_ADD_ERROR);
        }
        operaterLogService.add("添加课程，课程标题：" + courses.getTitle());
        return Result.success(true);
    }

    /**
     * 课程编辑页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Model model, @RequestParam(name = "id", required = true) Long id) {
        model.addAttribute("courseType", CourseType.values());
        model.addAttribute("courseSkills", CourseSkills.values());
        model.addAttribute("coachList", coachService.findAll());
        model.addAttribute("courses", coursesService.find(id));
        return "admin/courses/edit";
    }
    /**
     * 编辑课程信息表单提交处理
     *
     * @param courses
     * @return
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> edit(Courses courses) {
        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(courses);
        if (validate.getCode() != CodeMsg.SUCCESS.getCode()) {
            return Result.error(validate);
        }

        if (courses.getId() == null || courses.getId().longValue() <= 0) {
            return Result.error(CodeMsg.ADMIN_COURSE_EXIST_ERROR);
        }
        //到这说明一切符合条件，进行数据库保存
        Courses findById = coursesService.find(courses.getId());
        //讲提交的课程信息指定字段复制到已存在的user对象中,该方法会覆盖新字段内容
        BeanUtils.copyProperties(courses, findById, "id", "createTime", "updateTime");
        if (coursesService.save(findById) == null) {
            return Result.error(CodeMsg.ADMIN_COURSE_EDIT_ERROR);
        }
        operaterLogService.add("编辑课程，课程标题：" + courses.getTitle());
        return Result.success(true);
    }

   /**
     * 删除课程
     * @param id
     * @return
     */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
		try {
			coursesService.delete(id);
		} catch (Exception e) {
			return Result.error(CodeMsg.ADMIN_COURSE_DELETE_ERROR);
		}
		operaterLogService.add("删除课程，课程ID：" + id);
		return Result.success(true);
	}
}
