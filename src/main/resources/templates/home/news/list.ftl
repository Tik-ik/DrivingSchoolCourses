<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <title>新闻</title>
    <meta charset="UTF-8">
    <meta name="description" content="AuCreative theme tempalte">
    <meta name="keywords" content="AuCreative theme template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<#include "../common/common.ftl"/>
<link rel="stylesheet" type="text/css" href="/home/layui/css/layui.css">
</head>
<body class="animsition restyle-index">

<#include "../common/header.ftl"/>

<!-- Title page -->
<section class="bg-img-1 bg-overlay-3 p-t-93 p-b-95" style="background-image: url('/home/images/bg-title-01.jpg');">
    <div class="container">
        <div class="flex-w flex-sb-m">
            <div class="p-t-10 p-b-10 p-r-30">
                <div class="flex-w p-b-9">
                    <span>
                        <a href="/home/index/index" class="s-txt19 hov-color-main trans-02">
                            <i class="fa fa-home"></i>主页</a>
                        <span class="s-txt19 p-l-6 p-r-9">/</span>
                    </span>
                    <span>
                        <span class="s-txt19">新闻</span>
                    </span>
                </div>
                <h2 class="m-txt6 respon1">新闻</h2>
            </div>
        </div>
    </div>
</section>

<!-- News -->
<div class="bgwhite p-t-60 p-b-85">
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

        <div class="row isotope-grid">
            <!-- - -->
             <#if pageBean.content?size gt 0>
                 <#list pageBean.content as news>
                     <div class="col-sm-6 col-lg-4 p-b-45 isotope-item experience-dr ${news.label.id} ">
                         <!-- Block 4 -->
                         <div class="block-4">
                             <div class="wrap-pic-b4 wrap-pic-w hov5">
                                 <a href="/home/news/details?id=${news.id}">
                                     <#if news.pic??>
                                         <#if news.pic?length gt 0>
                                             <img src="/photo/view?filename=${news.pic}"
                                                  style="width: 370px;height: 280px" alt="">
                                         <#else>
                                             <img src="/admin/images/default-head.jpg" style="width: 370px;height: 280px">
                                         </#if>
                                     </#if>
                                 </a>
                             </div>
                             <div class="wrap-text-b4 p-t-23">
                                 <h4 class="m-txt8 hov-color-main trans-04 m-b-17">${news.title}</h4>
                                 <span class="s-txt7">${news.createTime}</span>
                                 <p id="content" class="s-txt2 p-t-11 p-b-22" >
                                     <#if news.content??>
                                         <#if news.content?length gt 20>
                                             ${news.content?substring(0,20)}...
                                         <#else>
                                             ${news.content}
                                         </#if>
                                     </#if>
                                 </p>
                                 <div class="wrap-btn-b4 flex-w">
                                     <!-- Button -->
                                     <a href="/home/news/details?id=${news.id}" class="btn-drive m-txt10 size8 bo3 bg1 hov-color-white bo-rad-4">
                                         继续阅读
                                     </a>
                                 </div>
                             </div>

                         </div>
                     </div>
                 </#list>
             <#else>
                 <tr align="center">
                     <td colspan="9">这里空空如也！</td>
                 </tr>
             </#if>

        </div>

        <#--分页查询-->
        <div class="layui-row">
            <div id="demo11" style="text-align: center"></div>
        </div>



    </div>
</div>


<!-- Back to top -->
<div class="btn-back-to-top hov-bg-main" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
</div>


<style>
    .layui-laypage a, .layui-laypage span{
        padding: 1px 20px;
        height: 40px;
        line-height: 40px;
        font-size: 24px"
    }
</style>
<#include "../common/footer.ftl"/>
<#include "../common/footer-js.ftl"/>
<script src="/home/js/isotope.pkgd.min.js"></script>
<script src="/home/js/main.js"></script>
<script type="text/javascript" src="/home/layui/layui.all.js"></script>
<script type="text/javascript" src="/home/layui/layui.js"></script>
<script type="text/javascript" src="/home/js/jquery.min.js"></script>
<script>
    var M = {};
    M.curr = ${pageBean.currentPage};
    M.id = ${label};
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
                        location.href = "list?currentPage=" + obj.curr + "&label.id=" + M.id;
                    }
                    else
                    {
                        location.href = "list?currentPage="+obj.curr;
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
            location.href = "list?currentPage=" + 1 + "&label.id=" + str;
        }
        else
        {
            location.href = "list?currentPage="+M.curr;
        }
    });


</script>

</body>
</html>