<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|教练管理</title>
<#include "../common/header.ftl"/>

</head>
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">
      
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <img src="/admin/images/logo-sidebar.png" title="${siteName!""}" alt="${siteName!""}" />
      </div>
      <div class="lyear-layout-sidebar-scroll"> 
        <#include "../common/left-menu.ftl"/>
      </div>
    </aside>
    <!--End 左侧导航-->
    
    <#include "../common/header-menu.ftl"/>
    
     <!--页面主要内容-->
    <main class="lyear-layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>编辑教练</h4></div>
              <div class="card-body">
                <form action="add" id="menu-add-form" method="post" class="row">
                    <input type="hidden" id="id" name="id" value="${coach.id}"/>
                    <div class="form-group col-md-12">
                        <label>头像上传</label>
                        <div class="form-controls">
                            <ul class="list-inline clearfix lyear-uploads-pic">
                                <li class="col-xs-4 col-sm-3 col-md-2">
                                    <figure>
                                        <#if coach.headPic??>
                                            <#if coach.headPic?length gt 0>
                                                <img src="/photo/view?filename=${coach.headPic}" id="show-picture-img">
                                            <#else>
                                                <img src="/admin/images/default-head.jpg" id="show-picture-img" alt="默认头像">
                                            </#if>
                                        <#else>
                                            <img src="/admin/images/default-head.jpg" id="show-picture-img" alt="默认头像">
                                        </#if>
                                    </figure>
                                </li>
                                <input type="hidden" name="headPic" id="headPic" value="${coach.headPic}">
                                <input type="file" id="select-file" style="display:none;" onchange="upload('show-picture-img','headPic')">
                                <li class="col-xs-4 col-sm-3 col-md-2">
                                    <a class="pic-add" id="add-pic-btn" href="javascript:void(0)" title="点击上传"></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                      <div class="input-group m-b-10">
                        <span class="input-group-addon">教练名</span>
                        <input type="text" class="form-control required" id="name" name="name"
                               value="${coach.name}" placeholder="请输入教练名"
                               tips="请输入教练名" />
                      </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">个性签名</span>
                        <input type="text" class="form-control required" id="signature" name="signature"
                               value="${coach.signature}" placeholder="请输入个性签名" tips="请输入个性签名" />
                    </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">手机号</span>
                        <input type="text" class="form-control required" id="phone" name="phone"
                               value="${coach.phone}" placeholder="请输入手机号" tips="请输入手机号" />
                    </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">邮箱</span>
                        <input type="text" class="form-control required" id="email" name="email"
                               value="${coach.email}" placeholder="请输入邮箱" tips="请输入邮箱" />
                    </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">类型</span>
                        <select name="coachType.id" class="form-control" id="type">
                            <option value="">请选择上级分类</option>
                            <#if coachTypes??>
                                <#list coachTypes as coachType>
                                    <option value="${coachType.id}"
                                            <#if coach.coachType.id == coachType.id>selected</#if> >${coachType.name}</option>
                                </#list>
                            </#if>
                        </select>
                    </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">个人简介</span>
                        <textarea class="form-control" id="introduce" name="introduce" rows="5" placeholder="请输入个人简介">${coach.introduce}</textarea>
                    </div>
                  <div class="form-group col-md-12">
                    <button type="button" class="btn btn-primary ajax-post" id="add-form-submit-btn">确 定</button>
                    <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                  </div>
                </form>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>
<#include "../common/footer.ftl"/>
<#include "../common/icons.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//图标icon选择后的确认按钮事件
	$("#confirm-icon-btn").click(function(){
		getSelectedIcon();
	});
	//提交按钮监听事件
	$("#add-form-submit-btn").click(function(){
		if(!checkForm("menu-add-form")){
			return;
		}

        var phone = /^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
        var mobile=$("#phone").val();
        if(!phone.test(mobile)){
            showErrorMsg("请输入正确的手机号!");
            return;
        }

        var email = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
        var emailValue = $("#email").val();

        if(!email.test(emailValue)) {
            showErrorMsg("邮箱格式不正确");
            return ;
        }

        var data = $("#menu-add-form").serialize();
		$.ajax({
			url:'edit',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('编辑成功!',function(){
						window.location.href = 'list';
					})
				}else{
					showErrorMsg(data.msg);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
		});

	});


    //监听上传图片按钮
    $("#add-pic-btn").click(function(){
        $("#select-file").click();
    });
});

</script>
</body>
</html>