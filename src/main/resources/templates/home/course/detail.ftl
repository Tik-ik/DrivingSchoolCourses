<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <title>课程介绍</title>
    <meta charset="UTF-8">
    <meta name="description" content="AuCreative theme tempalte">
    <meta name="author" content="AuCreative">
    <meta name="keywords" content="AuCreative theme template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<#include "../common/common.ftl"/>

</head>
<body class="animsition restyle-index">

<header>
		<#include "../common/header.ftl"/>
</header>
<!-- Title page -->
<section class="bg-img-1 bg-overlay-3 p-t-93 p-b-95" style="background-image: url('/home/images/bg-title-01.jpg');">
    <div class="container">
        <div class="flex-w flex-sb-m">
            <div class="p-t-10 p-b-10 p-r-30">
                <div class="flex-w p-b-9">
						<span>
							<a href="/home/index/index" class="s-txt19 hov-color-main trans-02">
								<i class="fa fa-home"></i>
								首页
							</a>
							<span class="s-txt19 p-l-6 p-r-9">/</span>
						</span>

                    <span>
							<a href="/home/course/list" class="s-txt19 hov-color-main trans-02">
								课程列表
							</a>
							<span class="s-txt19 p-l-6 p-r-9">/</span>
						</span>

                    <span>
							<span class="s-txt19">
								课程详情
							</span>
						</span>
                </div>

                <h2 class="m-txt6 respon1">
                ${course.title}
                </h2>
            </div>

            <div class="p-t-10 p-b-10">
                <!-- Button -->
                <a href="/home/course/list" class="btn-drive size1 m-txt1 bg-main bo-rad-4 trans-03">
                    其他课程
                    <i class="fa fa-chevron-right m-l-9 fs-14" aria-hidden="true"></i>
                </a>
            </div>
        </div>
    </div>
</section>

<!-- Content -->
<section class="bgwhite p-t-80 p-b-75">
    <div class="container">
        <div class="row">
            <div class="col-sm-10 col-md-8 col-lg-9 m-lr-auto p-b-50">
                <div class="p-r-20 p-r-0-md">
                    <div class="bo2">
                        <div class="wrap-pic-w bo2-b">
                              <#if course.coverPhoto??>
                            <#if course.coverPhoto?length gt 0>
                                <img src="/photo/view?filename=${course.coverPhoto}" style="width: 268px;height: 201px" alt="IMG-FEATURE">
                            <#else>
                                <img src="/admin/images/default-head.jpg" style="width: 268px;height: 201px" alt="IMG-FEATURE">
                            </#if>
                              <#else>
                            <img src="/admin/images/default-head.jpg" style="width: 268px;height: 201px" alt="IMG-FEATURE">
                              </#if>
                        </div>

                        <div class="p-l-38 p-r-38 p-t-30 p-b-18 p-lr-15-sm">
                            <!--  -->
                            <div class="flex-sb-m p-b-12">
									<span class="s-txt5">
										<#list course.typeList as  type>
                                            ${type.getName()}
                                        </#list>
                                    </span>
                                <span class="color1 fs-12">
                                    <div id="test8">

                                    </div>
                                </span>
                            </div>

                            <!--  -->
                            <h4 class="m-txt25 p-b-22">
                            ${course.title}
                            </h4>

                            <!--  -->
                            <div class="p-b-5">
									<span class="s-txt25">
										可用日期:
									</span>

                                <span class="s-txt2">
										1 May 2017, 30 May 2018
                                </span>
                            </div>

                            <div class="p-b-28">
									<span class="s-txt25">
										地点:
									</span>

                                <span class="s-txt2">
                                ${course.address}
                                </span>
                            </div>

                            <!--  -->
                            <p class="s-txt2 p-b-24">
                            ${course.content}
                            </p>

                            <ul class="list-01 p-b-32">
									<#list course.skillsList as skills>
                                        <li class="p-b-6">
										<span class="s-txt2">
                                            ${skills.getName()}
                                        </span>
                                        </li>
                                    </#list>

                            </ul>

                            <!--  -->
                            <div class="m-txt26 p-b-5">
                                $${course.price}
                            </div>

                            <!--  -->
                            <div class="flex-w flex-sb-m">
                                <div class="flex-w p-t-10 p-b-10 p-r-30">
                                    <#if ylrc_account??>
                                        <div class="m-r-8 m-t-4 m-b-4">
                                            <!-- Button -->
                                            <a href="/home/course/scheduleDetail?id=${course.id}" class="btn-drive m-txt1 size3 bg-main hov-color-white bo-rad-4">
                                                开始预约
                                            </a>
                                        </div>
                                    </#if>
                                    <div class="m-t-4 m-b-4">
                                        <!-- Button -->
                                        <a href="javascript:showVideo();" class="btn-drive m-txt10 size19 bo3 bg1 hov-color-white bo-rad-4">
                                            查看课程视频
                                        </a>
                                    </div>
                                </div>

                                <div class="flex-w flex-m p-t-10 p-b-10 rs1-share-item">

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-10 col-md-4 col-lg-3 m-lr-auto p-b-50">
                <!-- Block 5 -->
                <div class="block-5">
                    <div class="wrap-pic-b5 wrap-pic-w hov5 bo2">
                        <a href="#"><img src="/photo/view?filename=${course.coach.headPic}" alt="IMG-INSTRUCTOR"></a>
                    </div>

                    <div class="wrap-text-b5 p-t-28">
                        <a href="#"><h4 class="m-txt16 hov-color-main trans-04 p-b-8">
                        ${course.coach.name}
                        </h4></a>

                        <span class="s-txt8 color-main">
                        ${course.coach.coachType.name}
                        </span>

                        <p class="s-txt2 p-t-11 p-b-12">
                        ${course.coach.introduce}
                        </p>

                        <span class="dis-block s-txt14">
                        ${course.coach.phone}
                        </span>

                        <div class="wrap-btn-b5 p-t-23 flex-w">
                            <!-- Button -->
                            <a href="/home/index/teacher_details?id=${course.coach.id}" class="btn-drive m-txt10 size11 bo3 bg1 hov-color-white bo-rad-4">
                                查看教练
                            </a>
                        </div>

                    </div>
                </div>

                <!-- Map -->
                <div class="map p-t-50">
                    <div class="contact-map h-size5" id="google_map" data-map-x="40.707840" data-map-y="-74.011229"
                         data-pin="images/icons/marker-01.png" data-scrollwhell="0" data-draggable="1"
                         data-zoom="13"></div>

                </div>

                <!-- Contact -->
                <div class="p-t-45">
                    <h4 class="m-txt24 p-b-13">
                        联系我们
                    </h4>

                    <ul>
                        <li class="dis-flex p-t-11">
								<span class="w-size9">
									<i class="fa fa-map-marker fs-14 color6" aria-hidden="true"></i>
								</span>

                            <span class="s-txt2 w-size10">
									地址：上海浦东新区
								</span>
                        </li>

                        <li class="dis-flex p-t-11">
								<span class="w-size9">
									<i class="fa fa-phone fs-14 color6" aria-hidden="true"></i>
								</span>

                            <span class="s-txt2 w-size10">
									Phone: 15518166123
								</span>
                        </li>

                        <li class="dis-flex p-t-11">
								<span class="w-size9">
									<i class="fa fa-fax fs-14 color6" aria-hidden="true"></i>
								</span>

                            <span class="s-txt2 w-size10">
									传真：15518166123
								</span>
                        </li>

                        <li class="dis-flex p-t-11">
								<span class="w-size9">
									<i class="fa fa-envelope fs-14 color6" aria-hidden="true"></i>
								</span>

                            <span class="s-txt2 w-size10">
									电子邮箱：115432031@qq.com
								</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- CTA 1-->
<div class="bg-main p-t-30 p-b-30">
    <div class="container">
        <div class="content-cta-1 flex-sb-m flex-w">


        </div>
    </div>
</div>


<#include "../common/footer-js.ftl"/>
<script src="/home/js/isotope.pkgd.min.js"></script>
<script src="/home/js/jquery.waypoints.min.js"></script>
<!--===============================================================================================-->
<script src="/home/js/31e5c13de5564e6aae12101b95eb39d7.js"></script>
<script src="/home/js/map-custom.js"></script>
<!--===============================================================================================-->
<script src="/home/js/main.js"></script>
<#include "../common/footer.ftl"/>
<link rel="stylesheet" href="/home/layui/css/layui.css"/>
<script type="text/javascript" src="/home/layui/layui.all.js"></script>
<style>
    video
    {
        width: 100%;
        max-height: 500px;
    }
</style>

<!-- 对话框面板定义 -->
<div class='simple_dlg_define' style='display:none'>
    <div class='pane' style='padding:16px'>
        <div style='padding:10px'>
            <#if course.video??>
                <#if course.video?length gt 0>
                    <video src="/download/download_video?filename=${course.video}" controls></video>
                <#else>
                    暂无视频
                </#if>
            <#else>
                暂无视频
            </#if>
        </div>
    </div>
</div>
<link rel="stylesheet" href="/home/layui/css/layui.css"/>
<script type="text/javascript" src="/home/layui/layui.all.js"></script>

<script>
    function showVideo()
    {
        var dlgContent = $('.simple_dlg_define').html(); // 窗口内容

        layer.open({
            type: 1,
            title: '查看视频',
            area: ['960px', 'auto'],
            content: dlgContent
        });
    }

    layui.use('rate',function()
    {
        var rate = layui.rate;
        rate.render({
            elem: '#test8'
            ,value: ${course.rate}
            ,readonly: true
        });
    });
</script>
</body>
</html>