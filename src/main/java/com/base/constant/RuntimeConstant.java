package com.base.constant;

import java.util.Arrays;
import java.util.List;

/**
 * 系统运行时的常量
 *
 * @author Administrator
 */
public class RuntimeConstant {

    //登录拦截器无需拦截的url
    public static List<String> loginExcludePathPatterns = Arrays.asList(
            "/home/appointment/list2",
            "/system/login",
            "/system/auth_order",
            "/admin/css/**",
            "/admin/fonts/**",
            "/admin/js/**",
            "/admin/images/**",
            "/error",
            "/cpacha/generate_cpacha",
            "/admin/layui/**",
            "/photo/**",
            "/photo/view/**",
            "/upload/upload_video",
            "/download/download_video",
            "/upload/uploadFile",
            "/admin/clazz_schedule/gainCourse",
            "/home/**",
            "/admin/kindedit/**",
            "/home_upload_photo",
            "/download/download_video",
            "/upload/home_upload_photo",
            "/download/**"
    );
    //权限拦截器无需拦截的url
    public static List<String> authorityExcludePathPatterns = Arrays.asList(
            "/home/appointment/list2",
            "/system/login",
            "/system/index",
            "/system/auth_order",
            "/system/no_right",
            "/admin/css/**",
            "/admin/fonts/**",
            "/admin/js/**",
            "/admin/images/**",
            "/error",
            "/cpacha/generate_cpacha",
            "/system/logout",
            "/system/update_userinfo",
            "/system/update_pwd",
            "/admin/layui/**",
            "/upload/uploadFile",
            "/admin/layui/**",
            "/photo/view/**",
            "/home/**",
            "/photo/view/**",
            "/upload/upload_video",
            "/download/download_video",
            "/admin/clazz_schedule/gainCourse",
            "/admin/kindedit/**",
            "/home_upload_photo",
            "/download/download_video",
            "/upload/home_upload_photo",
            "/download/**"
    );
    //前台登录拦截器无需拦截的url
    public static List<String> homeLoginExcludePathPatterns = Arrays.asList(
            "/home/appointment/list2",
            "/system/**",
            "/admin/**",
            "/error",
            "/cpacha/generate_cpacha",
            "/photo/**",
            "/upload/upload_photo",
            "/download/**",
            "/home/index/**",
            "/home/course/**",
            "/home/help/**",
            "/home/images/**",
            "/home/css/**",
            "/home/js/**",
            "/home/img/**",
            "/home/layui/**",
            "/home/leave_word/**",
            "/home/layer/**",
            "/photo/view/**",
            "/home/fonts/**",
            "/home/after_sale/index",
            "/home/company/**",
            "/home/news/**",
            "/home/product/**",
            "/home/picture/**",
            "/home/leave_word/about",
            "/photo/view/**",
            "/home/user/edit",
            "/database_bak/**",
            "/upload/upload_video",
            "/download/download_video",
            "/upload/uploadFile",
            "/admin/clazz_schedule/gainCourse",
            "/home_upload_photo",
            "/download/download_video",
            "/upload/home_upload_photo",
            "/download/**"
    );

}
