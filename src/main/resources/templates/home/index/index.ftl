<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <title>驾校管理</title>
    <meta charset="UTF-8">
    <meta name="description" content="AuCreative theme tempalte">
    <meta name="author" content="AuCreative">
    <meta name="keywords" content="AuCreative theme template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<#include "../common/common.ftl"/>
</head>
<body class="animsition restyle-index">

<header>
		<#include "../common/header.ftl" />
</header>

<!-- Slide -->
<section class="slider">
    <div class="rev_slider_wrapper fullwidthbanner-container rs1-revo">
        <div id="rev_slider_1" class="rev_slider fullwidthabanner" data-version="5.4.5" style="display:none">
            <ul>
                <!-- Slide 1 -->
                <li data-transition="fade">
                    <img src="/home/picture/slide-01.jpg" alt="IMG-SLIDE" class="rev-slidebg">

                    <h2 class="tp-caption tp-resizeme txt1 txt-center p-l-15 p-r-15"
                        data-frames='[{"delay":500,"speed":1500,"frame":"0","from":"x:left;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                        data-x="center"
                        data-y="center"
                        data-width="['1200','992','768','480']"
                        data-hoffset="['0','0','0','0']"
                        data-voffset="['-85','-85','-85','-160']"
                        data-fontsize="['50', '50', '50', '50']"
                        data-lineheight="['60', '60', '60', '60']"
                        data-height="['auto']"
                    >欢迎</h2>

                    <p class="tp-caption tp-resizeme txt2 txt-center p-l-15 p-r-15"
                       data-frames='[{"delay":1500,"speed":1500,"frame":"0","from":"x:right;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                       data-x="center"
                       data-y="center"
                       data-width="['780','780','780','480']"
                       data-hoffset="['0','0','0','0']"
                       data-voffset="['-10','-10','-10','-50']"
                       data-fontsize="['18', '18', '18', '16']"
                       data-lineheight="['30', '30', '30', '30']"
                       data-height="['auto']"
                    >来到驾校
                    </p>

                    <div class="tp-caption tp-resizeme wrap-btn-slide"
                         data-frames='[{"delay":3000,"speed":1500,"frame":"0","from":"y:bottom;rX:-20deg;rY:-20deg;rZ:0deg;","to":"o:1;","ease":"Power3.easeOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                         data-x="center"
                         data-y="center"
                         data-hoffset="['0','0','0','0']"
                         data-voffset="['75','75','75','90']"
                         data-height="['auto']">
                        <div class="p-l-10 p-r-10 p-t-5 p-b-5">
                            <!-- Button -->
                            <a href="/home/index/about" class="btn-drive size1 m-txt1 bg-main bo-rad-4 trans-03">
                                我们的服务
                                <i class="fa fa-chevron-right m-l-9 fs-14" aria-hidden="true"></i>
                            </a>
                        </div>

                        <div class="p-l-10 p-r-10 p-t-5 p-b-5">
                            <!-- Button -->
                            <a href="/home/course/list" class="btn-drive size1 m-txt2 bgwhite bo-rad-4 trans-03">
                                更多课程
                                <i class="fa fa-chevron-right m-l-9 fs-14" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>

                </li>

                <!-- Slide 2 -->
                <li data-transition="fade">
                    <img src="/home/picture/slide-02.jpg" alt="IMG-SLIDE" class="rev-slidebg">

                    <h2 class="tp-caption tp-resizeme txt1 txt-center p-l-15 p-r-15"
                        data-frames='[{"delay":500,"speed":1500,"frame":"0","from":"y:top;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                        data-x="center"
                        data-y="center"
                        data-width="['1200','992','768','480']"
                        data-hoffset="['0','0','0','0']"
                        data-voffset="['-85','-85','-85','-160']"
                        data-fontsize="['50', '50', '50', '50']"
                        data-lineheight="['60', '60', '60', '60']"
                        data-height="['auto']"
                    >学习</h2>

                    <p class="tp-caption tp-resizeme txt2 txt-center p-l-15 p-r-15"
                       data-frames='[{"delay":1500,"speed":1500,"frame":"0","from":"y:bottom;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                       data-x="center"
                       data-y="center"
                       data-width="['780','780','780','480']"
                       data-hoffset="['0','0','0','0']"
                       data-voffset="['-10','-10','-10','-50']"
                       data-fontsize="['18', '18', '18', '16']"
                       data-lineheight="['30', '30', '30', '30']"
                       data-height="['auto']"
                    >课程
                    </p>

                    <div class="tp-caption tp-resizeme wrap-btn-slide"
                         data-frames='[{"delay":3000,"speed":1500,"frame":"0","from":"z:0;rX:0;rY:0;rZ:0;sX:0.8;sY:0.8;skX:0;skY:0;opacity:0;","to":"o:1;","ease":"Power4.easeOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                         data-x="center"
                         data-y="center"
                         data-hoffset="['0','0','0','0']"
                         data-voffset="['75','75','75','90']"
                         data-height="['auto']">
                        <div class="p-l-10 p-r-10 p-t-5 p-b-5">
                            <!-- Button -->
                            <a href="/home/index/about" class="btn-drive size1 m-txt1 bg-main bo-rad-4 trans-03">
                                我们的服务
                                <i class="fa fa-chevron-right m-l-9 fs-14" aria-hidden="true"></i>
                            </a>
                        </div>

                        <div class="p-l-10 p-r-10 p-t-5 p-b-5">
                            <!-- Button -->
                            <a href="/home/course/list" class="btn-drive size1 m-txt2 bgwhite bo-rad-4 trans-03">
                                更多课程
                                <i class="fa fa-chevron-right m-l-9 fs-14" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                </li>

                <!-- Slide 3 -->
                <li data-transition="fade">
                    <img src="/home/picture/slide-03.jpg" alt="IMG-SLIDE" class="rev-slidebg">

                    <h2 class="tp-caption tp-resizeme txt1 txt-center p-l-15 p-r-15"
                        data-frames='[{"delay":500,"speed":1500,"frame":"0","from":"x:-500px;skX:85px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                        data-x="center"
                        data-y="center"
                        data-width="['1200','992','768','480']"
                        data-hoffset="['0','0','0','0']"
                        data-voffset="['-85','-85','-85','-160']"
                        data-fontsize="['50', '50', '50', '50']"
                        data-lineheight="['60', '60', '60', '60']"
                        data-height="['auto']"
                    >一起</h2>

                    <p class="tp-caption tp-resizeme txt2 txt-center p-l-15 p-r-15"
                       data-frames='[{"delay":1500,"speed":1500,"frame":"0","from":"x:500px;skX:-85px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                       data-x="center"
                       data-y="center"
                       data-width="['780','780','780','480']"
                       data-hoffset="['0','0','0','0']"
                       data-voffset="['-10','-10','-10','-50']"
                       data-fontsize="['18', '18', '18', '16']"
                       data-lineheight="['30', '30', '30', '30']"
                       data-height="['auto']"
                    >成长
                    </p>

                    <div class="tp-caption tp-resizeme wrap-btn-slide"
                         data-frames='[{"delay":3000,"speed":1500,"frame":"0","from":"y:bottom;rZ:90deg;sX:2;sY:2;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                         data-x="center"
                         data-y="center"
                         data-hoffset="['0','0','0','0']"
                         data-voffset="['75','75','75','90']"
                         data-height="['auto']">
                        <div class="p-l-10 p-r-10 p-t-5 p-b-5">
                            <!-- Button -->
                            <a href="/home/index/about" class="btn-drive size1 m-txt1 bg-main bo-rad-4 trans-03">
                                我们的服务
                                <i class="fa fa-chevron-right m-l-9 fs-14" aria-hidden="true"></i>
                            </a>
                        </div>

                        <div class="p-l-10 p-r-10 p-t-5 p-b-5">
                            <!-- Button -->
                            <a href="/home/course/list" class="btn-drive size1 m-txt2 bgwhite bo-rad-4 trans-03">
                                更多课程
                                <i class="fa fa-chevron-right m-l-9 fs-14" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                </li>


            </ul>
        </div>
    </div>
</section>


<div style="height: 50%; width: 50%;"></div>

<!-- 感言 -->
<section class="testimonial">
    <div class="wrap-testimonial parallax100 bg-overlay-3 p-t-75 p-b-80" style="background-image: url('/home/images/testimonial-bg-01.jpg');">
        <div class="wrap-slide-slick-1">
            <div class="p-b-40">
                <h3 class="m-txt6 txt-center p-b-8 respon1">推荐</h3>
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




<!-- Map -->
<div class="map">
    <div class="contact-map h-size1" id="google_map" data-map-x="40.648578" data-map-y="-73.962730"
         data-pin="images/icons/favicon.png" data-scrollwhell="0" data-draggable="1" data-zoom="15"></div>
</div>
<#include "../common/footer.ftl"/>
<#include "../common/footer-js.ftl"/>
<script src="/home/js/31e5c13de5564e6aae12101b95eb39d7.js"></script>
<script src="/home/js/map-custom.js"></script>
<script src="/home/js/main.js"></script>
</body>
</html>