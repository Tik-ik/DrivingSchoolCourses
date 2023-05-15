<!DOCTYPE html>
<html lang="en">
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
							<a href="index.ftl" class="s-txt19 hov-color-main trans-02">
								<i class="fa fa-home"></i>
								Home
							</a>
							<span class="s-txt19 p-l-6 p-r-9">/</span>
						</span>

						<span>
							<span class="s-txt19">
								Our Gallery
							</span>
						</span>
					</div>

					<h2 class="m-txt6 respon1">
						Our Gallery
					</h2>
				</div>

				<div class="p-t-10 p-b-10">
					<!-- Button -->
					<a href="#" class="btn-drive size1 m-txt1 bg-main bo-rad-4 trans-03">
						Get in touch
						<i class="fa fa-chevron-right m-l-9 fs-14" aria-hidden="true"></i>
					</a>
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
						<button class="h-size2 s-txt15 hov2 trans-04 p-r-35 actived-1 filter-type" data-filter=".${label.id}" rowid="${label.id}">
							${label.name}
						</button>
					</#list>
				</div>
			</div>
			
			<div class="row isotope-grid isotope-grid-gallery">
				<#if pageBean.content?size gt 0>
					<#list pageBean.content as news>
                    	<div class="col-sm-6 col-lg-4 p-b-45  isotope-item driving-dr experience-dr lessons-dr">
                            <a class="wrap-pic-w dis-block overlay1" href="/photo/view?filename=${news.pic}"
                               data-lightbox="all-gallery">
                                <img width="270px" height="202px" src="/photo/view?filename=${news.pic}" alt="IMG-GALLERY">
                            </a>
                        </div>
                    </#list>
                </#if>
			</div>
            <div class="layui-row">
                <div id="demo11"></div>
            </div>
		</div>
	</div>

	<!-- CTA 1-->
	<div class="bg-main p-t-30 p-b-30">
		<div class="container">
			<div class="content-cta-1 flex-sb-m flex-w">
				<span class="m-txt17 p-t-15 p-b-15">
					Looking for a first-class driving?
				</span>

				<div class="wrap-btn-cta">
					<!-- Button -->
					<a href="#" class="btn-drive rs1-btn size5 m-txt2 bgwhite bo-rad-4 trans-03">
						Get A Free Quote
					</a>
				</div>
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
	<script src="/home/js/main.js"></script>
	<script type="text/javascript" src="/home/layui/layui.all.js"></script>
	<script type="text/javascript" src="/home/layui/layui.js"></script>
	<script type="text/javascript" src="/home/js/jquery.min.js"></script>
	<script>
    var M = {};
    M.curr = ${pageBean.currentPage};
    M.id = "-1";
    layui.use('laypage',function(){
        laypage = layui.laypage;
        //完整功能
        laypage.render({
            elem: 'demo11'
            ,count: ${pageBean.total}
            ,curr:${pageBean.currentPage}
            ,limit:${pageBean.getPageSize()}
            ,layout: ['count', 'prev', 'page', 'next']
            ,jump: function(obj, first){
                if(!first)
                {
                    if(M.id != "-1")
                    {
                        location.href = "photo?currentPage=" + obj.curr + "&label.id=" + str;
                    }
                    else
                    {
                        location.href = "photo?currentPage="+obj.curr;
                    }
                }
            }
        });
    });

    $(".filter-type").click(function()
    {
        var str = $(this).attr("rowid");
        if(str != "-1")
        {
            location.href = "photo?currentPage=" + 1 + "&label.id=" + str;
        }
        else
        {
            location.href = "photo?currentPage="+M.curr;
        }
        M.id = str;
    });

</script>

</body>
</html>