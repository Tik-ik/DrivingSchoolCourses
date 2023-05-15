<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <title>课程列表</title>
    <meta charset="UTF-8">
    <meta name="description" content="AuCreative theme tempalte">
    <meta name="author" content="AuCreative">
    <meta name="keywords" content="AuCreative theme template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#include "../common/common.ftl"/>

    <link href="/admin/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/admin/css/style.min.css" rel="stylesheet">
    <link href="/home/css/kc.css" rel="stylesheet">
    <link href="/home/css/common.css" rel="stylesheet">


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
							<span class="s-txt19">
								课程列表
							</span>
						</span>
                </div>

                <h2 class="m-txt6 respon1">
                    课程列表
                </h2>
            </div>
        </div>
    </div>
</section>

<!-- Content -->
<section class="bgwhite p-t-70 p-b-65">
    <div class="container">
        <!--  -->
        <div class="bg1 flex-sb-m flex-w p-t-7 p-b-7 p-r-6 p-l-28 m-b-40 p-lr-15-sm">
            <div class="flex-m flex-w p-t-10 p-b-10">
                <span class="flex-c-m fs-18 color6 hov-pointer hov-color-main trans-03 m-r-25 js-show-list actived-2">
                    <i class="fa fa-th-list"></i>
                </span>
                <span class="s-txt2 p-t-3">展示课程列表</span>
            </div>

        </div>
        <!-- Course list -->
        <div class="js-list">
            <div class="row" id="row-list">
                <#list pageBean.content as courses>
                <div class="col-sm-10 col-md-12 m-lr-auto p-b-30">
                    <!-- Block 3 -->
                    <div class="block-3 bo2 flex-w">
                        <div class="wrap-pic-b3 wrap-pic-w hov5 bo2-r w-size6 respon2">
                                <#if courses.coverPhoto??>
                            <#if courses.coverPhoto?length gt 0>
                                <img src="/photo/view?filename=${courses.coverPhoto}" style="height: 100%"  alt="IMG-FEATURE">
                            <#else>
                                <img src="/admin/images/default-head.jpg" style="height: 100%" alt="IMG-FEATURE">
                            </#if>
                                <#else>
                            <img src="/admin/images/default-head.jpg" style="height: 100%" alt="IMG-FEATURE">
                                </#if>
                        </div>

                        <div class="wrap-text-b3 w-size7 p-l-35 p-r-27 p-t-26 p-b-25 w-full-md">
                            <div class="flex-sb-m p-b-12">
									<span class="s-txt5">
										<#list courses.typeList as  type>
                                            ${type.getName()}
                                        </#list>
                                    </span>
                                <span class="color1 fs-12">
                                    <div id="test${courses.id}"></div>
                                </span>
                            </div>

                            <h4 class="p-b-15">
                                <a href="course-detail.html" class="m-txt8 hov-color-main trans-04">
                                    ${courses.title}
                                </a>
                            </h4>

                            <p class="s-txt2 h-size4 of-hidden m-b-2 respon3">
                                ${courses.content?substring(0,20)}...
                            </p>

                            <span class="m-txt9">$${courses.price}</span>

                            <div class="wrap-btn-b3 flex-w p-t-13">
                                <#if ylrc_account??>
                                     <div class="m-r-8 p-t-8">
                                         <!-- Button -->
                                         <a href="/home/course/scheduleDetail?id=${courses.id}"
                                            class="btn-drive m-txt1 size3 bg-main hov-color-white bo-rad-4 reserver-btn">
                                             开始预定
                                         </a>
                                     </div>
                                </#if>

                                <div class="p-t-8">
                                    <!-- Button -->
                                    <a href="/home/course/detail/${courses.id}"
                                       class="btn-drive m-txt10 size4 bo3 bg1 hov-color-white bo-rad-4">
                                        查看详情
                                    </a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                </#list>
                 <#if pageBean.total gt 0>
                <ul class="pagination no-border">
                  <#if pageBean.currentPage == 1>
                  <li class="disabled"><span>«</span></li>
                  <#else>
                  <li><a href="list?title=${title!""}&currentPage=1">«</a></li>
                  </#if>
                  <#list pageBean.currentShowPage as showPage>
                      <#if pageBean.currentPage == showPage>
                  <li class="active"><span>${showPage}</span></li>
                      <#else>
                  <li><a href="list?title=${title!""}&currentPage=${showPage}">${showPage}</a></li>
                      </#if>
                  </#list>
                  <#if pageBean.currentPage == pageBean.totalPage>
                  <li class="disabled"><span>»</span></li>
                  <#else>
                  <li><a href="list?title=${title!""}&currentPage=${pageBean.totalPage}">»</a></li>
                  </#if>
                    <li><span>共${pageBean.totalPage}页,${pageBean.total}条数据</span></li>
                </ul>
                 </#if>
            </div>
        </div>
</section>


<#include "../common/footer.ftl"/>
	<#include "../common/footer-js.ftl"/>
<script src="/home/js/tab.js"></script>
<!--===============================================================================================-->
<script src="/home/js/isotope.pkgd.min.js"></script>
<script src="/home/js/jquery.waypoints.min.js"></script>
<script src="/home/js/jquery.counterup.min.js"></script>
<script src="/home/js/isotope.pkgd.min.js"></script>
<link rel="stylesheet" href="/home/layui/css/layui.css"/>
<script type="text/javascript" src="/home/layui/layui.all.js"></script>

<script>
    $('.counter').counterUp({
        delay: 10,
        time: 1000
    });
</script>
<script src="/home/js/main.js"></script>
<script>
    layui.use('rate',function()
    {
        var rate = layui.rate;
        <#list pageBean.content as item>
            //只读
              rate.render({
                  elem: '#test${item.id}'
                  ,value: ${item.rate}
                  ,readonly: true
              });
        </#list>
    });
</script>
</body>
</html>