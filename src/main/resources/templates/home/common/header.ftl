<!-- Header desktop -->
		<div class="container-menu-desktop">
            <div class="top-bar bg-main">
                <div class="container">
                    <div class="content-topbar">
                        <div class="left-top-bar">
                            <a href="/home/index/about">关于</a>
                            <a href="/home/news/list">新闻</a>
                               <#if ylrc_account??>
                                    <a href="javascript:accountLogout();">注销</a >
                               <#else>
                                    <a href="javascript:login();" >登录</a >
                                    <a href="javascript:register();">注册</a >
                               </#if>
                        </div>

                        <div class="right-top-bar">
							<span>
								<i class="icon_phone" aria-hidden="true"></i>
								<span>15361714046</span>
							</span>

                            <span>
								<i class="icon_pin" aria-hidden="true"></i>
								<span>肇庆</span>
							</span>

                            <span>
								<i class="icon_clock" aria-hidden="true"></i>
								<span>09:30 am – 06:00 pm</span>
							</span>
                            <span>
                                <span>
                                    欢迎
                                    <#if ylrc_account??>
                                         <font style="color: green;font-weight: bold;">${ylrc_account.username}</font>
                                    <#else>
                                    </#if>
                                    来到肇庆驾校【官网】!
                                </span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="wrap-menu-desktop">
                <div class="limiter-menu-desktop">

                    <!-- Logo desktop -->
                    <a href="/home/index/index" class="logo">
                        肇庆学院驾校
                    </a>

                    <!-- Menu desktop -->
                    <div class="menu-desktop">
                        <ul class="main-menu">
                            <li>
                                <a href="/home/index/index">首页</a>
                                <ul class="sub-menu">
                                    <li><a href="/home/index/index">首页</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="/home/course/list">课程</a>
                                <ul class="sub-menu">
                                    <li><a href="/home/course/list">课程列表</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="/home/index/picture">照片库</a>
                            </li>

                            <li>
                                <a href="/home/news/list">新闻</a>
                            </li>
                            <li>
                                <a href="/home/index/myInfo">个人中心</a>
                            </li>

                            <li class="respon-sub-menu">
                                <a href="/home/index/about">关于</a>
                            </li>
                            <li class="respon-sub-menu">
                                <a href="/home/leave_word/add">反馈</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    <#if ylrc_auth != 1>
    <div class="top-nav" id="show-copyright">
        <div class="container fn-clear" align="center">
            <p style="color:red;font-size:16px;">
                本系统由<a href="https://www.yuanlrc.com/product/details.html?pid=413">【猿来入此】</a>发布，请认准官网获取，官网获取的正版源码提供免费更新升级！
                <a href="javascript:alert('请登录后台首页填写订单号进行验证，验证通过后刷新此页面，版权信息会自动消失！')" id="order-auth-btn">点此去版权</a>
                <a href="https://www.yuanlrc.com/">点此进入官网</a>
            </p>
        </div>
    </div>
    </#if>
<!-- Header Mobile -->
    <div class="wrap-header-mobile">
        <!-- Logo moblie -->
        <a href="/home/index/index" class="logo-mobile">

        </a>


        <!-- Button show menu -->
        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
        </div>

    </div>
    <!-- Menu Mobile -->
    <div class="menu-mobile">
        <ul class="topbar-mobile">
            <li class="bo1-b p-t-8 p-b-8">
                <div class="left-top-bar p-l-7">
                    <a href="#">关于</a>
                    <a href="#">新闻</a>
                      <#if ylrc_account??>
                          <a href="javascript:accountLogout();">注销</a >
                      <#else>
                          <a href="javascript:login();" >登录</a >
                          <a href="javascript:register();">注册</a >
                      </#if>
                </div>
            </li>

            <li class="right-top-bar bo1-b p-t-8 p-b-8">
					<span>
						<i class="icon_phone" aria-hidden="true"></i>
						<span>15361714046</span>
					</span>
            </li>

            <li class="right-top-bar bo1-b p-t-8 p-b-8">
					<span>
						<i class="icon_pin" aria-hidden="true"></i>
						<span>肇庆</span>
					</span>
            </li>

            <li class="right-top-bar bo1-b p-t-8 p-b-8">
					<span>
						<i class="icon_clock" aria-hidden="true"></i>
						<span>09:30 am – 06:00 pm</span>
					</span>
            </li>
            <li class="right-top-bar bo1-b p-t-8 p-b-8">
                 <span>
                    <span>
                        欢迎
                        <#if ylrc_account??>
                             <font style="color: green;font-weight: bold;">${ylrc_account.username}*</font>
                        <#else>
                        </#if>
                        来到【官网】!
                    </span>
                </span>
            </li>
        </ul>

        <ul class="main-menu-m bg-main">
            <li class="bg-main">
                <a href="/home/index/index">首页</a>
                <ul class="sub-menu-m">
                    <li><a href="/home/index/index">首页</a></li>
                </ul>
                <span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
            </li>

            <li class="bg-main">
                <a href="/home/course/list">课程</a>
                <span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
            </li>

            <li class="bg-main">
                <a href="/home/index/picture">照片库</a>
                <span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
                </span>
            </li>

            <li class="bg-main">
                <a href="/home/news/list">新闻</a>
                <span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
            </li>

            <li class="bg-main">
                <a href="/home/index/about">关于</a>

                <span class="arrow-main-menu-m">
                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                </span>
            </li>
            <li class="bg-main">
                <a href="/home/index/myInfo">个人中心</a>

                <span class="arrow-main-menu-m">
                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                </span>
            </li>
            <li class="bg-main">
                <a href="contact.html">反馈</a>
            </li>
        </ul>
    </div>
