package com.base.controller.home;

import com.base.bean.CodeMsg;
import com.base.constant.SessionConstant;
import com.base.entity.common.Courses;
import com.base.entity.home.Account;
import com.base.service.common.CoursesService;
import com.base.bean.PageBean;
import com.base.bean.Result;
import com.base.entity.common.Appointment;
import com.base.entity.common.Rate;
import com.base.service.common.AccountService;
import com.base.service.common.AppointmentService;
import com.base.service.common.RateService;
import com.base.util.SessionUtil;
import com.base.util.ValidateEntityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 首页
 */
@Controller
@RequestMapping("/home/index")
public class HomeAccountController {

    @Autowired
    AccountService accountService;

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    CoursesService coursesService;

    @Autowired
    RateService rateService;


    @Value("${yuanlrc.site.title}")
    private String homeTile;


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model)
    {
        return "home/index/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> login(Account account, @RequestParam("code") String code)
    {
        //手机号验证
        String phone = "^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";
        Pattern r = Pattern.compile(phone);
        Matcher m = r.matcher(account.getMobile());
        if (!m.matches()) {
            return Result.error(CodeMsg.ADMIN_PHONE_FORRMAT_ERROR);
        }

        //验证码验证
        Object attribute = SessionUtil.get(SessionConstant.ACCOUNT_LOGIN_CODE);

        if (attribute == null) {
            return Result.error(CodeMsg.SESSION_EXPIRED);
        }

        if (!code.equalsIgnoreCase(attribute.toString())) {
            return Result.error(CodeMsg.CPACHA_ERROR);
        }
        //根据手机号搜索
        Account findAccount = accountService.findMobile(account.getMobile());
        if (findAccount == null) {
            return Result.error(CodeMsg.HOME_LOGIN_MOBILE_ERROR);
        }

        if(findAccount.getStatus() == Account.ADMIN_USER_STATUS_UNABLE)
        {
            return Result.error(CodeMsg.HOME_ACCOUNT_STATUS_ERROR);
        }

        //密码验证
        if (!account.getPassword().equals(findAccount.getPassword())) {
            return Result.error(CodeMsg.HOME_LOGIN_PASSWORD_ERROR);
        }

        //表示都通过了
        //把用户放到session中
        SessionUtil.set(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY, findAccount);
        SessionUtil.set("homeTile", homeTile);

        //验证码清空
        SessionUtil.set(SessionConstant.ACCOUNT_LOGIN_CODE, null);
        return Result.success(true);
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(Model model)
    {
        SessionUtil.set(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY, null);
        return "redirect:index";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model)
    {
        return "home/index/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> register(Account account, @RequestParam("code")String code, @RequestParam("verifyPassword") String verifyPassword)
    {

        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(account);
        if (validate.getCode() != CodeMsg.SUCCESS.getCode()) {
            return Result.error(validate);
        }
        //手机号验证
        String phone = "^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";
        Pattern r = Pattern.compile(phone);
        Matcher m = r.matcher(account.getMobile());
        if (!m.matches()) {
            return Result.error(CodeMsg.ADMIN_PHONE_FORRMAT_ERROR);
        }
        //邮箱验证
        String pattern = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
        Pattern emailReg = Pattern.compile(pattern);
        Matcher email = emailReg.matcher(account.getEmail());
        if (!email.matches()) {
            return Result.error(CodeMsg.HOME_ACCOUNT_ADD_ERROR);
        }

        //密码验证
        if (!account.getPassword().equals(verifyPassword)) {
            return Result.error(CodeMsg.HOME_REGISTER_PASSWORD_ERROR);
        }

        //验证码验证
        Object attribute = SessionUtil.get(SessionConstant.ACCOUNT_REGISTER_CODE);
        if (attribute == null) {
            return Result.error(CodeMsg.SESSION_EXPIRED);
        }
        if (!code.equalsIgnoreCase(attribute.toString())) {
            return Result.error(CodeMsg.CPACHA_ERROR);
        }
        //表示都通过了
        //如果该手机号已经注册让他去登录
        Account findAccount = accountService.findMobile(account.getMobile());
        if (findAccount != null) {
            return Result.error(CodeMsg.HOME_REGISTER_MOBILE_EMPTY_ERROR);
        }

        Account accountSave = accountService.save(account);
        if (accountSave == null) {
            return Result.error(CodeMsg.HOME_REGISTER_ERROR);
        }
        //验证码清空
        SessionUtil.set(SessionConstant.ACCOUNT_REGISTER_CODE, null);
        return Result.success(true);
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> edit(Account account, String password2)
    {
        if(account == null)
        {
            return Result.error(CodeMsg.HOME_USER_EDIT_ERROR);
        }

        if(account.getPassword() == null || password2 == null)
        {
            return Result.error(CodeMsg.HOME_USER_EDIT_ERROR);
        }

        if(!account.getPassword().equals(password2))
        {
            return Result.error(CodeMsg.HOME_USER_EDIT_PASSWORD_ERROR);
        }

        if(account.getPassword().trim().length() < 4)
        {
            return Result.error(CodeMsg.HOME_USER_EDIT_ERROR);
        }

        //手机号验证
        String phone = "^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";
        Pattern r = Pattern.compile(phone);
        Matcher m = r.matcher(account.getMobile());
        if (!m.matches()) {
            return Result.error(CodeMsg.ADMIN_PHONE_FORRMAT_ERROR);
        }

        //邮箱验证
        String pattern = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
        Pattern emailReg = Pattern.compile(pattern);
        Matcher email = emailReg.matcher(account.getEmail());
        if (!email.matches()) {
            return Result.error(CodeMsg.ADMIN_EAMIL_FORRMAT_ERROR);
        }

        Account findByPhone = accountService.findMobile(account.getMobile());
        if(findByPhone == null)
        {
            return Result.error(CodeMsg.HOME_USER_EDIT_PHONE_ERROR);
        }

        if(!findByPhone.getEmail().equals(account.getEmail()))
        {
            return Result.error(CodeMsg.HOME_USER_EDIT_EMAIL_ERROR);
        }

        if(findByPhone.getPassword().equals(password2))
        {
            return Result.success(true);
        }

        findByPhone.setPassword(password2);
        if(accountService.save(findByPhone) == null)
        {
            return Result.error(CodeMsg.HOME_USER_EDIT_ERROR);
        }

        return Result.success(true);
    }

    @RequestMapping(value = "/myInfo", method = RequestMethod.GET)
    public String myInfo(Model model, Appointment appointment, PageBean<Appointment> pageBean, Integer tabIndex)
    {
        Account account = SessionUtil.getLogindeAccount();
        if(account == null)
        {
            return "redirect:login";
        }
        appointment.setAccount(account);
        PageBean<Appointment> list = appointmentService.findList(appointment, pageBean);
        model.addAttribute("appointMentList",list);
        model.addAttribute("account",account);
        model.addAttribute("tabIndex", tabIndex==null?0:tabIndex);
        return "home/index/my_info";
    }

    @RequestMapping(value = "/update_info", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> update_info(Account account)
    {
        //不修改 只是通过验证一下
        account.setPassword("123456");
        if(account == null)
        {
            return Result.error(CodeMsg.HOME_ACCOUNT_EDIT_ERROR);
        }

        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(account);
        if (validate.getCode() != CodeMsg.SUCCESS.getCode()) {
            return Result.error(validate);
        }

        //手机号验证
        String phone = "^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";
        Pattern r = Pattern.compile(phone);
        Matcher m = r.matcher(account.getMobile());
        if (!m.matches()) {
            return Result.error(CodeMsg.ADMIN_PHONE_FORRMAT_ERROR);
        }
        //邮箱验证
        String pattern = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
        Pattern emailReg = Pattern.compile(pattern);
        Matcher email = emailReg.matcher(account.getEmail());
        if (!email.matches()) {
            return Result.error(CodeMsg.ADMIN_EAMIL_FORRMAT_ERROR);
        }

        Account sessionUser = SessionUtil.getLogindeAccount();
        if(sessionUser == null)
        {
            return Result.error(CodeMsg.USER_SESSION_EXPIRED);
        }

        //如果该手机号已经注册让他去登录
        Account findAccount = accountService.findMobile(account.getMobile());
        if (findAccount != null && findAccount.getId() != sessionUser.getId()) {
            return Result.error(CodeMsg.HOME_REGISTER_MOBILE_EMPTY_ERROR);
        }

        Account findById = accountService.find(sessionUser.getId());
        findById.setMobile(account.getMobile());
        findById.setEmail(account.getEmail());
        findById.setSex(account.getSex());
        findById.setUsername(account.getUsername());

        if(accountService.save(findById) == null)
        {
            return Result.error(CodeMsg.HOME_ACCOUNT_EDIT_ERROR);
        }

        SessionUtil.set(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY, findById);

        return Result.success(true);
    }

    @RequestMapping(value="/update_password", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> update_password(String password, String new_password, String ver_password)
    {
        Account account = SessionUtil.getLogindeAccount();
        if(account == null)
        {
            return Result.error(CodeMsg.USER_SESSION_EXPIRED);
        }

        if(!account.getPassword().equals(password))
        {
            return Result.error(CodeMsg.HOME_ACCOUNT_PASSWORD_ERROR);
        }

        if(new_password.trim().length() == 0)
        {
            return Result.error(CodeMsg.HOME_ACCOUNT_PASSWORD_ERROR_2);
        }

        if(ver_password.trim().length() == 0)
        {
            return Result.error(CodeMsg.HOME_ACCOUNT_PASSWORD_ERROR_2);
        }

        if(!new_password.equals(ver_password))
        {
            return Result.error(CodeMsg.HOME_ACCOUNT_PASSWORD_ERROR_2);
        }

        account.setPassword(new_password);

        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(account);
        if (validate.getCode() != CodeMsg.SUCCESS.getCode()) {
            return Result.error(validate);
        }

        Account findById = accountService.find(account.getId());
        findById.setPassword(account.getPassword());
        if(accountService.save(findById) == null)
        {
            return Result.error(CodeMsg.HOME_ACCOUNT_PASSWORD_ERROR_2);
        }

        SessionUtil.set(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY, findById);

        return Result.success(true);
    }

    @RequestMapping(value="/update_headPic", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> update_headPic(String headPic)
    {
        Account account = SessionUtil.getLogindeAccount();
        if(account == null)
        {
            return Result.error(CodeMsg.USER_SESSION_EXPIRED);
        }

        if(headPic.trim().length() == 0)
        {
            return Result.error(CodeMsg.HOME_ACCOUNT_EDIT_ERROR_2);
        }

        Account findById = accountService.find(account.getId());
        findById.setHeadPic(headPic);
        if(accountService.save(findById) == null)
        {
            return Result.error(CodeMsg.HOME_ACCOUNT_EDIT_ERROR_2);
        }
        SessionUtil.set(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY, findById);
        return Result.success(true);
    }

    @ResponseBody
    @RequestMapping(value = "/account_rate", method = RequestMethod.POST)
    public Result<Boolean> account_rate(@RequestParam("courseId") Long courseId,@RequestParam("rate") Double rate, @RequestParam("id")Long id)
            throws Exception
    {
        Courses courses = coursesService.find(courseId);
        Double value = courses.getRate().doubleValue();
        value = value == 0.0 ? 5.0 : value;
        Long val = Math.round((value + rate) / 2);

        courses.setRate(new BigDecimal(val.doubleValue()));

        if(coursesService.save(courses) == null)
        {
            return Result.error(CodeMsg.HOME_RATE_ERROR);
        }

        Appointment appointment = appointmentService.find(id);
        Date makeDate = appointment.getMakeDate();
        String makeTime = appointment.getMakeTime().split("-")[1];

        SimpleDateFormat sdf_df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat sdf_f = new SimpleDateFormat("yyyy-MM-dd");

        String date = sdf_f.format(makeDate) + " "+ makeTime + ":00";
        System.out.println(date + "**********************************");
        if(!(new Date().compareTo(sdf_df.parse(date)) > 0))
        {
            return Result.error(CodeMsg.HOME_RATE_ADD_ERROR);
        }

        appointment.setIsRate(Appointment.RATE);
        if(appointmentService.save(appointment) == null)
        {
            return Result.error(CodeMsg.HOME_RATE_ERROR);
        }


        Rate courseRate = new Rate();
        Courses courses1 = new Courses();
        courses1.setId(courseId);
        courseRate.setCourses(courses1);
        courseRate.setValue(new BigDecimal(rate));

        if(rateService.save(courseRate) == null)
        {
            return Result.error(CodeMsg.HOME_RATE_ERROR);
        }

        return Result.success(true);
    }

    @ResponseBody
    @RequestMapping(value = "appointmentDelete", method = RequestMethod.POST)
    public Result<Boolean> appointmentDelete(Long id)throws Exception
    {
        Appointment appointment = appointmentService.find(id);
        if(appointment == null)
        {
            return Result.error(CodeMsg.HOME_APPOINTMENT_DELETE_ERROR);
        }



        try
        {
            appointmentService.delete(id);
        }catch (Exception e)
        {
            return Result.error(CodeMsg.HOME_APPOINTMENT_DELETE_ERROR);
        }


        return Result.success(true);
    }
}
