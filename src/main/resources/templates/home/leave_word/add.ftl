<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <title>Contact</title>
    <meta charset="UTF-8">
    <meta name="description" content="AuCreative theme tempalte">
    <meta name="author" content="AuCreative">
    <meta name="keywords" content="AuCreative theme template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="/admin/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/admin/css/style.min.css" rel="stylesheet">
    <#include "../common/common.ftl"/>
    <!--对话框-->
    <link rel="stylesheet" href="/admin/js/jconfirm/jquery-confirm.min.css">
</head>
<body class="animsition restyle-index">

<#include "../common/header.ftl"/>

<section class="p-t-65 p-b-60">
    <div class="container">
        <div class="row">
            <div class="col-md-7 col-lg-8 p-b-50">

                    <h3 class="m-txt28 rs1-color p-b-40">联系我们</h3>

                    <form id="contact-add-form" class="flex-w flex-sb validate-form">
                        <div class="w-full m-b-20 validate-input">
                            <input type="text" class="s-txt31 size22 cl-ph-1 bo6 input-focus-1 bo-rad-2 p-l-18 p-r-18 p-t-12" name="content" id="content" placeholder="想说的话"/>
                        </div>
                    </form>
                <div>
                    <button class="btn-drive m-txt1 size26 bg-main hov-color-white bo-rad-4" id="add-form-submit-btn">发送</button>
                </div>
            </div>
        </div>
    </div>
</section>


<style>
    .jconfirm .jconfirm-box{
        right: 180px;
    }
</style>
<#include "../common/footer.ftl"/>
<#include "../common/footer-js.ftl"/>
<!--===============================================================================================-->
<script src="/home/js/isotope.pkgd.min.js"></script>
<script src="/home/js/main.js"></script>
<script src="/home/js/common.js"></script>
<script src="/admin/js/jconfirm/jquery-confirm.min.js"></script>
<script type="text/javascript" src="/admin/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {

        $("#add-form-submit-btn").click(function () {
            if (!checkForm("contact-add-form")) {
                return;
            }
            var content = $("#content").val();
            if(content == ""){
                showErrorMsg("请输入留言反馈内容");
                return ;
            }
            var data = $("#contact-add-form").serialize();
            $.ajax({
                url: 'add',
                type: 'POST',
                data: data,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        showSuccessMsg('留言反馈成功!', function () {
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