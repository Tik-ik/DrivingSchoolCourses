<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>${siteName!""}|课程表管理-编辑课程表</title>
<#include "../common/header.ftl"/>
    <!--时间选择插件-->
    <link rel="stylesheet" href="/admin/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
    <!--日期选择插件-->
    <link rel="stylesheet" href="/admin/js/bootstrap-datepicker/bootstrap-datepicker3.min.css">
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
                            <div class="card-header"><h4>编辑课程表</h4></div>
                            <div class="card-body">
                                <form action="add" id="schedule-edit-form" method="post" class="row">
                                    <input type="hidden" name="id" value="${clazzSchedule.id}"/>
                                    <div class="input-group m-b-10" style="width: 20%;">
                                        <span class="input-group-addon">所属教练</span>
                                        <select name="coach.id" class="form-control" id="edit-coach">
                                            <option value="-1">--请选择教练--</option>
                                            <#list coachList as coach>
                                                <option value="${coach.id}"
                                                        <#if clazzSchedule.courses.coach.id==coach.id>selected</#if>>${coach.name}</option>
                                            </#list>
                                        </select>
                                    </div>
                                    <div class="input-group m-b-10" style="width: 20%;">
                                        <span class="input-group-addon">所属课程</span>
                                        <select name="courses.id" class="form-control" id="edit-course">

                                        </select>
                                    </div>

                                    <div class="input-group m-b-10 input-daterange input-group" style="width: 30%">
                                        <span class="input-group-addon">可用日期</span>
                                        <input class="form-control required js-datepicker "
                                               data-date-format="yyyy-mm-dd"
                                               type="text" id="edit-startDate" name="startDate" placeholder="从"
                                               tips="请选择开始日期" value="${clazzSchedule.startDate}">
                                        <span class="input-group-addon"><i class="mdi mdi-chevron-right"></i></span>
                                        <input class="form-control required js-datepicker" data-date-format="yyyy-mm-dd"
                                               type="text" id="edit-endDate" name="endDate" placeholder="至" tips="请选择结束日期"
                                               value="${clazzSchedule.endDate}"/>
                                    </div>
                                    <div class="input-group m-b-10 input-daterange input-group" style="width: 30%;">
                                        <span class="input-group-addon">开始时间</span>
                                        <input type="text" class="form-control required js-datetimepicker"
                                               id="edit-start-time" name="startTime" placeholder="从" tips="请选择开始时间"
                                               data-side-by-side="true" data-locale="zh-cn" data-format="HH:mm"
                                               value="${clazzSchedule.startTime}"/>
                                        <span class="input-group-addon"><i class="mdi mdi-chevron-right"></i></span>
                                        <input type="text" class="form-control required js-datetimepicker"
                                               id="edit-end-time" name="endTime" placeholder="至" tips="请选择结束时间"
                                               data-side-by-side="true" data-locale="zh-cn" data-format="HH:mm"
                                               value="${clazzSchedule.endTime}"/>
                                    </div>
                                    <div class="input-group m-b-10 input-daterange input-group" style="width: 20%;">
                                        <span class="input-group-addon">课长时间</span>
                                        <input type="number" min="0" name="slot"  class="form-control required"
                                               placeholder="时长"
                                               aria-describedby="basic-addon2" tips="请选择课长时间"
                                               value="${clazzSchedule.slot}">
                                        <span class="input-group-addon" id="basic-addon2">分钟</span>
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
<!--时间选择插件-->
<script src="/admin/js/bootstrap-datetimepicker/moment.min.js"></script>
<script src="/admin/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="/admin/js/bootstrap-datetimepicker/locale/zh-cn.js"></script>
<!--日期选择插件-->
<script src="/admin/js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="/admin/js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        //提交按钮监听事件
        $("#edit-form-submit-btn").click(function () {
            if (!checkForm("schedule-edit-form")) {
                return;
            }
            if ($("#edit-coach").val() == -1) {
                showWarningMsg("请选择教练!");
                return;
            }
            if ($("#edit-course").val() == -1) {
                showWarningMsg("请选择课程!");
                return;
            }
            var startDate = $("#edit-startDate").val();
            var endDate = $("#edit-endDate").val();
            if (endDate <= startDate) {
                showWarningMsg("开始日期不能大于结束日期!");
                return;
            }
            var startTime = $("#edit-start-time").val();
            var endTime = $("#edit-end-time").val();
            if (startTime >= endTime) {
                showWarningMsg("开始时间不能大于结束时间！");
                return;
            }
            var data = $("#schedule-edit-form").serialize();
            $.ajax({
                url: 'edit',
                type: 'POST',
                data: data,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        showSuccessMsg('课程表编辑成功!', function () {
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
        //主动触发
        $("select#edit-coach").trigger('change');
    });
    $('.js-datepicker').datepicker({
        autoclose: true, // 选择后自动关闭选择器
        language: "zh-CN",
        todayBtn: "true", // 显示"今日"按钮
        todayHighlight: true, // 高亮"今日"
        startDate: new Date()
    });
    //选择教练联动教程
    $("select#edit-coach").change(function () {
        var coachId = $(this).val();
        var courseId=${clazzSchedule.courses.id};
        $.get('gainCourse', {coachId: coachId}, function (data) {
            $("select[name='courses.id']").empty();
            var courseList = data.data;
            var html = '<option value="-1">--请选择课程--</option>';
            for (var i = 0; i < courseList.length; i++) {
                if(courseList[i].id==courseId){
                    html += '<option value=' + courseList[i].id + ' selected>' + courseList[i].title + '</option>'
                }else{
                    html += '<option value=' + courseList[i].id + '>' + courseList[i].title + '</option>'
                }
            }
            $("select[name='courses.id']").append(html);
        });
    });
</script>
</body>
</html>