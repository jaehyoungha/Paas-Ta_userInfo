<%--
  Created by IntelliJ IDEA.
  User: lowel
  Date: 2022-11-06
  Time: 오후 2:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.UserDTO" %>
<%@ page import="kopo.poly.dto.FileDTO" %>
<%@ page import="java.lang.reflect.Member" %>
<%
    String userId = (String) session.getAttribute("userId");
    String userEmail = (String) request.getAttribute("userEmail");
    UserDTO uDTO = (UserDTO) request.getAttribute("uDTO");
    if (uDTO == null) {
        uDTO = new UserDTO();
    }
    FileDTO fDTO = (FileDTO) request.getAttribute("fDTO");
    if (fDTO == null) {
        fDTO = new FileDTO();
    }
%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="airbnb, booking, city guide, directory, events, hotel booking, listings, marketing, places, restaurant, restaurant">
    <meta name="description" content="Guido - Directory & Listing HTML Template">
    <meta name="CreativeLayers" content="ATFN">
    <!-- css file -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/dashbord_navitaion.css">
    <!-- Responsive stylesheet -->
    <link rel="stylesheet" href="/assets/css/responsive.css">
    <!-- Title -->
    <title>Guido - Directory & Listing HTML Template</title>
    <!-- Favicon -->
    <link href="/assets/images/favicon.ico" sizes="128x128" rel="shortcut icon" type="image/x-icon" />
    <link href="/assets/images/favicon.ico" sizes="128x128" rel="shortcut icon" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="wrapper">
    <div class="preloader"></div>

    <!-- Main Header Nav -->
    <header class="header-nav menu_style_home_one style2 dashbord menu-fixed main-menu">
        <div class="container-fluid p0">
            <!-- Ace Responsive Menu -->
            <nav>
                <!-- Menu Toggle btn-->
                <div class="menu-toggle">
                    <img class="nav_logo_img img-fluid" src="images/header-logo.svg" alt="header-logo.svg">
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
                            <a href="#"><span class="title">공방 리스트</span></a>
                            <!-- Level Two-->

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
                                <li><a href="index.html">나의 리뷰</a></li>
                                <li><a href="index.html">마이 정보 수정</a></li>

                            </ul>
                        </li>&nbsp;&nbsp;&nbsp;

                        <li>
                            <a href="#"><span class="title">고객센터</span></a>
                            <!-- Level Two-->
                            <ul>
                                <li><a href="index.html">자주 묻는 질문</a></li>
                                <li><a href="index.html">1:1 문의하기</a></li>
                                <li><a href="index.html">내가 쓴 글</a></li>

                            </ul>
                        </li>&nbsp;&nbsp;&nbsp;

                        <li>

                        <li class="list-inline-item list_s">
                            <a href="a_signup.html" class="btn flaticon-avatar">
                                <span class="dn-1200">login</span></a></li>

                    </ul>
                </div>
            </nav>
        </div>
    </header>

    <!-- Main Header Nav For Mobile -->

    <!-- Search Field Modal -->
    <section class="modal fade search_dropdown" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="popup_modal_wrapper">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12">
                                    <a class="close closer" data-dismiss="modal" aria-label="Close" href="#"><span><img src="images/icons/close.svg" alt=""></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 mb30">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </section>

    <!-- Our Dashbord -->

    <!-- Our Dashbord -->
    <section class="our-dashbord dashbord bgc-f4">
        <div class="container">
            <div class="row">

                <div class="col-lg-12 mb10">
                    <div class="breadcrumb_content style2">
                        <h2 class="breadcrumb_title float-left" style="padding-left: 17%; color: #fff; padding-top: 10%">마이 정보 수정</h2>

                    </div>
                </div>
                <div class="col-lg-15">
                    <div class="row"  style="padding-left: 22%">
                        <div class="col-xl-8">
                            <div class="my_dashboard_profile mb30-lg" style="padding-top: 15%">
                                <h4 class="mb30">프로필 바꾸기</h4>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="wrap-custom-file mb50">

                                            <input type="file" name="fileUpload" id="fileUpload"  accept=".gif, .jpg, .png"/>
                                            <label for="fileUpload">
                                                <span>사진 변경하기</span>
                                                <small class="file_title">최대 크기: 10 MB.</small>
                                            </label>
                                            <a class="text-thm tdu photo_delete" href="#">Delete</a>
                                        </div>
                                        <button type="button" onclick="s3Upload()">업로드</button>
                                    </div>
                                    <form action="/user/doUpdate" method="post">
                                    <div class="col-lg-12">
                                        <div class="my_profile_setting_input form-group mt100-500">
                                            <label for="userId" style="width: 500px;">아이디</label>
                                            <input type="text" name="userId" value="<%=uDTO.getUserId()%>" class="form-control" id="userId" readonly>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="my_profile_setting_input form-group">
                                            <label for="userName">이름</label>
                                            <input type="text"  name="userName" value="<%=uDTO.getUserName()%>" class="form-control" id="userName">
                                        </div>
                                        <div id="userNameCheck"></div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="my_profile_setting_input form-group">
                                            <label for="userPwd">비밀번호</label>
                                            <input type="password"  name="userPwd" class="form-control" id="userPwd">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="my_profile_setting_input form-group">
                                            <label for="checkPwd">비밀번호 확인</label>
                                            <input type="password" name="userPwd" class="form-control" id="checkPwd" onkeyup="pwdConfirm()">
                                        </div>
                                        <div id="pwdCheck"></div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="my_profile_setting_input form-group">
                                            <label for="userEmail">이메일</label>
                                            <input type="email" name="userEmail"  value="<%=uDTO.getUserEmail()%>" class="form-control" id="userEmail">
                                            <button type="button" onclick="doSendmail();" style="display:inline-block">인증번호 발송</button>
                                        </div>
                                        <div id="emailCheck"></div>
                                    </div>
                                        <div class="col-lg-12">
                                            <div class="my_profile_setting_input form-group">
                                                <label for="authEmail">인증번호</label>
                                                <input type="text" class="form-control" id="authEmail">
                                            </div>
                                            <div id="authCheck"></div>
                                        </div>
                                    <div class="col-lg-12">
                                        <div class="my_profile_setting_input form-group">
                                            <label for="PhoneNumber">전화번호</label>
                                            <input type="tel"  name="PhoneNumber" value="<%=uDTO.getPhoneNumber()%>" class="form-control" id="PhoneNumber">
                                        </div>
                                        <div id="PhoneNumberCheck"></div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="my_profile_setting_input form-group">
                                            <label for="addr1">우편번호</label>
                                            <input type="text" name="addr1"  value="<%=uDTO.getAddr1()%>" class="form-control" id="addr1" readonly>
                                            <button type="button" style="display:inline-block" onclick="kakaoPost(this.form)">우편번호찾기</button>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="my_profile_setting_input form-group">
                                            <label for="addr2">상세주소</label>
                                            <input type="text" name="addr2"  value="<%=uDTO.getAddr2()%>" class="form-control" id="addr2">
                                        </div>
                                    </div>
                                    <div class="col-xl-12">
                                        <div class="my_profile_setting_input">
                                            <input type="submit" class="btn update_btn" onclick="Checkfield(); return false;" value="저장하기"/>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
</div>
</div>
</div>
</div>
</div>
</section>

<!-- Our Footer -->
<section class="footer_one home1">
    <div class="container pb70">
        <div class="row">
            <div class="col-sm-6 col-md-6 col-lg-3 col-xl-3">
                <div class="footer_contact_widget">
                    <h4>Contact Us</h4>
                    <ul class="list-unstyled">
                        <li class="text-white df"><span class="flaticon-pin mr15"></span><a href="#">서울특별시 강서구 화곡동 우장산로10길 112</a></li>
                        <li class="text-white"><span class="flaticon-phone mr15"></span><a href="#">82+ 010-9962-6997</a></li>
                        <li class="text-white"><span class="flaticon-email mr15"></span><a href="#">lowell0322@naver.com</a></li>
                    </ul>
                </div>
            </div>

            <hr>
            <div class="container pt20 pb30">
                <div class="row">
                    <div class="col-md-4 col-lg-4">
                        <div class="copyright-widget mt10 mb15-767">
                            <p>© aga - All rights reserved.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-4">
                        <div class="footer_logo_widget text-center mb15-767">
                            <div class="wrapper">
                                <div class="logo text-center">

                                    <span class="logo_title text-white pl15">aga</span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
</section>
<a class="scrollToHome" href="#"><i class="fa fa-angle-up"></i></a>
</div>
<!-- Wrapper End -->
<script src="/assets/js/jquery-3.6.0.js"></script>
<script src="/assets/js/jquery-migrate-3.0.0.min.js"></script>
<script src="/assets/js/popper.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/jquery.mmenu.all.js"></script>
<script src="/assets/js/ace-responsive-menu.js"></script>
<script src="/assets/js/bootstrap-select.min.js"></script>
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
<script src="/assets/js/wow.min.js"></script>
<script src="/assets/js/smartuploader.js"></script>
<script src="/assets/js/dashboard-script.js"></script>
<!-- Custom script for all pages -->
<script src="/assets/js/script.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
    function pwdConfirm() {
        /* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
        /* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
        /* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
        let user_Pwd = document.getElementById("userPwd");					//비밀번호
        let check_Pwd = document.getElementById("checkPwd");	//비밀번호 확인 값
        let msg = document.getElementById("pwdCheck");				//확인 메세지
        let correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
        let wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔

        if(user_Pwd.value == check_Pwd.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
            msg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
            msg.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
        }else{
            msg.style.color = wrongColor;
            msg.innerHTML ="비밀번호 불일치";
        }
    }

    function doSendmail() {
        $.ajax({
            url: "/user/sendmail",
            type: "post",
            data: $("#userEmail"),
            /*dataType이란 내가 반환받을 데이터의 형태를 명시해주는 것*/
            dataType: 'json',
            success(pMap) {
                let data = pMap["res"];
                randomPin = pMap["ramdomPin"];
                if (data == 1) {
                    $("#sendmail_result").text("메일발송이 완료되었습니다 .");
                    $("#sendmail_result").css("color", "blue");
                } else {
                    $("#sendmail_result").text("이메일을 다시 입력해주세요.");
                    $("#sendmail_result").css("color", "red");

                }
            }
        });
    }
    function kakaoPost(f) { // 주소 우편번호 찾기
        new daum.Postcode({
            oncomplete: function (data) {
                let address = data.address;f
                let zonecode = data.zonecode;
                f.addr1.value = "(" + zonecode + ")" +address
            }
        }).open();
    }
    function Checkfield() {
        if ($("#userId").val().trim() === "") {
            alert("아이디를 입력하세요.");
            return false;
        }
        if ($("#userName").val().trim() === "") {
            alert("이름을 입력하세요.");
            return false;
        }
        if ($("#userPwd").val().trim() === "") {
            alert("비밀번호를 입력하세요.");
            return false;
        }
        if ($("#checkPwd").val().trim() === "") {
            alert("비밀번호 확인을 입력하세요.");
            return false;
        }
        if ($("#userEmail").val().trim() === "") {
            alert("이메일을 입력하세요.");
            return false;
        }
        if ($("#PhoneNumber").val().trim() === "") {
            alert("전화번호를 입력하세요.");
            return false;
        }
        if ($("#addr2").val().trim() === "") {
            alert("상세주소를 입력하세요.");
            return false;
        }
        if (randomPin !== $("#authEmail").val()) {
            alert("잘못된 인증번호입니다.");
            return false;
        }
    }
    function s3Upload () {
            let formData = new FormData();
            let fileUpload = $('input[name="fileUpload"]').get(0).files[0];
            formData.append('fileUpload',fileUpload)
            $.ajax({
                url: "/uploadS3",
                type: "post",
                processData:false,
                contentType: false,
                data: formData,
                success : function (json) {
                    alert("등록되었습니다.");
                },
                error : function (xhr, status, error) {
                    alert("등록에 실패했습니다." + error)
                }
            });
        }
</script>
</body>
</html>