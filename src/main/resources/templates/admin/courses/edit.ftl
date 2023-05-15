<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>${siteName!""}|课程管理-编辑课程</title>
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
                            <div class="card-header"><h4>编辑课程</h4></div>
                            <div class="card-body">
                                <form action="add" id="course-edit-form" method="post" class="row">
                                    <input type="hidden" name="id" value="${courses.id}"/>
                                    <div class="form-group col-md-12">
                                        <label>封面图片上传</label>
                                        <div class="form-controls">
                                            <ul class="list-inline clearfix lyear-uploads-pic">
                                                <li class="col-xs-4 col-sm-3 col-md-2">
                                                     <#if courses.coverPhoto??>
                                                         <#if courses.coverPhoto?length gt 0>
                                                            <figure>
                                                                <img src="/photo/view?filename=${courses.coverPhoto}"
                                                                     id="show-picture-img"
                                                                     alt="默认头像">
                                                            </figure>
                                                         <#else>
                                                             <figure>
                                                                 <img src="/admin/images/default-head.jpg"
                                                                      id="show-picture-img"
                                                                      alt="默认头像">
                                                             </figure>
                                                         </#if>
                                                     <#else>
                                                          <figure>
                                                              <img src="/admin/images/default-head.jpg"
                                                                   id="show-picture-img"
                                                                   alt="默认头像">
                                                          </figure>
                                                     </#if>
                                                </li>
                                                <#if courses.coverPhoto??>
                                                    <input type="hidden" name="coverPhoto" id="edit-headPic" value="${courses.coverPhoto}">
                                                <#else>
                                                     <input type="hidden" name="coverPhoto" id="edit-headPic" >
                                                </#if>
                                                <input type="file" id="select-file" style="display:none;"
                                                       onchange="upload('show-picture-img','edit-headPic')">
                                                <li class="col-xs-4 col-sm-3 col-md-2">
                                                    <a class="pic-add" id="add-pic-btn" href="javascript:void(0)"
                                                       title="点击上传"></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label>预告视频</label>
                                        <div class="form-controls">
                                            <ul class="list-inline clearfix lyear-uploads-pic">
                                                <li class="col-xs-4 col-sm-3 col-md-2" style="display:none;">
                                                    <#if courses.video?length gt 0>
                                                        <#if courses.video??>
                                                           <figure>
                                                               <video src="/download/download_video?filename=${courses.video}" id="preview-video" width="160" height="160"
                                                                      controls="controls">
                                                                   Your browser does not support the video tag.
                                                               </video>
                                                           </figure>
                                                        </#if>

                                                    <#else>
                                                           <figure>
                                                               <video src="" id="preview-video" width="160" height="160"
                                                                      controls="controls">
                                                                   Your browser does not support the video tag.
                                                               </video>
                                                           </figure>
                                                    </#if>
                                                </li>
                                                <input type="hidden" name="video" id="video" value="${courses.video}">
                                                <input type="file" id="select-video-file" style="display:none;"
                                                       onchange="uploadVideo()">
                                                <li class="col-xs-4 col-sm-3 col-md-2">
                                                    <a class="pic-add" id="add-video-btn" href="javascript:void(0)"
                                                       title="点击上传"></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">课程标题</span>
                                        <input type="text" class="form-control required" id="title" name="title"
                                               value="${courses.title!""}" placeholder="请输入课程标题" tips="请填写课程标题" />
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">课程内容</span>
                                        <textarea style="width:700px;height:250px" id="edit-content"
                                                  name="content" >${courses.content}</textarea>
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">所属教练</span>
                                        <select name="coach.id" class="form-control" id="edit-coach">
                                            <#list coachList as coach>
                                                <option value="${coach.id}" <#if coach.id==courses.coach.id>selected</#if>>
                                                    ${coach.name}
                                                </option>
                                            </#list>
                                        </select>
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">课程类型</span>
                                        <#list courseType as type>
                                    <label style="margin-left:10px;"
                                           class="lyear-checkbox checkbox-inline checkbox-primary">
                                        <input type="checkbox" class="course-type"
                                               value="${type}" />
                                        <span>${type.getName()}</span>
                                    </label>
                                        </#list>
                                        <input type="hidden" name="type" id="course-type" class="form-control required"
                                               tips="请选择课程类型" value="${courses.type}">
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">课程技能</span>
                                        <#list courseSkills as skills>
                                    <label style="margin-left:10px;"
                                           class="lyear-checkbox checkbox-inline checkbox-primary">
                                        <input type="checkbox" class="course-skills"
                                               value="${skills}" />
                                        <span>
                                        ${skills.getName()}
                                        </span>
                                    </label>
                                        </#list>
                                        <input type="hidden" name="skills" id="course-skills" class="form-control required"
                                               tips="请选择课程技能" value="${courses.skills}">
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">课程价格</span>
                                        <input type="number" class="form-control required" id="price" name="price" value="${courses.price}"/>
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">练车地址</span>
                                        <input type="text" class="form-control required" id="address" name="address"
                                               value="${courses.address}" placeholder="请输入练车地址" tips="请输入练车地址"/>
                                    </div>
                                    <div class="input-group"
                                         style="margin-top:15px;margin-bottom:15px;padding-left:25px;">
                                        状态：
                                        <label class="lyear-radio radio-inline radio-primary" style="margin-left:30px;">
                                            <input type="radio" name="status" value="1" <#if courses.status==1>checked</#if>>
                                            <span>上架</span>
                                            <label class="lyear-radio radio-inline radio-primary">
                                                <input type="radio" name="status" value="2"<#if courses.status==2>checked</#if>>
                                                <span>下架</span>
                                            </label>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <button type="button" class="btn btn-primary ajax-post"
                                                id="edit-form-submit-btn">确 定
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
<script type="text/javascript" charset="utf-8" src="/admin/js/kindeditor/kindeditor-all-min.js"></script>
<script src="/admin/js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="/admin/js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        KindEditor.ready(function (K) {
            K.create('#edit-content', {
                uploadJson: '/upload/uploadFile',
                filePostName: 'imgFile',
                allowFileManager: true,
                allowImageUpload: true,
                items: ['fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold',
                    'italic', 'underline', 'removeformat', 'justifyleft', 'justifycenter', 'justifyright',
                    'insertorderedlist', 'insertunorderedlist', 'emoticons', 'image', 'insertfile'
                ],
                afterBlur: function () {
                    this.sync();
                },
                allowImageRemote: false,
                afterUpload: function (url, data, name) { //上传文件后执行的回调函数，必须为3个参数
                    if (name == "image" || name == "multiimage") { //单个和批量上传图片时
                        var img = new Image();
                        img.src = url;
                        img.onload = function () {
                        }
                    }
                }
            });
        });
        //提交按钮监听事件
        $("#edit-form-submit-btn").click(function () {
            if (!checkForm("course-edit-form")) {
                return;
            }
            var content = $("#edit-content").val();
            if (content.length <= 25) {
                showWarningMsg("课程内容不能小于25个文字");
                return;
            }
            var coach=$("#edit-coach").val();
            if(coach==-1){
                showWarningMsg("请选择教练！");
                return;
            }
            var data = $("#course-edit-form").serialize();
            $.ajax({
                url: 'edit',
                type: 'POST',
                data: data,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        showSuccessMsg('课程编辑成功!', function () {
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
        //监听上传视频按钮
        $("#add-video-btn").click(function () {
            $("#select-video-file").click();
        })

        //选择课程类型时触发
        $(".course-type").click(function () {
            courseType();
        });

        //选择课程技能时触发
        $(".course-skills").click(function () {
            courseSkills();
        });

        //获取选中的课程类型
        $("input.course-type[type='checkbox']").each(function(i,e){
            if($("input[name='type']").val().indexOf($(e).val())>=0){
                $(e).prop("checked","true");
            }
        });

        //获取选中的课程技能
        $("input.course-skills[type='checkbox']").each(function(i,e){
            if($("input[name='skills']").val().indexOf($(e).val())>=0){
                $(e).prop("checked","true");
            }
        });

    });

    //课程类型
    function courseType() {
        var typeValue = "";
        $("input.course-type[type='checkbox']:checked").each(function (i, e) {
            typeValue += $(e).val() + ",";
        });
        typeValue.substring(0, typeValue.length - 1);
        $("#course-type").val(typeValue);
    }

    //课程技能
    function courseSkills() {
        var skillsValue="";
        $("input.course-skills[type='checkbox']:checked").each(function (i, e) {
                skillsValue+=$(e).val()+",";
        });
        skillsValue.substring(0,skillsValue.length-1);
        $("#course-skills").val(skillsValue);
    }

    function uploadVideo() {
        if ($("#select-video-file").val() == '') return;
        var video = document.getElementById('select-video-file').files[0];
        uploadVideoToServer(video, function (data) {
            $("#video").val(data.data);
            $("#preview-video").attr('src', '/download/download_video?filename=' + data.data);
            $("#preview-video").closest("li").show();
        });
    }

    function init()
    {
        <#if courses.video??>
            <#if courses.video?length gt 0>
                $("#preview-video").closest("li").show();
            </#if>
        </#if>
    }

    init();
</script>
</body>
</html>