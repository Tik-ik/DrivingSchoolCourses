<!DOCTYPE html>
<html lang="zh-CN">
<head>

	<title>About</title>
	<meta charset="UTF-8">
	<meta name="description" content="AuCreative theme tempalte">
	<meta name="author" content="AuCreative">
	<meta name="keywords" content="AuCreative theme template">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<#include "../common/common.ftl"/>
	<style>

		.zr-input li:before
		{
            content: '🔸';
		}

         #introduce
         {
             height: 100px;
             box-sizing: content-box;
             word-break: break-all;
         }
	</style>
</head>
<body class="animsition restyle-index">
	<#include "../common/header.ftl"/>

	<!-- Title page -->
	<section class="bg-img-1 bg-overlay-3 p-t-93 p-b-95" style="background-image: url('images/bg-title-01.jpg');">
		<div class="container">
			<div class="flex-w flex-sb-m">
				<div class="p-t-10 p-b-10 p-r-30">
					<div class="flex-w p-b-9">
						<span>
							<a href="/home/index/index" class="s-txt19 hov-color-main trans-02">
								<i class="fa fa-home"></i>
								主页
							</a>
							<span class="s-txt19 p-l-6 p-r-9">/</span>
						</span>

						<span>
							<span class="s-txt19">
								关于我们
							</span>
						</span>
					</div>

					<h2 class="m-txt6 respon1">
						关于我们
					</h2>
				</div>

				<div class="p-t-10 p-b-10">
					<!-- Button -->
					<a href="/home/leave_word/add" class="btn-drive size1 m-txt1 bg-main bo-rad-4 trans-03">
                        联系
						<i class="fa fa-chevron-right m-l-9 fs-14" aria-hidden="true"></i>
					</a>
				</div>
			</div>
		</div>
	</section>

	<!-- About -->
	<section class="bgwhite p-t-62 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 p-b-30">
					<div class="p-b-44">
						<h3 class="m-txt4 p-b-8 respon1">
							<#if aboutInfo??>
								${aboutInfo.caption!""}
							</#if>
						</h3>

						<div class="bg-main size2 bo-rad-3"></div>
					</div>

					<div class="zr-input">
						<#if aboutInfo??>
							${aboutInfo.content!""}
						</#if>
					</div>
				</div>

				<div class="col-md-6 p-b-30">
					<div class="wrap-pic-w pos-relative m-t-15">
						<img src="picture/video-16-9.jpg" alt="IMG" class="op-00">
						<div class="size-full ab-t-l">
							<iframe class="size-full" src="" allowfullscreen></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</section>

	<!-- Statistic -->
	<div class="bg4 p-t-60 p-b-27">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-3 p-b-40">
					<div class="flex-col-c">
						<span class="counter l-txt2 p-b-13">
							${count}
						</span>

						<span class="s-txt20">
							满意客户
						</span>
					</div>
				</div>

				<div class="col-sm-6 col-md-3 p-b-40">
					<div class="flex-col-c">
						<span class="counter l-txt2 p-b-13">
							<#if achievement??>
								${achievement.experience!"0"}
							<#else>
								0
							</#if>
						</span>

						<span class="s-txt20">
							驾校经验
						</span>
					</div>
				</div>

				<div class="col-sm-6 col-md-3 p-b-40">
					<div class="flex-col-c">
						<span class="counter l-txt2 p-b-13">
							<#if achievement??>
								${achievement.awards!"0"}
							<#else>
								0
							</#if>
						</span>

						<span class="s-txt20">
							所获奖项
						</span>
					</div>
				</div>

				<div class="col-sm-6 col-md-3 p-b-40">
					<div class="flex-col-c">
						<span class="l-txt2 p-b-13">
							<span class="counter">${pro}</span>%
						</span>

						<span class="s-txt20">
							客户满意度
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>

<div style="height: 50%; width: 50%;"></div>


    <!-- Testimonial -->
    <section class="testimonial">
        <div class="wrap-testimonial parallax100 bg-overlay-3 p-t-75 p-b-80" style="background-image: url('/home/images/testimonial-bg-01.jpg');">
            <div class="wrap-slide-slick-1">
                <div class="p-b-40">
                    <h3 class="m-txt6 txt-center p-b-8 respon1">
                        推荐
                    </h3>

                    <div class="bg-main size2 bo-rad-3 m-lr-auto"></div>
                </div>

                <div class="slide-slick-1 js-slick-1">
					<#if recommends??>
						<#if recommends?size gt 0>
							<#list recommends as item>
                    			<div class="item-slick-1">
									<p class="para-slide-slick-1 m-lr-auto w-size1 s-txt1 txt-center p-l-40 p-r-40 p-b-25 animated">
										${item.content}
									</p>

									<div class="wrap-person m-lr-auto flex-c-m animated">
										<div class="wrap-pic-person">
											<#if item.user.headPic??>
												<#if item.user.headPic?length gt 0>
													<img src="/photo/view?filename=${item.user.headPic}" alt="IMG-PERSON">
												<#else>
													 <img src="/admin/images/default-head.jpg"  alt="IMG-PERSON">
												</#if>
											<#else>
												 <img src="/admin/images/default-head.jpg"  alt="IMG-PERSON">
											</#if>
										</div>

										<div class="wrap-info-person p-l-20">
											<span class="dis-block s-txt3">${item.user.username}</span>
											<span class="dis-block s-txt4">Super Administrator</span>
										</div>
									</div>
								</div>
							</#list>
						</#if>
					</#if>
                </div>
            </div>
        </div>
    </section>
<div style="height: 50%; width: 50%;"></div>



	<#include "../common/footer.ftl"/>

	<!-- Back to top -->
	<div class="btn-back-to-top hov-bg-main" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<#include "../common/footer-js.ftl"/>
	<script src="/home/js/main.js"></script>
	<link rel="stylesheet" href="/home/layui/css/layui.css"/>
    <script type="text/javascript" src="/home/layui/layui.all.js"></script>
    <script type="text/javascript" src="/home/layui/layui.js"></script>
	<script>
		var M = {};
		M.count = ${pageBean.getTotal()};
		M.limit = ${pageBean.getPageSize()};
		M.curr = ${pageBean.currentPage};

		function initPage()
		{
            layui.use('laypage',function()
            {
                laypage = layui.laypage;

                //完整功能
                laypage.render({
                    elem: 'demo11'
                    ,count: M.count,
                    limit:  M.limit
                    ,curr:M.curr
                    ,layout: ['count', 'prev', 'page', 'next']
                    ,jump: function(obj, first){
                        if(!first)
                        {
                            location.href = "about?currentPage=" + obj.curr;
                        }
                    }
                });
            });
		}

		//初始化页签
		initPage();



	</script>
</body>
</html>