<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|成就添加</title>
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
              <div class="card-header"><h4>添加成就</h4></div>
              <div class="card-body">
                <form action="add" id="menu-add-form" method="post" class="row">
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">驾校经验</span>
                        <input type="number" class="form-control required" min="0" id="experience" onchange="if(/\D/.test(this.value)){this.value='0';}" name="experience" value="" placeholder="请输入驾校经验"
                               tips="请输入驾校经验" />
                    </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">所获奖项</span>
                        <input type="number" class="form-control required" min="0" id="awards" onchange="if(/\D/.test(this.value)){this.value='0';}" name="awards" value="" placeholder="请输入驾校所获奖项"
                               tips="请输入驾校所获奖项" />
                    </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">备注</span>
                        <textarea class="form-control" id="remark" name="remark" rows="5" placeholder="请输入备注"></textarea>
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
		var data = $("#menu-add-form").serialize();
		$.ajax({
			url:'add',
			type:'POST',
			data:data,
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
});
function getSelectedIcon(){
	$("#icon").val($(".selected-icon").attr('val'));
	$("#icons-panel").modal('hide');
}
</script>
</body>
</html>