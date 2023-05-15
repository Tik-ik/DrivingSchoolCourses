<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|教练管理</title>
<#include "../common/header.ftl"/>
    <link rel="stylesheet" href="/home/layui/css/layui.css">
    <script type="text/javascript" src="/home/layui/layui.all.js"></script>
    <script type="text/javascript" src="/home/layui/layui.js"></script>
    <style>
        #images img
        {
            width: 270pxpx;
            height: 200px;
            margin: 10px;
        }
    </style>
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
              <div class="card-header"><h4>相册</h4></div>
              <div class="card-body">
                <form action="add" id="menu-add-form" method="post" class="row">
                    <div class="form-group col-md-12">
                        <label>图片上传</label>
                        <div class="form-controls">
                            <div class="layui-upload-drag" id="upload_headPic">
                                <i class="layui-icon"></i>
                                <p>点击上传，或将文件拖拽到此处</p>
                                <div class="layui-hide" id="uploadDemoView">
                                    <hr>
                                    <img src="" alt="上传成功后渲染" style="max-width: 196px">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-md-12" id="images">

                    </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">类型</span>
                        <select name="label.id" class="form-control" id="type">
                            <option value="">请选择分类</option>
                            <#if labels??>
                                <#list labels as label>
                                    <option value="${label.id}">${label.name}</option>
                                </#list>
                            </#if>
                        </select>
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

		var selectVal = $("#type").val();
		if(selectVal == "")
        {
            showErrorMsg("请选择分类");
            return ;
        }

        if(M.images.length == 0)
        {
            showErrorMsg("请选择图片");
            return ;
        }

		$.ajax({
			url:'add',
			type:'POST',
			data:{images:JSON.stringify(M.images),label:selectVal},
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('添加成功!',function(){
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
var M = {}
M.images = [];

layui.use(['upload'],function()
{
    var upload = layui.upload;
    upload.render({
        elem: '#upload_headPic',
        url: '/upload/home_upload_photo', //改成您自己的上传接口,
        size: 1024 * 1,
        accept: 'images',
        multiple:true,
        done: function (res) {
            M.images.push(res.data);
            layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', "/photo/view?filename="+ res.data);
        },
        before:function()
        {
            M.images = [];
        },
        allDone:function()
        {
            //显示图片
            var view = $("#images");
            view.html('');

            for(var item of M.images)
            {
                var image = "<img src='/photo/view?filename="+item+"' />";
                view.append(image);
            }
        }
    });
});
</script>
</body>
</html>