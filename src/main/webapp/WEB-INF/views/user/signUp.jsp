<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>회원가입</title>
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type = "text/javascript">
        function idCheck() { // 아이디 중복검사
            let userId = document.getElementById("userId").value; //자바스크립트
            console.log("userId", id);
            let userId2 = $("#userId").val(); //제이쿼리
            console.log("userId2", userId2);

            $.ajax({
                url: "/user/idcheck", //어디로 통신할지
                data: $("#userId"),
                type: "post",
                success(data) {
                    console.log("data", data);
                    if (data == 1) { //1은 존재하는거니까 중복확인이니까 -> 1이면 데이터 받았다고 성공이 아니라서 컬러를 red로 준거임
                        $("#id_result").text("중복");
                        $("#id_result").css("color", "red");
                    } else {
                        $("#id_result").text("중복된 아이디가 없습니다 성공");
                        $("#id_result").css("color", "blue");
                    }
                }
            });
        }
        function pwdConfirm() {
            /* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
            /* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
            /* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
            var userPwd = document.getElementById('userPwd');					//비밀번호
            var userPwd2 = document.getElementById('userPwd2');	//비밀번호 확인 값
            var msg = document.getElementById('pwd2_check');				//확인 메세지
            var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
            var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔

            if(userPwd.value == userPwd2.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
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
                        $("#sendmail_result").text("메일발송이 완료되었습니다.");
                        $("#sendmail_result").css("color", "blue");
                    } else {
                        $("#sendmail_result").text("이메일을 다시 입력해주세요");
                        $("#sendmail_result").css("color", "red");

                    }
                }
            });
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
            if ($("#userPwd2").val().trim() === "") {
                alert("비밀번호 확인을 입력하세요.");
                return false;
            }
            if ($("#userEmail").val().trim() === "") {
                alert("이메일을 입력하세요.");
                return false;
            }
            if ($("#phoneNumber").val().trim() === "") {
                alert("전화번호를 입력하세요.");
                return false;
            }if ($("#addr1").val().trim() === "") {
                alert("주소를 입력하세요.");
                return false;
            }
            if ($("#addr2").val().trim() === "") {
                alert("상세주소를 입력하세요.");
                return false;
            }
            if (randomPin !== $("#auth_email").val()) {
                alert("잘못된 인증번호입니다.");
                return false;
            }
            document.getElementById("userSignup").submit();
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
        /* 유저 유효성 검사 정규식 */
        //아이디 정규식
        let userIdT = /^[a-z0-9]{4,12}$/;
        // 이름 정규식
        let userNameT = /^[가-힣]{2,6}$/;
        // 비밀번호 검사 정규식//
        let userPwdT = /^[A-Za-z0-9]{4,12}$/;
        // 이메일 검사 정규식
        let userEmailT = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
        // 전화번호 정규식
        let phoneNumberT = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

        $(document).ready(function () {

            $("#userId").blur(function () {
                if (!userIdT.test($("#userId").val())) {
                    console.log("false");
                    $("#id_check").text("영문자와 숫자 4~12자 이내로 입력하세요");
                    $("#id_check").css("color", "red");
                } else {
                    console.log("true");
                    $("#id_check").text("");
                }
            });
            $("#userName").blur(function () {
                if (!userNameT.test($("#userName").val())) {
                    console.log("false");
                    $("#name_check").text("한글 2~6자 이내로 입력하세요");
                    $("#name_check").css("color", "red");
                } else {
                    console.log("true");
                    $("#name_check").text("");
                }
            });
            $("#userPwd").blur(function () {
                if (!userPwdT.test($("#userPwd").val())) {
                    console.log("false");
                    $("#pwd_check").text("영문자+숫자 포함 8~20자 이내로 입력하세요");
                    $("#pwd_check").css("color", "red");
                } else {
                    console.log("true");
                    $("#pwd_check").text("");
                }
            });
            $("#phoneNumber").blur(function () {
                if (!phoneNumberT.test($("#phoneNumber").val())) {
                    console.log("false");
                    $("#phone_number_check").text("영문자와 숫자 4~12자 이내로 입력하세요");
                    $("#phone_number_check").css("color", "red");
                } else {
                    console.log("true");
                    $("#phone_number_check").text("");
                }
            });
        });
        $("#auth_email").on("change keyup paste", function () {
            console.log("인증번호 실시간 확인 코드 시작");
            if (randomPin === $("#auth_email").val()) { // //인증 키 값을 비교를 위해 텍스트인 풋과 벨류를 비교
                $("#auth_res").text("인증번호가 일치 합니다");
                $("#auth_res").css('color', 'blue');
                $("#btn_reg").attr("type", "submit");
            } else {
                $("#auth_res").text("인증번호를 다시 확인해 주세요");
                $("#auth_res").css('color', 'red');
                $("#btn_reg").attr("type", "button"); //attr. 해당 태그 속성을 바꿔줌
            }
        });

    </script>
</head>
<body>
<h2>회원가입하기</h2>
<hr/>
<br/>
<form id="userSignup" method="post" action="/user/signUp">

    <label>아이디 : </label>
    <input type="text" id="userId" name="userId" id="userId">
    <div id ="id_check"></div>
    <div id="id_result"></div>
    <button type="button" style="display:inline-block" onclick="idCheck()" id="userIdCheck">아이디 중복확인</button>


    <label>비밀번호 : </label>
    <input type="password" id="userPwd" name="userPwd">
    <div id ="pwd_check"></div>

    <label>비밀번호 확인 : </label>
    <input type="password" id="userPwd2" name="userPwd2" onkeyup="pwdConfirm()">
    <div id ="pwd2_check"></div>

    <label>이름 : </label>
    <input type="text" id="userName" name="userName">
    <div id ="name_check"></div>

    <label>이메일 : </label>
    <input type="email" id="userEmail" name="userEmail">
    <button type="button" onclick="doSendmail();" style="display:inline-block">인증번호 발송</button>
    <div id ="email_check"></div>
    <div id ="email_result"></div>
    <div id="sendemail_result"></div>

    <label>인증번호 : </label>
    <input type="text" id="auth_email" name="auth_email" placeholder="인증번호 확인">
    <div id="auth_res" name="auth_res"></div>

    <label>전화번호 : </label>
    <input type="tel" id="phoneNumber" name="phoneNumber">
    <div id ="phone_number_check"></div>

    <label>주소 : </label>
    <input type="addr1" id="addr1" name="addr1" style="display:inline-block" style="width: 200px" placeholder="우편번호" readonly>
    <button type="button" style="display:inline-block" onclick="kakaoPost(this.form)">주소찾기</button>
    <div id ="adrr1_check"></div>


    <label>상세주소 : </label>
    <input type="text" id="addr2" name="addr2">
    <div id ="addr2_check"></div>

    <button type="button" onclick="Checkfield()">완료</button>
</form>
</body>
</html>