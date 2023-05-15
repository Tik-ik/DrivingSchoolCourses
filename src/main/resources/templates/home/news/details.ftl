<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <title>新闻详情页</title>
    <meta charset="UTF-8">
    <meta name="description" content="AuCreative theme tempalte">
    <meta name="author" content="AuCreative">
    <meta name="keywords" content="AuCreative theme template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="/admin/css/materialdesignicons.min.css" rel="stylesheet">
    <!--对话框-->
    <link rel="stylesheet" href="/admin/js/jconfirm/jquery-confirm.min.css">
    <link href="/admin/css/style.min.css" rel="stylesheet">

<#include "../common/common.ftl"/>

</head>
<body class="animsition restyle-index">

<#include "../common/header.ftl"/>

<!-- Breadcrumb -->
<div class="bg1 p-t-29 p-b-29">
    <div class="container">
        <div class="flex-w">
				<span>
					<a href="/home/index/index" class="s-txt21 hov-color-main trans-02">
						<i class="fa fa-home"></i>主页
					</a>
					<span class="s-txt21 p-l-6 p-r-9">/</span>
				</span>
            <span>
					<a href="/home/news/list" class="s-txt21 hov-color-main trans-02">新闻</a>
					<span class="s-txt21 p-l-6 p-r-9">/</span>
				</span>
            <span>
                <span class="s-txt21">${news.title}</span>
            </span>
        </div>
    </div>
</div>

<!-- Content page -->
<section class="p-t-65 p-b-45">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-lg-9 p-b-50">
                <div class="p-r-40 p-r-0-lg">
                    <!-- Content Detail -->
                    <div class="p-b-48">
                        <h3 class="m-txt21 p-b-25">${news.title}</h3>
                        <div class="flex-w flex-m s-txt29 bo2-b p-b-15">
                            <span>由${news.user.username}发布<span class="m-l-4 m-r-9">|</span></span>
                            <span>${news.createTime}<span class="m-l-4 m-r-9">|</span></span>
                            <span>${news.label.name}<span class="m-l-4 m-r-9">|</span></span>
                        <#--全部评论条数-->
                            <span>共${newscountTotal}条评论</span>
                        </div>

                        <div class="wrap-pic-w pos-relative m-t-30 m-b-40">
                        <#if news.pic??>
                            <#if news.pic?length gt 0>
                                <img src="/photo/view?filename=${news.pic}"  alt="IMG">
                            <#else>
                                <img src="/admin/images/default-head.jpg" alt="IMG">
                            </#if>
                         </#if>
                        </div>

                        <p class="s-txt2 p-b-25"></p>

                        <div class="bo5-l p-l-53 m-t-7 m-b-33 p-t-14 p-b-13">
                            <p class="m-txt22 p-b-15">${news.content}</p>
                        </div>


                    </div>

                    <!-- Comment -->
                    <div class="bo2-b">
                        <div class="m-txt27 bo2-b p-b-20 m-b-15">
                            当前总共${newscountTotal}条评论
                        </div>

                        <#list comments as comment>
                            <#if comment.news.id == news.id>
                                <div class="flex-w p-b-10 p-t-25">
                                    <div class="wrap-pic-w w-size11 m-r-30 m-b-10">
                                       <#if comment.account.headPic ??>
                                           <#if comment.account.headPic?length gt 0>
                                               <img src="/photo/view?filename=${comment.account.headPic}" width="60px" height="60px">
                                           <#else>
                                               <img id="headPic" src="/admin/images/default-head.jpg" class="user-image"/>
                                           </#if>
                                       <#else>
                                           <img id="headPic" src="/admin/images/default-head.jpg" class="user-image"/>
                                       </#if>
                                    </div>

                                <div class="w-size18 w-full-sm m-b-10">
                                    <p class="s-txt2 p-b-10">${comment.content}</p>
                                    <span class="flex-w">

                                        <span class="s-txt28 m-r-20">${comment.account.username} - ${comment.createTime}</span>

                                        <#if logindeAccount??>
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="getCommenctid(${comment.id},${comment.id})" data-whatever="@mdo">回复</button>
                                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title" id="exampleModalLabel">新消息</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form id="reply1-add-form">
                                                                <input type="hidden" name="newsId" value="${news.id}">
                                                                <div class="form-group">
                                                                    <label for="recipient-name" class="control-label">回复人</label>
                                                                    <input type="text" class="form-control" name="username" value="${comment.account.username}" readonly>
                                                             </div>
                                                                <div class="form-group">
                                                                    <label for="message-text"  class="control-label">回复内容：</label>
                                                                    <textarea class="form-control" id="replycontent1" name="content"></textarea>
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                            <button type="button" class="btn btn-primary" id="reply1post-btn">发送消息</button>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                        </#if>
                                    </span>
                                </div>
                            </div>

                                    <#if comment.replyComments ??>
                                        <#list comment.replyComments as reply>
                                        <div class="m-l-100 bo2-tb p-t-5">
                                            <div class="flex-w p-t-25 p-b-10">
                                                <div class="wrap-pic-w w-size11 m-r-30 m-b-10">
                                                     <#if reply.account.headPic ??>
                                                         <#if reply.account.headPic?length gt 0>
                                                             <img src="/photo/view?filename=${reply.account.headPic}" width="60px" height="60px">
                                                         <#else>
                                                             <img id="headPic" src="/admin/images/default-head.jpg" class="user-image"/>
                                                         </#if>
                                                     <#else>
                                                         <img id="headPic" src="/admin/images/default-head.jpg" class="user-image"/>
                                                     </#if>
                                                </div>
                                                <div class="w-size18 w-full-sm m-b-10">
                                                    <p class="s-txt2 p-b-10"> ${reply.content} </p>
                                                    <span class="flex-w">
                                                        <span class="s-txt28 m-r-20">
                                                            ${reply.account.username} @ ${reply.parentName} - ${reply.createTime}
                                                            <#if logindeAccount??>
                                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                                                                        data-whatever="@mdo" onclick="getCommenctid(${reply.id},${comment.id})">回复</button>
                                                            </#if>
                                                            <div class="modal fade" id="exampleModal" tabindex="-1"
                                                                 role="dialog" aria-labelledby="exampleModalLabel">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                            <h4 class="modal-title" id="exampleModalLabel">新消息</h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <form id="reply2-add-form">
                                                                                <input type="hidden" name="newsId" value="${news.id}">
                                                                                <div class="form-group">
                                                                                    <label for="recipient-name" class="control-label">回复人</label>
                                                                                    <input type="text" class="form-control" name="username" value="${comment.account.username}" readonly>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="message-text" class="control-label">回复内容：</label>
                                                                                    <textarea class="form-control" id="replycontent2" name="content"></textarea>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                                            <button type="button" class="btn btn-primary" id="reply2post-btn">发送消息</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    </#list>
                                </#if>
                            </#if>
                        </#list>

                    </div>

                    <!-- Leave a comment -->
                    <div class="p-t-52">
                        <form id="comments-add-form" class="flex-w flex-sb">
                            <div class="w-full m-b-10">
                                <input type="hidden" name="parentId" value="-1">
                                <input type="hidden" name="ancestorId" value="-1">
                                <input type="hidden" name="newsId" value="${news.id}">
                                <input class="s-txt31 size22 cl-ph-1 bo6 input-focus-1 p-l-18 p-r-18 p-t-12"
                                      id="content" name="content" placeholder="评论..."/>
                            </div>
                        </form>
                        <div class="p-t-20">
                            <!-- Button -->
                                <#if logindeAccount??>
                                    <button id="commentpost-btn" class="btn-drive m-txt15 size24 bg2">发表评论</button>
                                <#else>
                                    <a href="/home/index/login" class="btn-drive m-txt15 size24 bg2">请先登录</a>
                                </#if>
                        </div>
                    </div>

                </div>


            </div>


            <div class="col-md-4 col-lg-3 p-b-50 ">
                <!-- Sidebar -->
                <div class="p-t-5">

                    <!-- Most Popular -->
                    <div class="p-t-54">
                        <h4 class="m-txt24 p-b-34">最受欢迎 </h4>
                        <ul>
                            <#list hitsTop5 as hitsTop>
                            <li class="flex-t p-b-26">
                                <a href="/home/news/details?id=${hitsTop.id}" class="dis-block wrap-pic-w w-size11 overlay1 m-r-17">
                                    <#if hitsTop.pic??>
                                        <#if hitsTop.pic?length gt 0>
                                            <img src="/photo/view?filename=${hitsTop.pic}" width="60px" height="60px" alt="IMG">
                                        <#else>
                                            <img src="/admin/images/default-head.jpg" alt="IMG">
                                        </#if>
                                    </#if>
                                </a>
                                <div class="w-size12 flex-col">
                                    <a href="/home/news/details?id=${hitsTop.id}" class="s-txt27 hov-color-main trans-03 p-b-13">${hitsTop.title}</a>
                                    <span class="s-txt28">${hitsTop.createTime}</span>
                                </div>
                            </li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </div>


        </div>
    </div>
</section>


<div class="bg3 txt-center p-t-19 p-b-16">
    <span class="s-txt10">@ 2018 AuThemes.</span>
    <a href="http://www.17sucai.com/" class="dis-inline s-txt11 hov-color-white trans-04">Get The Template</a>
</div>


<!-- 返回顶部 -->
<div class="btn-back-to-top hov-bg-main" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
</div>

<style>
    .jconfirm .jconfirm-box{
        right: 180px;
    }
</style>
<#include "../common/footer.ftl"/>
<#include "../common/footer-js.ftl"/>
<script src="/home/js/isotope.pkgd.min.js"></script>
<script src="/home/js/main.js"></script>
<script src="/home/js/common.js"></script>
<script src="/admin/js/jconfirm/jquery-confirm.min.js"></script>
<script type="text/javascript" src="/admin/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>


<script type="text/javascript">

    // 获取回复的用户id
    var M = {};
    function getCommenctid(pid,aid){
        M.pid = pid;
        M.aid = aid;
    }

    $(document).ready(function () {

        $("#commentpost-btn").click(function () {
            if (!checkForm("comments-add-form")) {
                return;
            }
            var content = $("#content").val();
            if(content == ""){
                showErrorMsg("请输入评论内容");
                return ;
            }
            var data = $("#comments-add-form").serialize();
            $.ajax({
                url: 'add',
                type: 'POST',
                data: data,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        showSuccessMsg('评论成功!', function () {
                            window.location.reload();
                        })
                    } else {
                        showErrorMsg(data.msg);
                    }
                },
            });
        });

        //提交按钮监听事件
        $("#reply1post-btn").click(function () {
            if (!checkForm("reply1-add-form")) {
                return;
            }
            var replycontent1 = $("#replycontent1").val();
            if(replycontent1 == ""){
                showErrorMsg("请输入回复内容");
                return ;
            }
            var data = $("#reply1-add-form").serialize();
            data += '&parentId=' + M.pid + '&ancestorId=' + M.aid;
            $.ajax({
                url: 'add',
                type: 'POST',
                data: data,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        showSuccessMsg('回复成功!', function () {
                            window.location.reload();
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


        //提交按钮监听事件
        $("#reply2post-btn").click(function () {
            if (!checkForm("reply2-add-form")) {
                return;
            }
            var replycontent2 = $("#replycontent2").val();
            if(replycontent2 == ""){
                showErrorMsg("请输入回复内容");
                return ;
            }
            var data = $("#reply2-add-form").serialize();
            data += '&parentId=' + M.pid + '&ancestorId=' + M.aid;
            $.ajax({
                url: 'add',
                type: 'POST',
                data: data,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        showSuccessMsg('回复成功!', function () {
                            window.location.reload();
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

</script>

</body>

</html>