<!DOCTYPE html>
<html lang="zh-CN">
<head>

	<title>Photo Gallery</title>
	<meta charset="UTF-8">
	<meta name="description" content="AuCreative theme tempalte">
	<meta name="author" content="AuCreative">
	<meta name="keywords" content="AuCreative theme template">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/home/layui/css/layui.css">
	<#include "../common/common.ftl"/>

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
								照片库
							</span>
						</span>
					</div>

					<h2 class="m-txt6 respon1">
						照片库
					</h2>
				</div>
			</div>
		</div>
	</section>

	<!-- Our gallery -->
	<div class="bgwhite p-t-60 p-b-60">
		<div class="container">
			<div class="p-b-44">
				<div class="flex-w filter-tope-group">
                    <button class="h-size2 s-txt15 hov2 trans-04 p-r-35 actived-1 filter-type" data-filter="*" rowid="-1">全部</button>
					<#list labels as label>
						<button class="label-gallery h-size2 s-txt15 hov2 trans-04 p-r-35" data-filter=".${label.id}">
							${label.name}
						</button>
					</#list>
				</div>
			</div>

			<div class="row isotope-grid isotope-grid-gallery">
				<#if pictureItems?size gt 0>
					<#list pictureItems as item>
                    	<#if item.images?size gt 0>
							<#list item.images as img>
								<div class="col-sm-6 col-lg-4 p-b-45  isotope-item ${item.picture.label.id}" style="text-align: center">
                                    <a class="wrap-pic-w dis-block overlay1" href="${img}" data-lightbox="all-gallery">
                                        <img width="270px" height="202px" style="object-fit: cover;" src="${img}" alt="IMG-GALLERY">
                                    </a>
                                </div>
							</#list>
                    	</#if>
                    </#list>
                </#if>
			</div>
            <div class="layui-row">
            </div>
		</div>
	</div>

	<#include "../common/footer.ftl"/>

	<!-- Back to top -->
	<div class="btn-back-to-top hov-bg-main" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<#include "../common/footer-js.ftl"/>
	<script src="/home/js/isotope.pkgd.min.js"></script>
	<script src="/home/js/main.js"></script>
	<script type="text/javascript" src="/home/layui/layui.all.js"></script>
	<script type="text/javascript" src="/home/layui/layui.js"></script>
	<script type="text/javascript" src="/home/js/jquery.min.js"></script>
</body>
</html>