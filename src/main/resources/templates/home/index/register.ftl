<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>注册</title>
		<link rel="stylesheet" href="/home/layui/css/layui.css">
		<link rel="stylesheet" href="/home/css/register.css">
	</head>

	<body style="background-image: url(/home/img/login-bg2.jpg);">
		<div class="layui-main user">
			<div class="layui-clear main">
				<fieldset class="layui-elem-field layui-field-title">
					<legend class="text-white" style="margin: 0px;">注册</legend>
				</fieldset>
				<form class="layui-form layui-form-pane" id="account-register-form">
					<div class="layui-form">
						<div class="layui-form-item">
							<input class="layui-input" id="username" name="username" placeholder="请输入姓名"
							 type="text" maxlength="11"  autofocus="autofocus" autocomplete="off">
						</div>
						<div class="layui-form-item">
							<input class="layui-input" id="mobile" name="mobile" placeholder="请输入手机号" type="text"
								   maxlength="11"  autofocus="autofocus" autocomplete="off">
						</div>
						<div class="layui-form-item">
							<input class="layui-input" id="password" name="password" placeholder="请输入密码"
								   type="password" maxlength="20"  autocomplete="off">
						</div>
						<div class="layui-form-item">
							<input class="layui-input" placeholder="请再次输入密码"
								   type="password" id="verifyPassword" name="verifyPassword"
								   maxlength="20"  autocomplete="off">
						</div>

						<div class="layui-form-item">
							<input class="layui-input" placeholder="请输入邮箱" type="text"
								   id="email" name="email"
								   lay-verify="required" autocomplete="off">
						</div>
						<div class="layui-form-item form_code">
							<input id="code" class="layui-input" name="code"
								   placeholder="请输入图片验证码" type="text" maxlength="4">
							<div class="code">
                                <img src="/cpacha/generate_cpacha?vl=4&fs=25&w=128&h=40&method=home_register_img_code" class="pull-right"
                                     id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'&d='+Math.random();"
									 title="点击刷新" alt="captcha" width="120" height="38">
							</div>
						</div>
						<div class="layui-form-item" style="float: left;margin-left: -10px;">
							<input lay-filter="agreen-checkbox" title="我同意《注册协议》" type="checkbox" lay-skin="primary" checked>
						</div>
						<div class="layui-form-item">
							<input id="add-form-submit-btn" type="button"
									class="login_btn layui-btn layui-btn-radius layui-btn-normal" value="立即注册"/>
						</div>
						<div>
							<small class="text-white">已经有账户了？</small>
							<a href="login">点此登录</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>

	<script type="text/javascript" src="/home/js/jquery.min.js"></script>
	<script type="text/javascript" src="/home/layui/layui.all.js"></script>
	<script type="text/javascript" src="/home/js/register.js"></script>
	<script>
		$(function()
		{
            $("#add-form-submit-btn").click(function(){
                var phone = /^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
                var mobile=$("#mobile").val();
                if(!phone.test(mobile)){
                    layer.msg("手机号不正确或你的手机号不是13、15、18开头",{icon:5});
                    return;
                }

                var email = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
                var emailValue = $("#email").val();

                if(!email.test(emailValue)) {
                    layer.msg("邮箱格式不正确",{icon:5});
                    return ;
                }

                var username = $("#username").val();
                var password = $("#password").val();
                var verifyPassword = $("#verifyPassword").val();
                var code = $("#code").val();

                if(username.trim().length == 0)
				{
                    layer.msg("请输入用户名!",{icon:5});
                    return;
				}

				if(password.trim().length == 0)
				{
                    layer.msg("请输入密码!",{icon:5});
                    return;
				}

				if(verifyPassword.trim().length == 0)
				{
                    layer.msg("请确认密码!",{icon:5});
                    return;
				}

                if(code.trim().length == 0)
                {
                    layer.msg("请输入验证码!",{icon:5});
                    return;
                }

                if(password != verifyPassword)
				{
                    layer.msg("两次密码不一致!",{icon:5});
                    return;
				}

                var data=$("#account-register-form").serialize();
                $.ajax({
                    url:'register',
                    type:'POST',
                    data:data,
                    dataType:'json',
                    success:function(data){
                        if(data.code == 0)
                        {
                            layer.msg("注册成功!", {icon: 1});
                            location.href = "login";
                        }
                        else
                        {
                            layer.msg("注册失败"+ data.msg,{icon:5});
                        }
                    },
                    error:function(data){
                        layer.msg('网络错误!');
                    }
                });
            });
		});
	</script>
</html>