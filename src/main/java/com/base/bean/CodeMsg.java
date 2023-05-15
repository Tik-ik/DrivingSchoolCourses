package com.base.bean;

/**
 * 错误码统一处理类，所有的错误码统一定义在这里
 * @author Administrator
 *
 */
public class CodeMsg {

    private int code;//错误码
	
	private String msg;//错误信息
	
	/**
	 * 构造函数私有化即单例模式
	 * @param code
	 * @param msg
	 */
	private CodeMsg(int code,String msg){
		this.code = code;
		this.msg = msg;
	}

	public int getCode() {
		return code;
	}



	public void setCode(int code) {
		this.code = code;
	}



	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}

	//通用错误码定义
	//处理成功消息码
	public static CodeMsg SUCCESS = new CodeMsg(0, "success");
	//非法数据错误码
	public static CodeMsg DATA_ERROR = new CodeMsg(-1, "非法数据！");
	public static CodeMsg CPACHA_EMPTY = new CodeMsg(-2, "验证码不能为空！");
	public static CodeMsg VALIDATE_ENTITY_ERROR = new CodeMsg(-3, "");
	public static CodeMsg SESSION_EXPIRED = new CodeMsg(-4, "会话已失效，请刷新页面重试！");
	public static CodeMsg CPACHA_ERROR = new CodeMsg(-5, "验证码错误！");
	public static CodeMsg USER_SESSION_EXPIRED = new CodeMsg(-6, "还未登录或会话失效，请重新登录！");
	public static CodeMsg UPLOAD_PHOTO_SUFFIX_ERROR = new CodeMsg(-7, "图片格式不正确！");
	public static CodeMsg UPLOAD_PHOTO_ERROR = new CodeMsg(-8, "图片上传错误！");
	public static CodeMsg UPLOAD_VIDEO_SUFFIX_ERROR = new CodeMsg(-9, "视频格式不正确！");

	
	
	//后台管理类错误码
	//用户管理类错误

	public static CodeMsg ADMIN_NO_RIGHT = new CodeMsg(-2002, "您所属的角色没有该权限！");
	
	//登录类错误码
	public static CodeMsg ADMIN_USERNAME_NO_EXIST = new CodeMsg(-3000, "该用户名不存在！");
	public static CodeMsg ADMIN_PASSWORD_ERROR = new CodeMsg(-3001, "密码错误！");
	public static CodeMsg ADMIN_USER_UNABLE = new CodeMsg(-3002, "该用户已被冻结，请联系管理员！");
	public static CodeMsg ADMIN_USER_ROLE_UNABLE = new CodeMsg(-3003, "该用户所属角色状态不可用，请联系管理员！");
	public static CodeMsg ADMIN_USER_ROLE_AUTHORITES_EMPTY = new CodeMsg(-3004, "该用户所属角色无可用权限，请联系管理员！");
	
	//后台菜单管理类错误码
	public static CodeMsg ADMIN_MENU_ADD_ERROR = new CodeMsg(-4000, "菜单添加失败，请联系管理员！");
	public static CodeMsg ADMIN_MENU_ID_EMPTY = new CodeMsg(-4002, "菜单ID不能为空！");
	public static CodeMsg ADMIN_MENU_ID_ERROR = new CodeMsg(-4003, "菜单ID错误！");
	public static CodeMsg ADMIN_MENU_DELETE_ERROR = new CodeMsg(-4004, "改菜单下有子菜单，不允许删除！");
	//后台角色管理类错误码
	public static CodeMsg ADMIN_ROLE_ADD_ERROR = new CodeMsg(-5000, "角色添加失败，请联系管理员！");
	public static CodeMsg ADMIN_ROLE_NO_EXIST = new CodeMsg(-5001, "该角色不存在！");
	public static CodeMsg ADMIN_ROLE_EDIT_ERROR = new CodeMsg(-5002, "角色编辑失败，请联系管理员！");
	public static CodeMsg ADMIN_ROLE_DELETE_ERROR = new CodeMsg(-5003, "该角色下存在用户信息，不可删除！");
	//后台用户管理类错误码
	public static CodeMsg ADMIN_USER_ROLE_EMPTY = new CodeMsg(-6000, "请选择用户所属角色！");
	public static CodeMsg ADMIN_USERNAME_EXIST = new CodeMsg(-6001, "该用户名已存在，请换一个试试！");
	public static CodeMsg ADMIN_USE_ADD_ERROR = new CodeMsg(-6002, "用户添加失败，请联系管理员！");
	public static CodeMsg ADMIN_USE_NO_EXIST = new CodeMsg(-6003, "用户不存在！");
	public static CodeMsg ADMIN_USE_EDIT_ERROR = new CodeMsg(-6004, "用户编辑失败，请联系管理员！");
	public static CodeMsg ADMIN_USE_DELETE_ERROR = new CodeMsg(-6005, "该用户存在关联数据，不允许删除！");
	
	//后台用户修改密码类错误码
	public static CodeMsg ADMIN_USER_UPDATE_PWD_ERROR = new CodeMsg(-7000, "旧密码错误！");
	public static CodeMsg ADMIN_USER_UPDATE_PWD_EMPTY = new CodeMsg(-7001, "新密码不能为空！");
	

	public static CodeMsg ADMIN_COURSE_PRICE_ERROR=new CodeMsg(-9000,"课程价格不能小于0");
	public static CodeMsg ADMIN_COURSE_ADD_ERROR=new CodeMsg(-9001,"课程添加失败！");
	public static CodeMsg ADMIN_COURSE_EDIT_ERROR=new CodeMsg(-9002,"课程编辑失败！");
	public static CodeMsg ADMIN_COURSE_EXIST_ERROR = new CodeMsg(-9003, "课程不存在！");
	public static CodeMsg ADMIN_COURSE_DELETE_ERROR = new CodeMsg(-9004, "该课程存在关联数据，不允许删除！");

    /**
     * @Author zhong
     */
	//教练类型
	public static CodeMsg ADMIN_COACH_TYPE_DELETE_ERROR = new CodeMsg(-30000, "教练类型删除失败");
	public static CodeMsg ADMIN_COACH_TYPE_ADD_ERROR = new CodeMsg(-30001, "教练类型添加失败");
	public static CodeMsg ADMIN_COACH_TYPE_EDIT_ERROR = new CodeMsg(-30002, "教练类型编辑失败");

	//教练信息
	public static CodeMsg ADMIN_COACH_DELETE_ERROR = new CodeMsg(-31000, "教练删除失败");
	public static CodeMsg ADMIN_COACH_ADD_ERROR = new CodeMsg(-31001,"教练添加失败");
	public static CodeMsg ADMIN_COACH_SELECT_ADD_ERROR = new CodeMsg(-31002,"教练添加失败请选择下拉数据");
	public static CodeMsg ADMIN_COACH_INTRODUCE_ADD_ERROR = new CodeMsg(-31003,"教练自我介绍不能小于60字并且不能超过1500字");
	public static CodeMsg ADMIN_COACH_EDIT_ERROR = new CodeMsg(-31004,"教练编辑失败");

	//推荐信息
	public static CodeMsg ADMIN_RECOMMEND_DELETE_ERROR = new CodeMsg(-32000,"删除推荐失败!");
	public static CodeMsg ADMIN_RECOMMEND_ADD_ERROR = new CodeMsg(-32001,"添加推荐失败!");
	public static CodeMsg ADMIN_RECOMMEND_EDIT_ERROR = new CodeMsg(-32002,"编辑推荐失败!");
	public static CodeMsg ADMIN_ABOUT_INFO_ADD_ERROR = new CodeMsg(-33000, "添加关于信息失败");
	public static CodeMsg ADMIN_ABOUT_INFO_DELETE_ERROR = new CodeMsg(-33001,"删除关于信息失败");

	//管理员管理普通用户
	public static CodeMsg ADMIN_ACCOUNT_NO_EXIST = new CodeMsg(-34000, "用户编号不存在!");
	public static CodeMsg ADMIN_ACCOUNT_EDIT_ERROR = new CodeMsg(-34001, "用户编辑失败!");
	public static CodeMsg ADMIN_ACCOUNT_DELETE_ERROR = new CodeMsg(-34002,"用户删除失败!");

	//管理员删除成就
	public static CodeMsg ADMIN_ACHIEVEMENT_DELETE_ERROR = new CodeMsg(-35000, "成就删除失败");
	public static CodeMsg ADMIN_ACHIEVEMENT_ADD_ERROR = new CodeMsg(-35001,"成就添加失败");
	public static CodeMsg ADMIN_ACHIEVEMENT_EDIT_ERROR = new CodeMsg(-35002,"成就编辑失败");

	//普通用户注册
	public static CodeMsg HOME_REGISTER_PASSWORD_ERROR = new CodeMsg(-36000,"密码不一致");
	public static CodeMsg HOME_REGISTER_MOBILE_EMPTY_ERROR = new CodeMsg(-36001,"该手机号已经注册了");
	public static CodeMsg HOME_REGISTER_ERROR = new CodeMsg(-360002,"注册失败");

	//普通用户的修改密码
	public static CodeMsg HOME_USER_EDIT_ERROR = new CodeMsg(-37000,"密码修改失败");
	public static CodeMsg HOME_USER_EDIT_PASSWORD_ERROR = new CodeMsg(-37001,"密码不一致");
	public static CodeMsg HOME_USER_EDIT_PHONE_ERROR = new CodeMsg(-37002,"没有匹配的手机号请注册");

	//普通用户修改
	public static CodeMsg HOME_ACCOUNT_EDIT_ERROR = new CodeMsg(-38000, "用户修改信息失败");
	public static CodeMsg HOME_ACCOUNT_PASSWORD_ERROR = new CodeMsg(-38001,"与旧密码不匹配");
	public static CodeMsg HOME_ACCOUNT_PASSWORD_ERROR_2 = new CodeMsg(-38002,"密码修改失败");
	public static CodeMsg HOME_ACCOUNT_EDIT_ERROR_2 = new CodeMsg(-38003, "用户修改头像失败");
	public static CodeMsg HOME_ACCOUNT_STATUS_ERROR = new CodeMsg(-38004,"用户被拉黑");
	public static CodeMsg HOME_USER_EDIT_EMAIL_ERROR = new CodeMsg(-38005,"用户邮箱不匹配");
	public static CodeMsg HOME_ACCOUNT_ADD_ERROR = new CodeMsg(-39000,"手机号不正确或你的手机号不是13、15、18开头");
	//图库
	public static CodeMsg ADMIN_PICTURE_DELETE = new CodeMsg(-40000,"图片删除失败");
	public static CodeMsg ADMIN_PICTURE_ADD_ERROR = new CodeMsg(-400001,"添加失败");

	//评分
	public static CodeMsg HOME_RATE_ERROR = new CodeMsg(-41000,"评分失败");
	public static CodeMsg HOME_RATE_ADD_ERROR = new CodeMsg(-41001,"上课之后才可以评分");

	//预约
	public static CodeMsg HOME_APPOINTMENT_DELETE_ERROR = new CodeMsg(-50000, "预约取消失败");

	public static CodeMsg HOME_APPOINTMENT_ADD_ERROR = new CodeMsg(-60000,"不能预约之前的日期");

	//手机号和邮箱统一处理
	public static CodeMsg ADMIN_PHONE_FORRMAT_ERROR = new CodeMsg(-80000,"手机号格式错误");
	public static CodeMsg ADMIN_EAMIL_FORRMAT_ERROR = new CodeMsg(-80001,"邮箱格式错误");
	public static CodeMsg HOME_LOGIN_MOBILE_ERROR = new CodeMsg(-80002,"请检查手机号");
	public static CodeMsg HOME_LOGIN_PASSWORD_ERROR = new CodeMsg(-80003, "请检查密码");

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	//后台分类标签管理类错误码
	public static CodeMsg ADMIN_LABELNAME_EXIST = new CodeMsg(-20001, "该分类标签名已存在，请换一个试试！");
	public static CodeMsg ADMIN_LABEL_ADD_ERROR = new CodeMsg(-20002, "分类标签添加失败，请联系管理员！");
	public static CodeMsg ADMIN_LABEL_NO_EXIST = new CodeMsg(-20003, "分类标签不存在！");
	public static CodeMsg ADMIN_LABEL_EDIT_ERROR = new CodeMsg(-20004, "分类标签编辑失败，请联系管理员！");
	public static CodeMsg ADMIN_LABEL_DELETE_ERROR = new CodeMsg(-20005, "该分类标签存在关联数据，不允许删除！");

	//后台新闻管理类错误码
	public static CodeMsg ADMIN_NEWS_LABEL_EMPTY = new CodeMsg(-6000, "请选择新闻所属标签！");
	public static CodeMsg ADMIN_NEWS_ADD_ERROR = new CodeMsg(-21002, "新闻添加失败，请联系管理员！");
	public static CodeMsg ADMIN_NEWS_NO_EXIST = new CodeMsg(-21003, "新闻不存在！");
	public static CodeMsg ADMIN_NEWS_EDIT_ERROR = new CodeMsg(-21004, "新闻编辑失败，请联系管理员！");
	public static CodeMsg ADMIN_NEWS_DELETE_ERROR = new CodeMsg(-21005, "该新闻存在关联数据，不允许删除！");

	public static CodeMsg ADMIN_COMMENTS_DELETE_ERROR = new CodeMsg(-23000, "该评论存在关联数据，不允许删除！");

	//反馈留言类错误码
	public static CodeMsg ADMIN_LEAVEWORD_ADD_ERROR = new CodeMsg(-21002, "信息发送失败！");
	public static CodeMsg ADMIN_LEAVEWORD_DELETE_ERROR = new CodeMsg(-22000, "反馈留言删除失败！");

	//课程表错误码
	public static CodeMsg ADMIN_SCHEDULE_DATE_ERROR=new CodeMsg(-24000,"开始日期不能大于结束日期");
	public static CodeMsg ADMIN_SCHEDULE_DATE_TIME_ERROR=new CodeMsg(-24001,"开始时间不能大于结束时间");
	public static CodeMsg ADMIN_SCHEDULE_SLOT_ERROR=new CodeMsg(-24002,"时长要大于0！");
	public static CodeMsg ADMIN_SCHEDULE_ADD_ERROR=new CodeMsg(-24003,"课程表添加失败");
	public static CodeMsg ADMIN_SCHEDULE_EDIT_ERROR=new CodeMsg(-24004,"课程表编辑失败");
	public static CodeMsg ADMIN_SCHEDULE_COURSE_EXIST_ERROR=new CodeMsg(-24006,"该课程已经有课程表！");
	public static CodeMsg ADMIN_SCHEDULE_DIFFDAY_ERROR=new CodeMsg(-24007,"只能添加七天课程");

	//预约错误码
	public static CodeMsg ADMIN_APPOINTMENT_EXIST_ERROR=new CodeMsg(-25000,"你已经预约过其中的课时不可预约！");
	public static CodeMsg ADMIN_APPOINTMENT_ADD_ERROR=new CodeMsg(-25001,"预约失败,请联系管理员！");
}