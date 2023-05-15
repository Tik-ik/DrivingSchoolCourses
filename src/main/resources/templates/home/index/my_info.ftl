<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta charset="UTF-8">
    <meta name="description" content="AuCreative theme tempalte">
    <meta name="author" content="AuCreative">
    <meta name="keywords" content="AuCreative theme template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="/home/layui/css/layui.css"/>

    <style>
        .zr-container {
            width: 690px;
            margin: 15px auto;
        }

        .user-image {
            height: 125px;
            width: 75%;
        }

        .pdding-left-right5 {
            padding: 5px 0px;
        }

        #headPic {
            object-fit: cover;
        }

        .update-dialog {
            display: none;
            line-height: 125px;
            text-align: center;
            background-color: rgba(0, 0, 0, .6);
            position: absolute;
            top: 0px;
            bottom: 0px;
            right: 0px;
            left: 0px;
            color: #FFF;
        }
        
        a
        {
            color: #FFF;
        }
    </style>
		<#include "../common/common.ftl"/>
</head>
<body>
		<#include "../common/header.ftl"/>
<div class="zr-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md4">
            <div class="layui-row" style="text-align: center; position: relative">
						<#if account.headPic??>
                            <#if account.headPic?length gt 0>
								<img id="headPic" src="/photo/view?filename=${account.headPic}" class="user-image"/>
                            <#else>
								<img id="headPic" src="/admin/images/default-head.jpg" class="user-image"/>
                            </#if>
                        <#else>
							<img id="headPic" src="/admin/images/default-head.jpg" class="user-image"/>
                        </#if>

                <div class="update-dialog" id="upload_headPic">
                    上传头像
                </div>
            </div>
        </div>
        <div class="layui-col-md8">
            <div class="layui-row pdding-left-right5">
                <span>用户名:</span>${account.username}
            </div>
            <div class="layui-row pdding-left-right5">
                <span>手机号:</span>${account.mobile}
            </div>
            <div class="layui-row pdding-left-right5">
                <span>邮箱:</span>${account.email}
            </div>
            <div class="layui-row pdding-left-right5">
                <span>性别:</span>
                    <#if account.sex == 0>
                        未知
                    <#elseif account.sex == 1>
                        <i class="layui-icon layui-icon-female" style="color: deepskyblue;"></i>
                    <#else>
                        <i class="layui-icon layui-icon-male" style="color: hotpink"></i>
                    </#if>
            </div>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li  <#if tabIndex == 0>class="layui-this" </#if>>个人信息</li>
                <li  <#if tabIndex == 1>class="layui-this" </#if>>密码修改</li>
                <li  <#if tabIndex == 2>class="layui-this" </#if>>预约管理</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item <#if tabIndex == 0>layui-show</#if>">
                    <div class="layui-row layui-form">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名:</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input username" placeholder="请输入用户名"
                                       value="${account.username}"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机号:</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input mobile" placeholder="请输入手机号"
                                       value="${account.mobile}"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">邮箱:</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input email" placeholder="请输入邮箱"
                                       value="${account.email}"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">性别:</label>
                            <div class="layui-input-block">
                                <select class="layui-input sex">
                                    <option value="1" <#if account.sex == 1>selected</#if>>男</option>
                                    <option value="2" <#if account.sex == 2>selected</#if>>女</option>
                                    <option value="0" <#if account.sex == 0>selected</#if>>未知</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item <#if tabIndex == 1>layui-show</#if>">
                    <div class="layui-row layui-form">
                        <div class="layui-form-item">
                            <label class="layui-form-label">旧密码:</label>
                            <div class="layui-input-block">
                                <input type="password" class="layui-input password" placeholder="请输入旧密码"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">新密码:</label>
                            <div class="layui-input-block">
                                <input type="password" class="layui-input new-password" placeholder="请输入新密码"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">确认:</label>
                            <div class="layui-input-block">
                                <input type="password" class="layui-input ver-password" placeholder="请输入确认密码"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item <#if tabIndex == 2>layui-show</#if>">
                    <div class="layui-row layui-form">
                        <table class="layui-table">
                            <thead>
                            <tr>
                                <th>课程名</th>
                                <th>课程教练</th>
                                <th>上课时间</th>
                                <th>状态</th>
                                <th>取消</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#if appointMentList.content??>
                                 <#list appointMentList.content as appointment>
                                    <tr>
                                        <td>${appointment.courses.title}</td>
                                        <td>${appointment.courses.coach.name}</td>
                                        <td>${appointment.makeDate?string("yyyy-MM-dd")}-${appointment.makeTime}</td>
                                        <#if appointment.status==0>
                                             <td>
                                                 <font color="green">预约成功</font>
                                             </td>
                                        <#else>
                                            <td>
                                                <font color="red">已过期</font>
                                            </td>
                                        </#if>

                                        <td>
                                           <input type="button" class="layui-btn-sm  <#if appointment.status==1>layui-disabled<#else>layui-btn</#if>" value="取消预约"
                                                 <#if appointment.status==1>disabled</#if> onclick="M.remove(${appointment.id})"/>
                                        </td>
                                    </tr>
                                 </#list>
                            <#else>
                                    <tr>
                                        <td>暂无预约课程</td>
                                    </tr>
                            </#if>

                            </tbody>
                        </table>
                        <div id="demo1"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="layui-row" style="text-align: right;" id="form-submit-btn">
        <input type="button" class="layui-btn" value="确定" onclick="M.save()"/>
    </div>
</div>
		<#include "../common/footer.ftl"/>

</body>
<script type="text/javascript" src="/home/js/jquery.min.js"></script>
		<#include "../common/footer-js.ftl"/>
<script type="text/javascript" src="/home/layui/layui.all.js"></script>
<script>
    $(document).ready(function(){
        layui.use('laypage', function(){
            var laypage = layui.laypage;

            //执行一个laypage实例
            laypage.render({
                elem: 'demo1' //注意，这里的 test1 是 ID，不用加 # 号
                ,count: ${appointMentList.total} //数据总数，从服务端得到
                ,limit:${appointMentList.pageSize}
                ,curr:${appointMentList.currentPage}
                ,jump: function(obj, first){
                //首次不执行
                if(!first){
                    M.curr = obj.curr;
                    location.href="myInfo?currentPage="+obj.curr + "&tabIndex=" + M.tableIndex;
                }
            }
            });
        });
    });

    var M = {};
    M.tableIndex = ${tabIndex};
    M.rateValue = 5;
    M.curr = 1;

    layui.use(['form', 'element', 'upload','rate'], function () {
        var form = layui.form;
        var element = layui.element;
        var upload = layui.upload;
        var rate = layui.rate;

        M.rate = function(courseId, title, id)
        {
            var dlgContent = $('.simple_dlg_define').html(); // 窗口内容
            layer.open({
                type: 1,
                title: '评分',
                area: ['420px', 'auto'],
                content: dlgContent,
                btn:['发表','取消'] ,
                btn1: function(index,layero){

                    $.ajax({
                        url: 'account_rate',
                        type: 'POST',
                        data: {courseId:courseId ,rate:M.rateValue, id: id},
                        dataType: 'json',
                        success: function (data) {
                            if (data.code == 0) {
                                location.href="myInfo?currentPage="+M.curr + "&tabIndex=" + M.tableIndex;
                            }
                            else {
                                layer.msg(data.msg, {icon: 5});
                            }
                        },
                        error: function (data) {
                            layer.msg('网络错误!');
                        }
                    });
                },
                btn2 : function(index,layero){
                    layer.close(index)
                },
                success: function(layero, index){
                    $('.course-title', layero).val(title);
                    layui.use('rate',function()
                    {
                        rate.render({
                            elem: $('#test6', layero)
                            ,value: 5
                            ,half: true
                            ,text: true
                            ,setText: function(value){
                                this.span.text(value);
                                M.rateValue = value;
                            }
                        });
                    });
                }
            });
        }

        rate.render({
            elem: '#test6'
            ,value: 1.5
            ,half: true
            ,text: true
            ,setText: function(value){
                this.span.text(value);
            }
        });

        //table的切换
        element.on('tab(docDemoTabBrief)', function (data) {
            M.tableIndex = data.index;
            if (M.tableIndex == 2) {
                $("#form-submit-btn").hide(300);
            }
            else {
                $("#form-submit-btn").show(300);
            }
        });


        upload.render({
            elem: '#upload_headPic',
            url: '/upload/home_upload_photo', //改成您自己的上传接口,
            size: 1024 * 1,
            accept: 'images',
            done: function (res) {
                if (res.code == 0) {
                    $.ajax({
                        url: 'update_headPic',
                        type: 'POST',
                        data: {headPic: res.data},
                        dataType: 'json',
                        success: function (data) {
                            if (data.code == 0) {
                                $("#headPic").attr("src", "/photo/view?filename=" + res.data);
                                layer.msg("上传成功", {icon: 1});
                            }
                            else {
                                layer.msg("修改失败" + data.msg, {icon: 5});
                            }
                        },
                        error: function (data) {
                            layer.msg('网络错误!');
                        }
                    });
                }
            }
        });

        form.render();
    });

    M.save = function () {
        if (M.tableIndex == 0) {
            var username = $(".username").val();
            var mobile = $(".mobile").val();
            var emailValue = $(".email").val();
            var sex = $(".sex").val();

            if (username.trim().length == 0) {
                layer.msg("请输入用户名");
                return;
            }

            var phone = /^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;

            if (!phone.test(mobile)) {
                layer.msg("手机号不正确或你的手机号不是13、15、18开头", {icon: 5});
                return;
            }

            var email = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
            if (!email.test(emailValue)) {
                layer.msg("邮箱格式不正确", {icon: 5});
                return;
            }

            $.ajax({
                url: 'update_info',
                type: 'POST',
                data: {username: username, mobile: mobile, email: emailValue, sex: sex},
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        location.href = "myInfo";
                    }
                    else {
                        layer.msg("修改失败" + data.msg, {icon: 5});
                    }
                },
                error: function (data) {
                    layer.msg('网络错误!');
                }
            });
        }
        else if (M.tableIndex == 1) {
            var password = $(".password").val();
            var new_password = $(".new-password").val();
            var ver_password = $(".ver-password").val();

            if (password.trim().length == 0 || new_password.trim().length == 0 || ver_password.trim().length == 0) {
                layer.msg("请检查密码输入是否为空");
                return;
            }

            if (new_password != ver_password) {
                layer.msg("两次密码输入不一致");
                return;
            }

            $.ajax({
                url: 'update_password',
                type: 'POST',
                data: {password: password, new_password: new_password, ver_password: ver_password},
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        $(".password").val('');
                        $(".new-password").val('');
                        $(".ver-password").val('');
                        layer.msg("修改密码成功", {icon: 1});
                    }
                    else {
                        layer.msg("修改失败" + data.msg, {icon: 5});
                    }
                },
                error: function (data) {
                    layer.msg('网络错误!');
                }
            });
        }
        else {
            layer.msg("请选择tab页签进行操作");
        }
    }

    $("#headPic").mouseover(function () {
        $("#upload_headPic").show(150);
    });

    $("#upload_headPic").mouseout(function () {
        $("#upload_headPic").hide(150);
    });


    M.remove = function (id) {
        layer.confirm('你确定要取消嘛？',
        {
            btn: ['确定','取消'] //按钮
        },
        function(index, layero){
            layer.close(index);
            $.ajax({
                url: 'appointmentDelete',
                type: 'POST',
                data: { id: id},
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        location.href="myInfo?currentPage="+M.curr + "&tabIndex=" + M.tableIndex;
                    }
                    else {
                        layer.msg(data.msg, {icon: 5});
                    }
                },
                error: function (data) {
                    layer.msg('网络错误!');
                }
            });
        },
        function(index, layero){
            layer.close(index);
        });
    }
</script>
</html>
