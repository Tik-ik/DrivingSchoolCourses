<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>${siteName!""}|前台用户管理-编辑前台用户</title>
<#include "../common/header.ftl"/>

</head>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">

            <!-- logo -->
            <div id="logo" class="sidebar-header">
                <a href="index.html"><img src="/admin/images/logo-sidebar.png" title="${siteName!""}"
                                          alt="${siteName!""}"/></a>
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
                            <div class="card-header"><h4>修改前台信息</h4></div>
                            <div class="card-body">
                                <form id="account-edit-form" method="post" class="row">

                                    <input type="hidden" name="id" value="${account.id}">
                                    <div class="form-group col-md-12">
                                        <label>前台用户头像</label>
                                        <div class="form-controls">
                                            <ul class="list-inline clearfix lyear-uploads-pic" readonly>
                                                <li class="col-xs-4 col-sm-3 col-md-2">
                                                    <figure>
                                                        <#if account.headPic??>
                                                            <#if account.headPic?length gt 0>
                                                                <img src="/photo/view?filename=${account.headPic}" id="show-picture-img">
                                                            <#else>
                                                                <img src="/admin/images/default-head.jpg" id="show-picture-img" alt="默认头像">
                                                            </#if>
                                                        <#else>
                                                            <img src="/admin/images/default-head.jpg" id="show-picture-img" alt="默认头像">
                                                        </#if>
                                                    </figure>
                                                </li>
                                                <input type="hidden" name="headPic" id="headPic">
                                                <input type="file" id="select-file" style="display:none;"
                                                       onchange="upload('show-picture-img','headPic')">
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">前台用户名</span>
                                        <input type="text" class="form-control required" id="username" name="username"
                                               value="${account.username}" readonly placeholder="" tips="请填写前台用户名"/>
                                    </div>

                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">前台用户登录密码</span>
                                        <input type="text" class="form-control required" id="password" name="password"
                                               value="${account.password}" readonly placeholder="" tips="请填写前台用户登录密码"/>
                                    </div>

                                    <div class="input-group"
                                         style="margin-top:15px;margin-bottom:15px;padding-left:25px;">
                                        状态：
                                        <label class="lyear-radio radio-inline radio-primary" style="margin-left:30px;">
                                            <input type="radio" name="status" value="1" <#if account.status == 1>
                                                   checked </#if>>
                                            <span>可用</span>
                                            <label class="lyear-radio radio-inline radio-primary">
                                                <input type="radio" name="status" value="0" <#if account.status == 0>
                                                       checked </#if>>
                                                <span>不可用</span>
                                            </label>
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">前台用户手机号</span>
                                        <input type="text" class="form-control required" id="mobile" name="mobile"
                                               value="${account.mobile}" readonly placeholder="" tips="请填写前台用户手机号"/>
                                    </div>


                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">前台用户邮箱</span>
                                        <input type="text" class="form-control required" id="email" name="email"
                                               value="${account.email}" readonly placeholder="" tips="请填写前台用户邮箱"/>
                                    </div>

                                    <div class="form-group col-md-12">
                                        <button type="button" class="btn btn-primary ajax-post"
                                                id="add-form-submit-btn">确 定
                                        </button>
                                        <button type="button" class="btn btn-default"
                                                onclick="javascript:history.back(-1);return false;">返 回
                                        </button>
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
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<#--富文本编辑器-->
<link href="/admin/js/kindeditor/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/admin/js/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        //提交按钮监听事件
        $("#add-form-submit-btn").click(function () {
            if (!checkForm("account-edit-form")) {
                return;
            }
            var data = $("#account-edit-form").serialize();
            $.ajax({
                url: 'edit',
                type: 'POST',
                data: data,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        showSuccessMsg('编辑成功!', function () {
                            window.location.href = 'list';
                        })
                    } else {
                        showErrorMsg(data.msg);
                    }
                },
                error: function (data) {
                    alert('网络错误!');
                }
            });
        });
        //监听上传图片按钮
        $("#add-pic-btn").click(function () {
            $("#select-file").click();
        });
    });
</script>
</body>
</html>