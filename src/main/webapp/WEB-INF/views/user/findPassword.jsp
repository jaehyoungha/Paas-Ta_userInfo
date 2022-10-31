<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>비밀번호 찾기</title>
    <script type="text/javascript">
        function doSendmail() {
            $.ajax({
                url: "/user/passwordChg",
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
    </script>
</head>
<body>
<h2>비밀번호 찾기</h2>
<hr/>
<br/>
<form id="findPassword" method="post" action="/user/passwordChg">
아이디 : <input type="text" id="userId" name="userId">
이메일 : <input type="email" id="userEmail" name="userEmail">
<button type="button" onclick="doSendmail();" style="display:inline-block">인증번호 발송</button>
<div id ="email_check"></div>
<div id="sendemail_result"></div>
    <button type="submit">확인</button>
</form>
</body>
</html>