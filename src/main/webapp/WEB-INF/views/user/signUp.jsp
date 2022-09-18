<%--
  Created by IntelliJ IDEA.
  User: hajaehyeong
  Date: 2022/09/05
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
    <script src="/js/jquery-3.6.0.min.js"></script>
    <%--주소--%>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
        function address(f) {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                    // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                    let address = data.address;
                    let zonecode = data.zonecode;
                    f.addr1.value = "(" +zonecode + ")" + address
                }
            }).open();
        }
        function pwdConfirm() {
            /* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
            /* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
            /* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
            let user_Pwd = document.getElementById("user_Pwd");					//비밀번호
            let check_Pwd = document.getElementById("check_Pwd");	//비밀번호 확인 값
            let msg = document.getElementById("check_Pwd1");				//확인 메세지
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
    </script>
    <script type="text/javascript">
        function doRegUserCheck(f) {
            if (f.user_Id.value == "") {
                alert("아이디를 입력하세요.")
                f.user_Id.focus();
                return false;
            }

            if (f.user_Name.value == "") {
                alert("이름를 입력하세요.")
                f.user_Name.focus();
                return false;
            }

            if (f.user_Pwd.value == "") {
                alert("비밀번호를 입력하세요.")
                f.user_Pwd.focus();
                return false;
            }

            if (f.phoneNumber.value == "") {
                alert("전화번호를 입력하세요.")
                f.phoneNumber.focus();
                return false;
            }

            if (f.user_Email.value == "") {
                alert("이메일을 입력하세요.")
                f.user_Email.focus();
                return false;
            }

            if (f.addr1.value == "") {
                alert("주소(우편번호)를 입력하세요.")
                f.addr1.focus();
                return false;
            }
            if (randomPin !== $("#auth_email").val()) {
                alert("잘못된 인증번호입니다.");
                return false;
            }
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
        }
        //아이디 정규식
        let user_idT = /^[a-z0-9]{4,12}$/;
        // 이름 정규식
        let user_NameT = /^[가-힣]{2,6}$/;
        // 비밀번호 정규식
        let user_PwdT = /^[A-Za-z0-9]{4,12}$/;
        // 전화번호 정규식
        let phoneNumberT = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        // 이메일 검사 정규식
        let user_EmailT = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        $(document).ready(function () {

            //아이디 정규식 확인
            $("#user_id").blur(function () {
                if (user_idT.test($("#user_id").val())) {
                    console.log("true");
                    $("#id_check").text("올바른 아이디");
                    $("#id_check").css("color", "blue");
                } else {
                    console.log("false");
                    $("#id_check").text("문자 or 숫자로만 4~12자리 입력하세요");
                    $("#id_check").css("color", "red");
                }
            });
            //이름 정규식 확인
            $("#user_Name").blur(function () {
                if (user_NameT.test($("#user_Name").val())) {
                    console.log("true");
                    $("#name_check").text("사용가능한 이름");
                    $("#name_check").css("color", "blue");
                } else {
                    console.log("false");
                    $("#name_check").text("정확한 이름을 입력하세요");
                    $("#name_check").css("color", "red");
                }
            });
            //비밀번호 정규식 확인
            $("#user_Pwd").blur(function () {
                if (user_PwdT.test($("#user_Pwd").val())) {
                    console.log("true");
                    $("#pwd_check").text("올바른 비밀번호");
                    $("#pwd_check").css("color", "blue");
                } else {
                    console.log("false");
                    $("#pwd_check").text("숫자 or 문자로만 4~12자리 입력하세요");
                    $("#pwd_check").css("color", "red");
                }
            });
            // 전화번호 정규식 확인
            $("#phoneNumber").blur(function () {
                if (phoneNumberT.test($("#phoneNumber").val())) {
                    console.log("true");
                    $("#phoneNumber_check").text("올바른 전화번호");
                    $("#phoneNumber_check").css("color", "blue");
                } else {
                    console.log("false");
                    $("#phoneNumber_check").text("숫자로만 입력하세요");
                    $("#phoneNumber_check").css("color", "red");
                }
            });
            //이메일 정규식 확인
            $("#user_Email").blur(function () {
                if (user_EmailT.test($("#user_Email").val())) {
                    console.log("true");
                    $("#email_check").text("올바른 이메일");
                    $("#email_check").css("color", "blue");
                } else {
                    console.log("false");
                    $("#email_check").text("올바른 이메일주소를 입력하세요");
                    $("#email_check").css("color", "red");
                }
            });
        });
        function doSendmail() {
            $.ajax({
                url: "/sendmail",
                type: "post",
                data: $("#user_Email"),
                /*dataType이란 내가 반환받을 데이터의 형태를 명시해주는 것*/
                dataType: 'json',
                success(pMap) {
                    let data = pMap["res"];
                    randomPin = pMap["randomPin"];
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
    </script>
</head>
<body>
<form method="post" action="/signUp" onsubmit="return doRegUserCheck(this);" on >
     아이디 : <input type="text" id ="user_id" name="userId"> <br>
    <div id="id_check"></div>
    이름 : <input type="text" id="user_Name" name="userName"> <br>
    <div id="name_check"></div>
    비밀번호 : <input type="password" id="user_Pwd" name="userPwd"><br>
    <div id="pwd_check"></div>
    비밀번호 확인 : <input type="password" id ="check_Pwd" name="checkPwd" onkeyup="pwdConfirm()">
    <div name ="check_Pwd1"id="check_Pwd1"></div>
    전화번호 : <input type="tel" id="phoneNumber" name="phoneNumber"><br>
    <div id="phoneNumber_check"></div>
    이메일 : <input type="email" id="user_Email" name="userEmail">
    <div id="email_check"></div>
    <div id="email_result"></div>
    <button type="button" onclick="doSendmail();">인증번호 발송</button>
    <br>
    <div id="sendemail_result"></div>
    <input type="text" class="form-control" id="auth_email" name="auth_email"
           placeholder="인증번호 확인">
    <br>
    <div id="auth_res" name="auth_res"></div>
    주소 : <input type="text" id="addr" name="addr1" value="우편번호" readonly> <input type="button" value="우편번호" onclick="address(this.form)"><br>
    <div id="addr_check"></div>
    상세주소 : <input type="text" name="addr2"><br>
    <button type="submit">회원가입</button>

</form>
</body>
</html>
