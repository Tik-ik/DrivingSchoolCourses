<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <title>课程预约</title>
    <meta charset="UTF-8">
    <meta name="description" content="AuCreative theme tempalte">
    <meta name="author" content="AuCreative">
    <meta name="keywords" content="AuCreative theme template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#include "../common/common.ftl"/>
    <link href="/home/css/kc.css" rel="stylesheet">
    <link href="/home/css/common.css" rel="stylesheet">
    <link href="/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="/admin/css/style.min.css" rel="stylesheet">
    <link href="/admin/css/materialdesignicons.min.css" rel="stylesheet">
    <!--对话框-->
    <link rel="stylesheet" href="/admin/js/jconfirm/jquery-confirm.min.css">
</head>
<body class="animsition restyle-index">

<header>
	<#include "../common/header.ftl" />
</header>

<!-- Breadcrumb -->
<div class="bg1 p-t-29 p-b-29">
    <div class="container">
        <div class="flex-w">
				<span>
					<a href="/home/index/index" class="s-txt21 hov-color-main trans-02">
						<i class="fa fa-home"></i>
						首页
					</a>
					<span class="s-txt21 p-l-6 p-r-9">/</span>
				</span>

            <span>
					<a href="/home/course/list" class="s-txt21 hov-color-main trans-02">
						课程列表
					</a>
					<span class="s-txt21 p-l-6 p-r-9">/</span>
				</span>

            <span>
					<span class="s-txt21">
						课程预约
					</span>
				</span>
        </div>
    </div>
</div>

<!-- Content -->
<section class="p-t-63 p-b-50">
    <div class="container">
        <div class="row">
            <#if clazzSchedule??>
                <div style="width:1000px;margin: 0 auto;">
                    <h1 class="titleH1 underNone clearfix">
                        <span class="left underNone underLine">课程预约 </span>
                        <button class="btn btn-label btn-primary" style="margin-bottom: 10px;float: right;" id="submit-make-btn"><label>
                            <i class="mdi mdi-checkbox-marked-circle-outline"></i>
                        </label> 确认提交
                        </button>
                    </h1>
                    <div class="jyTable">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>日期/时间</th>
                            <#list dateList as date>
                                <th>${date?string('yyyy-MM-dd')}</th>
                            </#list>
                            </tr>
                         <#list slotList as slot>
                         <tr>
                             <th> ${slot}</th>
                             <#list dateList as date>
                             <th class="make-slot" x="${date?string('yyyy-MM-dd')}" y="${slot}">
                                 <img src="/home/img/car.png"/>
                                 <label class="lyear-checkbox checkbox-inline checkbox-primary make-slot">
                                     <input type="checkbox" name="status-${date?string('yyyy-MM-dd')}=${slot}"
                                            value="1"><span>预&nbsp;&nbsp;&nbsp;&nbsp;约</span>
                                 </label>
                             </th>
                             <th class="make-slot" style="display: none;">
                                 <img src="/home/img/car_none.png"/>
                                 <span>不可预约</span>
                             </th>
                             </#list>
                         </tr>
                         </#list>


                            </thead>
                        </table>

                    </div>

                </div>
            <#else>
                <div><font>${msg}</font></div>
            </#if>
        </div>

    </div>
</section>
<#include "../common/footer.ftl"/>
<#include "../common/footer-js.ftl"/>
<script src="/home/js/isotope.pkgd.min.js"></script>
<script src="/home/js/jquery.waypoints.min.js"></script>
<!--===============================================================================================-->
<script src="/home/js/jquery.counterup.min.js"></script>
<script type="text/javascript" src="/home/js/tab.js"></script>
<!--对话框-->
<script src="/admin/js/jconfirm/jquery-confirm.min.js"></script>
<script type="text/javascript" src="/home/js/common.js"></script>
<script>
    $('.counter').counterUp({
        delay: 10,
        time: 1000
    });
</script>
<script src="/home/js/main.js"></script>
<script>
    var appointList=${appointmentList!"[]"};
    var maxMake=${maxMake!"4"};
    $(document).ready(function(){
        for(var i=0;i<appointList.length;i++){
            $("input[type=checkbox]").each(function(i,e){
               if($(e).attr("name")==appointList[i]){
                   $(e).closest("th").css("display","none");
                   $(e).closest("th").next().show();
                }
            });
        }
    });

    $(".make-slot").click(function () {
        var date = $(this).closest("th").attr("x");
        var slot = $(this).closest("th").attr("y");
        //var length=$("input[type='checkbox'][name='status-" + date + "=" + slot + "']:checked").length;
        var length = $("input[type='checkbox']:checked").length;
        if (length > maxMake) {
            showWarningMsg("最多预约四个");
            $("input[type='checkbox']:checked").last().prop("checked", "");
            return;
        }
    });

    //确认预约
    $("#submit-make-btn").click(function(){
       var arr=new Array();
        $("input[type='checkbox']:checked").each(function(i,e){
           var x=$(e).closest("th").attr("x");
           var y=$(e).closest("th").attr("y");
           var value=$(e).val();
            arr.push({makeDate:x,makeTime:y});
        });
        var data=JSON.stringify(arr);
        var courseId=${clazzSchedule.courses.id};
        var submitData={};
        submitData.makeData=data;
        submitData.courseId=courseId;
        ajaxRequest('/home/appointment/add','post',submitData,function(rst){
            //预约成功，跳转到首页
            showSuccessMsg("预约成功！");
           window.location.href = '/home/index/index';
        });
    });


    //显示警告信息
    function showWarningMsg(msg) {
        $.confirm({
            title: '警告',
            content: msg,
            type: 'red',
            typeAnimated: false,
            buttons: {
                omg: {
                    text: '知道了！',
                    btnClass: 'btn-red',
                    action: function () {

                    }
                }
            }
        });
    }
</script>
</body>
</html>