<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>登录</title>
		<link rel="stylesheet" href="/home/layui/css/layui.css">
		<link rel="stylesheet" href="/home/css/login.css">
	</head>

	<body>
		<div class="layui-carousel video_mask" id="login_carousel">
			<div carousel-item>
				<div class="carousel_div1"></div>
				<div class="carousel_div2"></div>
				<div class="carousel_div3"></div>
			</div>
        <div class="login layui-anim layui-anim-up">
				<fieldset class="layui-elem-field layui-field-title">
					<legend class="text-white" style="margin: 0px;">登录</legend>
				</fieldset>
				<form class="layui-form" id="account-login-form">
					<div class="layui-form-item">
						<input type="text" id="mobile" name="mobile"
                               maxlength="20" placeholder="请输入手机号" autocomplete="off" autofocus="autofocus" class="layui-input">
					</div>

                    <div class="layui-form-item">
						<input type="password" id="password" name="password"  maxlength="20"
                               placeholder="请输入密码" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-item form_code">
						<input type="text" id="code"  maxlength="4" placeholder="请输入验证码" autocomplete="off" class="layui-input" name="code">
						<div class="code">
                            <img src="/cpacha/generate_cpacha?vl=4&fs=25&w=128&h=40&method=home_login_img_code"
                                 class="pull-right" id="captcha"
                                 style="cursor: pointer;"
                                 onclick="this.src=this.src+'&d='+Math.random();"
                                 title="点击刷新" alt="captcha" width="118" height="38">
                        </div>
					</div>
					<div class="layui-form-item">
                        <input type="button" class="login_btn layui-btn layui-btn-radius layui-btn-normal" id="login-form-btn"
                               value="登录">
					</div>
					<div class="layui-form-item">
                        <input type="button" class="login_btn layui-btn layui-btn-radius layui-btn-normal" value="忘记密码"
                        onclick="openDialog()"/>
					</div>

					<strong class="text-white">还没有账号？ <a href="register" style="color: cornflowerblue;">立即注册&raquo;</a><a href="index" style="color: cornflowerblue;">首页&raquo;</a></strong>
                </form>
				<hr class="layui-bg-gray">
				<div class="layui-footer text-white">
					&copy;2023 软件科技有限公司
				</div>
			</div>
		</div>

        <div class='simple_dlg_define' style='display:none'>
            <div class='pane' style='padding:16px'>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号:</label>
                    <div class="layui-input-block">
                        <input class='layui-input mobile' type='text' placeholder="请输入手机号">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱:</label>
                    <div class="layui-input-block">
                        <input class='layui-input email' type='text' placeholder="请输入邮箱">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码:</label>
                    <div class="layui-input-block">
                        <input class='layui-input password' type='password' placeholder="请输入密码">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码:</label>
                    <div class="layui-input-block">
                        <input class='layui-input password2' type='password' placeholder="请确认密码">
                    </div>
                </div>
            </div>
        </div>

		<script type="text/javascript" src="/home/js/jquery.min.js"></script>
		<script type="text/javascript" src="/home/layui/layui.all.js"></script>
		<script type="text/javascript" src="/home/js/login.js"></script>
	</body>
    <script>
        $(function()
        {
            //登录按钮点击
            $("#login-form-btn").click(function(){

                //手机号验证
                var phone = /^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
                var mobile=$("#mobile").val();
                if(!phone.test(mobile)){
                    layer.msg("手机号不正确或你的手机号不是13、15、18开头!", {icon: 5});
                    return;
                }

                var password = $("#password").val();
                if(password.trim().length == 0)
				{
				    layer.msg("请输入正确的密码!", {icon: 5});
				    return ;
				}

				var code = $("#code").val();
                if(code.trim().length == 0)
				{
                    layer.msg("请输入验证码!", {icon: 5});
                    return ;
				}

                var data=$("#account-login-form").serialize();
                $.ajax({
                    url:'login',
                    type:'POST',
                    data:data,
                    dataType:'json',
                    success:function(data){
                        if(data.code == 0)
						{
                            layer.msg("登录成功!", {icon: 1});
                            location.href = "index";
						}
						else
						{
						    layer.msg("登录失败"+ data.msg,{icon:5});
						}
                    },
                    error:function(data){
                        layer.msg('网络错误!');
                    }
                });
            });

        });

        function openDialog()
        {
            var dlgContent = $('.simple_dlg_define').html(); // 窗口内容

            layer.open({
                type: 1,
                title: '忘记密码',
                area: ['420px', 'auto'],
                content: dlgContent,
                btn:['修改','取消'] ,

                btn1: function(index,layero){
                    var mobile = $('.mobile', layero).val().trim();
                    var password = $('.password', layero).val().trim();
                    var password2 = $('.password2', layero).val().trim();
                    var email = $(".email", layero).val().trim();
                    updatePassword(mobile, password, password2,index, email);

                },
                btn2 : function(index,layero){
                    layer.close(index)
                }
            });

        }

        function updatePassword(mobile, password, password2, dialogIndex, emailValue)
        {
            //手机号验证
            var phone = /^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
            if(!phone.test(mobile)){
                layer.msg("手机号不正确或你的手机号不是13、15、18开头!", {icon: 5});
                return ;
            }

            var email = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
            if(!email.test(emailValue)) {
                layer.msg("邮箱格式不正确",{icon:5});
                return ;
            }

            $.ajax({
                url:'edit',
                type:'POST',
                data:{mobile:mobile,password:password,password2:password2,email:emailValue},
                dataType:'json',
                success:function(data){
                    if(data.code == 0){
                        layer.msg("修改成功");
                        layer.close(dialogIndex);
                    }else{
                        layer.msg(data.msg);
                    }
                },
                error:function(data){
                    layer.msg('网络错误!');
                }
            });
        }
    </script>
</html>