<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <title>About Team</title>
    <meta charset="UTF-8">
    <meta name="description" content="AuCreative theme tempalte">
    <meta name="author" content="AuCreative">
    <meta name="keywords" content="AuCreative theme template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <#include "../common/common.ftl"/>

</head>
<body class="animsition restyle-index">

<#include "../common/header.ftl"/>

<!-- Content -->
<section class="p-t-63 p-b-50">
    <div class="container">
        <div class="row">
            <div class="col-md-7 col-lg-8 p-b-30">
                <div>
                    <h4 class="m-txt21 p-b-22">
                        ${coach.name}
                    </h4>

                    <span class="s-txt22 dis-block p-b-19">
						${coach.coachType.name}
					</span>


                    <div class="bo5-l p-l-54 p-t-15 p-b-20 m-b-28 m-t-32">
                        <p class="m-txt22">
                            ${coach.signature}
                        </p>
                    </div>

                    <p class="s-txt2">
						${coach.introduce}
                    </p>
                </div>
            </div>

            <div class="col-md-5 col-lg-4 p-b-30">
                <!-- Block 5 -->
                <div class="block-5 p-t-7">
                    <div class="wrap-pic-b5 wrap-pic-w bo2">
                        <#if coach.headPic??>
							<#if coach.headPic?length gt 0>
								<img src="/photo/view?filename=${coach.headPic}" alt="IMG-INSTRUCTOR">
							<#else>
								<img src="/admin/images/default-head.jpg" alt="IMG-INSTRUCTOR" >
							</#if>
						<#else>
							<img src="/admin/images/default-head.jpg" alt="IMG-INSTRUCTOR">
						</#if>
                    </div>

                    <div class="wrap-text-b5 p-t-18">
                        <span class="dis-block s-txt14">
								Phone: ${coach.phone}
							</span>

                        <span class="dis-block s-txt14">
								Email: ${coach.email}
							</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<#include "../common/footer.ftl"/>

<!-- Back to top -->
<div class="btn-back-to-top hov-bg-main" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
</div>

<#include "../common/footer-js.ftl"/>
<script src="/home/js/main.js"></script>

</body>
</html>