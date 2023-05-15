<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>${siteName!""}|课程表管理-${title!""}</title>
<#include "../common/header.ftl"/>
    <style>
        td {
            vertical-align: middle;
        }
    </style>
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
                            <div class="card-toolbar clearfix">
                                <form class="pull-right search-bar" method="get" action="list" role="form">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <button class="btn btn-default dropdown-toggle" id="search-btn"
                                                    data-toggle="dropdown" type="button" aria-haspopup="true"
                                                    aria-expanded="false">
                                                课程标题 <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><a tabindex="-1" href="javascript:void(0)"
                                                       data-field="courses.title">课程标题 </a></li>
                                            </ul>
                                        </div>
                                        <input type="text" class="form-control" value="${courseTitle!""}" name="courses.title"
                                               placeholder="请输入课程标题 ">
                                        <span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">搜索</button>
                    </span>
                                    </div>
                                </form>
                <#include "../common/third-menu.ftl"/>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>
                                                <label class="lyear-checkbox checkbox-primary">
                                                    <input type="checkbox" id="check-all"><span></span>
                                                </label>
                                            </th>
                                            <th>课程标题</th>
                                            <th>课程教练</th>
                                            <th>开始日期</th>
                                            <th>结束日期</th>
                                            <th>开始时间</th>
                                            <th>结束时间</th>
                                            <th>时间段</th>
                                            <th>添加时间</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                      <#if pageBean.content?size gt 0>
                      <#list pageBean.content as schedule>
                            <tr>
                                <td style="vertical-align:middle;">
                                    <label class="lyear-checkbox checkbox-primary">
                                        <input type="checkbox" name="ids[]" value="${schedule.id}"><span></span>
                                    </label>
                                </td>
                                <td style="vertical-align:middle;">${schedule.courses.title}</td>
                                <td style="vertical-align:middle;width: 100px;">${schedule.courses.coach.name}</td>

                                <td style="vertical-align:middle;"style="vertical-align:middle;"><font class="text-success">${schedule.startDate?string('yyyy-MM-dd')}</font></td>
                                <td style="vertical-align:middle;"style="vertical-align:middle;"><font class="text-success">${schedule.endDate?string('yyyy-MM-dd')}</font></td>
                                <td style="vertical-align:middle;"style="vertical-align:middle;"><font class="text-success">${schedule.startTime}</font></td>
                                <td style="vertical-align:middle;"style="vertical-align:middle;"><font class="text-success">${schedule.endTime}</font></td>
                                <td style="vertical-align:middle;"style="vertical-align:middle;"><font class="text-success">${schedule.slot}</font></td>
                                <td style="vertical-align:middle;" style="vertical-align:middle;">
                                    <font class="text-success">${schedule.createTime}</font></td>
                            </tr>
                      </#list>
                      <#else>
                    <tr align="center">
                        <td colspan="11">这里空空如也！</td>
                    </tr>
                      </#if>
                                        </tbody>
                                    </table>
                                </div>
                <#if pageBean.total gt 0>
                <ul class="pagination ">
                  <#if pageBean.currentPage == 1>
                  <li class="disabled"><span>«</span></li>
                  <#else>
                  <li><a href="list?courses.title=${courseTitle!""}&currentPage=1">«</a></li>
                  </#if>
                  <#list pageBean.currentShowPage as showPage>
                      <#if pageBean.currentPage == showPage>
                  <li class="active"><span>${showPage}</span></li>
                      <#else>
                  <li><a href="list?courses.title=${courseTitle!""}&currentPage=${showPage}">${showPage}</a></li>
                      </#if>
                  </#list>
                  <#if pageBean.currentPage == pageBean.totalPage>
                  <li class="disabled"><span>»</span></li>
                  <#else>
                  <li><a href="list?courses.title=${courseTitle!""}&currentPage=${pageBean.totalPage}">»</a></li>
                  </#if>
                    <li><span>共${pageBean.totalPage}页,${pageBean.total}条数据</span></li>
                </ul>
                </#if>
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
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

    });

    function del(url) {
        if ($("input[type='checkbox']:checked").length != 1) {
            showWarningMsg('请选择一条数据进行删除！');
            return;
        }
        var id = $("input[type='checkbox']:checked").val();
        $.confirm({
            title: '确定删除？',
            content: '删除后数据不可恢复，请慎重！',
            buttons: {
                confirm: {
                    text: '确认',
                    action: function () {
                        deleteReq(id, url);
                    }
                },
                cancel: {
                    text: '关闭',
                    action: function () {

                    }
                }
            }
        });
    }

    //打开编辑页面
    function edit(url) {
        if ($("input[type='checkbox']:checked").length != 1) {
            showWarningMsg('请选择一条数据进行编辑！');
            return;
        }
        window.location.href = url + '?id=' + $("input[type='checkbox']:checked").val();
    }

    //调用删除方法
    function deleteReq(id, url) {
        $.ajax({
            url: url,
            type: 'POST',
            data: {id: id},
            dataType: 'json',
            success: function (data) {
                if (data.code == 0) {
                    showSuccessMsg('课程表删除成功!', function () {
                        $("input[type='checkbox']:checked").parents("tr").remove();
                    })
                } else {
                    showErrorMsg(data.msg);
                }
            },
            error: function (data) {
                alert('网络错误!');
            }
        });
    }
</script>
</body>
</html>