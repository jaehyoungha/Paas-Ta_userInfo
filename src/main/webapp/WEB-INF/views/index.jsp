<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html dir="ltr" lang="en">
<head>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="airbnb, booking, city guide, directory, events, hotel booking, listings, marketing, places, restaurant, restaurant">
    <meta name="description" content="Guido - Directory & Listing HTML Template">
    <meta name="CreativeLayers" content="ATFN">
    <!-- css file -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- Responsive stylesheet -->
    <link rel="stylesheet" href="assets/css/responsive.css">
    <!-- Title -->
    <title>aga 어게인뉴</title>
    <!-- Favicon -->
    <link href="assets/images/favicon.ico" sizes="128x128" rel="shortcut icon" type="image/x-icon" />
    <link href="assets/images/favicon.ico" sizes="128x128" rel="shortcut icon" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<style>
    .home1-overlay:before {
        content: "";
        /*background-color: #095220;*/
        opacity: 0.7;
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        padding-top: 100%;
        width: 100%;
        height: 100%;
    }
    header.header-nav.menu_style_home_one .ace-responsive-menu > li > a, header.header-nav.menu_style_home_three .ace-responsive-menu > li > a, header.header-nav.menu_style_home_four .ace-responsive-menu > li > a, header.header-nav.menu_style_home_five .ace-responsive-menu > li > a, header.header-nav.menu_style_home_six .ace-responsive-menu > li > a, header.header-nav.menu_style_home_seven .ace-responsive-menu > li > a, header.header-nav.menu_style_home_eight .ace-responsive-menu > li > a {
        font-family: 'The110';
        padding: 33px 10px 30px;
    }
    body{
        font-family: 'The110';
        overflow-y: hidden;
    }
    .text{
        animation-name: text;
        animation-duration: 4s;
        animation-iteration-count: infinite;
        transition-timing-function: linear;
    }
    @keyframes text {
        from {
            transform: translateY(30px);
        }
        25% {
            transform: translateY(-15px);
        }
        50% {
            transform: translateY(15px);
        }
        75% {
            transform: translateY(-15px);
        }
        to {
            transform: translateY(30px);
        }
    }
    @font-face {
        font-family: 'The110';
        src: url('/assets/font/The110.ttf');
        font-weight: normal;
        font-style: normal;
    }
    @font-face {
        font-family: 'The120';
        src: url('/assets/font/The120.ttf');
        font-weight: normal;
        font-style: normal;
    }
    .home_adv_srch_form .search-btn {
        background: linear-gradient(297.21deg, #125d2e 0%, #125d2e 92.82%);
        border-radius: 50%;
        color: #ffffff;
        height: 50px;
        width: 50px;
        -webkit-transition: all .3s ease;
        -moz-transition: all .3s ease;
        -o-transition: all .3s ease;
        transition: all .3s ease;
    }
    .bg-img1 {
        background-image: url('/assets/images/background/a_back1.jpg');
        -webkit-background-size: cover;
        height: 100%;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
    }

    header.header-nav.menu_style_home_one ul.ace-responsive-menu li.add_listing {
        background-color: #125d2e;
        border-radius: 8px;
        height: 45px;
        position: relative;
        text-align: center;
        top: 20px;
        width: 160px;
    }

</style>
<div class="wrapper">
    <div class="preloader"></div>

    <!-- Main Header Nav -->
    <header class="header-nav menu_style_home_one navbar-scrolltofixed stricky main-menu">
        <div class="container-fluid p0">
            <!-- Ace Responsive Menu -->
            <nav>
                <!-- Menu Toggle btn-->
                <div class="menu-toggle">

                    <button type="button" id="menu-btn">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <a href="index.html" class="navbar_brand float-left dn-smd">



                    <strong><h1 style="font-size: 60px; color:#125d2e; font-weight: bold;">aga</h1></strong>
                </a>
                <!-- Responsive Menu Structure-->
                <!--Note: declare the Menu style in the data-menu-style="horizontal" (options: horizontal, vertical, accordion) -->
                <div class="ht_left_widget float-left">
                    <ul>
                        <li class="list-inline-item">
                            <div class="ht_search_widget">
                                <div class="header_search_widget home1">
                                    <form class="form-inline mailchimp_form" style="padding-top: 4%;">
                                        <a href="shoplist.jsp"><input type="text" class="custom_search_with_menu_trigger form-control"
                                                                      placeholder="공방 찾아보기"></a>
                                        <button type="submit" class="btn"><span class="flaticon-loupe"></span></button>
                                    </form>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div style="padding-right: 5%;">
                    <ul id="respMenu" class="ace-responsive-menu text-right" data-menu-style="horizontal">
                        <li>
                            <a href="#"><span class="title">공방</span></a>
                            <!-- Level Two-->
                            <ul>
                                <li><a href="index.html">공방 리뷰</a></li>
                                <li><a href="shoplist.jsp">공방 리스트</a></li>


                            </ul>
                        </li>
                        &nbsp;&nbsp;&nbsp;

                        <li>
                            <a href="#"><span class="title">환경트렌드</span></a>
                            <!-- Level Two-->
                        </li>&nbsp;&nbsp;&nbsp;

                        <li>
                            <a href="#"><span class="title">마이페이지</span></a>
                            <!-- Level Two-->
                            <ul>
                                <li><a href="index.html">찜한 공방</a></li>
                                <li><a href="index.html">마이 정보 수정</a></li>

                            </ul>
                        </li>&nbsp;&nbsp;&nbsp;

                        <li>
                            <a href="#"><span class="title">고객센터</span></a>
                            <!-- Level Two-->
                            <ul>
                                <li><a href="index.html">자주 묻는 질문</a></li>
                                <li><a href="index.html">1 : 1 문의하기</a></li>
                                <li><a href="index.html">내가 쓴 글</a></li>

                            </ul>
                        </li>&nbsp;&nbsp;&nbsp;

                        <li>

                        <li class="list-inline-item list_s">
                            <a href="http://localhost:10000/user/loginPage" class="btn flaticon-avatar">
                                <span class="dn-1200">login</span></a></li>

                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <!-- Modal -->


    <!-- Main Header Nav For Mobile -->


    <!-- Home Design -->
    <section class="home-one home1-overlay bg-img1">
        <div class="container">
            <div class="row posr">
                <div class="col-lg-12">
                    <div class="home_content home1">
                        <div class="home-text text-center">

                            <div class="text">  <h1 style="font-size: 130px; padding-top: -20%">aga</h1><br>
                                <h2 style="font-size: 26px">지구를 위한 리사이클링 공방을 찾습니다</h2>
                            </div>


                        </div>
                        <div class="row justify-content-center">
                            <div class="col-lg-10 col-xl-8">
                                <div class="home_adv_srch_opt text-center">
                                    <div class="wrapper">




                                        <br><br>
                                        <!-- Feature Properties -->



                                    </div>
                                    <!-- Wrapper End -->
                                    <script src="/assets/js/jquery-3.6.0.js"></script>
                                    <script src="/assets/js/jquery-migrate-3.0.0.min.js"></script>
                                    <script src="/assets/js/popper.min.js"></script>
                                    <script src="/assets/js/bootstrap.min.js"></script>
                                    <script src="/assets/js/jquery.mmenu.all.js"></script>
                                    <script src="/assets/js/ace-responsive-menu.js"></script>
                                    <script src="/assets/js/bootstrap-select.min.js"></script>
                                    <script src="/assets/js/isotop.js"></script>
                                    <script src="/assets/js/snackbar.min.js"></script>
                                    <script src="/assets/js/simplebar.js"></script>
                                    <script src="/assets/js/parallax.js"></script>
                                    <script src="/assets/js/scrollto.js"></script>
                                    <script src="/assets/js/jquery-scrolltofixed-min.js"></script>
                                    <script src="/assets/js/jquery.counterup.js"></script>
                                    <script src="/assets/js/wow.min.js"></script>
                                    <script src="/assets/js/progressbar.js"></script>
                                    <script src="/assets/js/slider.js"></script>
                                    <script src="/assets/js/timepicker.js"></script>
                                    <!-- Custom script for all pages -->
                                    <script src="/assets/js/script.js"></script>


</body>
</html>