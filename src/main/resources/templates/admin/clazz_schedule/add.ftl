<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>${siteName!""}|课程表管理-添加课程表</title>
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
                            <div class="card-header"><h4>添加课程表</h4></div>
                            <div class="card-body">
                                <form action="add" id="schedule-add-from" method="post" class="row">
                                    <div class="input-group m-b-10" style="width: 20%;">
                                        <span class="input-group-addon">所属教练</span>
                                        <select name="coach.id" class="form-control" id="coach">
                                            <option value="-1">--请选择教练--</option>
                                            <#list coachList as coach>
                                                <option value="${coach.id}">${coach.name}</option>
                                            </#list>
                                        </select>
                                    </div>
                                    <div class="input-group m-b-10" style="width: 20%;">
                                        <span class="input-group-addon">所属课程</span>
                                        <select name="courses.id" class="form-control" id="course">

                                        </select>
                                    </div>

                                    <div class="input-group m-b-10 input-daterange input-group" style="width: 30%">
                                        <span class="input-group-addon">可用日期</span>
                                        <input class="form-control required js-datepicker " data-date-format="yyyy-mm-dd"
                                               type="text" id="startDate" name="startDate" placeholder="从" tips="请选择开始日期">
                                        <span class="input-group-addon"><i class="mdi mdi-chevron-right"></i></span>
                                        <input class="form-control required js-datepicker" data-date-format="yyyy-mm-dd"
                                               type="text" id="endDate" name="endDate" placeholder="至" tips="请选择结束日期">
                                    </div>

                                    <div class="input-group m-b-10 input-daterange input-group" style="width: 30%;">
                                        <span class="input-group-addon">开始时间</span>
                                        <input type="text" class="form-control required js-datetimepicker"
                                               id="start-time" name="startTime" value="" placeholder="从" tips="请选择开始时间"
                                               data-side-by-side="true" data-locale="zh-cn" data-format="HH:mm"/>
                                        <span class="input-group-addon"><i class="mdi mdi-chevron-right"></i></span>
                                        <input type="text" class="form-control required js-datetimepicker"
                                               id="end-time" name="endTime" value="" placeholder="至" tips="请选择结束时间"
                                               data-side-by-side="true" data-locale="zh-cn" data-format="HH:mm"/>
                                    </div>

                                    <div class="input-group m-b-10 input-daterange input-group" style="width: 20%;">
                                        <span class="input-group-addon">课长时间</span>
                                        <input type="number" min="0" name="slot" value="0" class="form-control required" placeholder="时长"
                                               aria-describedby="basic-addon2"tips="请选择课长时间" >
                                        <span class="input-group-addon" id="basic-addon2">分钟</span>
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
        $("#add-form-submit-btn").click(function () {
            if (!checkForm("schedule-add-from")) {
                return;
            }

            if($("#coach").val()==-1){
                showWarningMsg("请选择教练!");
                return;
            }
            if($("#course").val()==-1){
                showWarningMsg("请选择课程!");
                return;
            }
          var startDate=$("#startDate").val();
           var endDate=$("#endDate").val();
           if(endDate<startDate){
               showWarningMsg("开始日期不能大于结束日期!");
               return;
           }
            var startTime=$("#start-time").val();
            var endTime=$("#end-time").val();
           if(startTime>=endTime){
               showWarningMsg("开始时间不能大于结束时间！");
               return;
           }
            var data = $("#schedule-add-from").serialize();
            $.ajax({
                url: 'add',
                type: 'POST',
                data: data,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        showSuccessMsg('课程表添加成功!', function () {
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


    });
    $('.js-datepicker').datepicker({
        autoclose: true, // 选择后自动关闭选择器
        language: "zh-CN",
        todayBtn: "true", // 显示"今日"按钮
        todayHighlight: true, // 高亮"今日"
        startDate: new Date()
    });
    //选择教练联动教程
    $("select#coach").change(function () {
        var coachId = $(this).val();
        $.get('gainCourse', {coachId: coachId}, function (data) {
            $("select[name='courses.id']").empty();
            var courseList = data.data;
            var html = '<option value="-1">--请选择课程--</option>';
            for (var i = 0; i < courseList.length; i++) {
                html += '<option value=' + courseList[i].id + '>' + courseList[i].title + '</option>'
            }
            $("select[name='courses.id']").append(html);
        });
    });
</script>
</body>
</html>