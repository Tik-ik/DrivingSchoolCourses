<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>${siteName!""}|新闻管理-添加新闻</title>
<#include "../common/header.ftl"/>
    <link href="/admin/js/kindeditor/themes/default/default.css" type="text/css" rel="stylesheet">
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
                            <div class="card-header"><h4>添加新闻</h4></div>
                            <div class="card-body">

                                <form action="add" id="news-add-form" method="post" class="row">

                                    <div class="form-group col-md-12">
                                        <label>新闻封面上传</label>
                                        <div class="form-controls">
                                            <ul class="list-inline clearfix lyear-uploads-pic">
                                                <li class="col-xs-4 col-sm-3 col-md-2">
                                                    <figure>
                                                        <img src="/admin/images/default-head.jpg" id="show-picture-img" alt="默认头像">
                                                    </figure>
                                                </li>
                                                <input type="hidden" name="pic" id="pic">
                                                <input type="file" id="select-file" style="display:none;" onchange="upload('show-picture-img','pic')">
                                                <li class="col-xs-4 col-sm-3 col-md-2">
                                                    <a class="pic-add" id="add-pic-btn" href="javascript:void(0)" title="点击上传"></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">所属标签分类</span>
                                        <select name="label.id" class="form-control" id="label">
                                        <#list labels as label>
                                            <option value="${label.id}">${label.name}</option>
                                        </#list>
                                        </select>
                                    </div>

                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">新闻标题</span>
                                        <input type="text" class="form-control required" id="title" name="title" value=""
                                               placeholder="请输入新闻标题" tips="请填写新闻标题"/>
                                    </div>

                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">新闻内容</span>
                                        <textarea style="width:700px;height:350px" id="content" name="content"></textarea>
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
<script type="text/javascript" charset="utf-8" src="/admin/js/kindeditor/kindeditor-all-min.js"></script>

<script type="text/javascript">



    $(document).ready(function () {


        KindEditor.ready(function(K) {
            K.create('#content', {
                uploadJson : '/admin/kindedit/uploadFile',
                filePostName: 'imgFile',
                allowFileManager : true,
                allowImageUpload:true,
                afterBlur: function(){this.sync();},
                allowImageRemote: false,
                afterUpload : function(url, data, name) { //上传文件后执行的回调函数，必须为3个参数
                    if(name=="image" || name=="multiimage"){ //单个和批量上传图片时
                        var img = new Image();
                        img.src = url;
                        img.onload = function(){ }
                    }
                }
            });
        });

        //提交按钮监听事件
        $("#add-form-submit-btn").click(function () {
            if (!checkForm("news-add-form")) {
                return;
            }
            var datas = $("#news-add-form").serialize();
            $.ajax({
                url: 'add',
                type: 'POST',
                data: datas,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        showSuccessMsg('新闻添加成功!', function () {
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