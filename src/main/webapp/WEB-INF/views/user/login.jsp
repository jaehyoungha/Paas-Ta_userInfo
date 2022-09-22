<%--
  Created by IntelliJ IDEA.
  User: hajaehyeong
  Date: 2022/09/13
  Time: 1:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        function doLoginUserCheck() {
            if ($("#userId").val().trim() === "") {
                alert("아이디를 입력하세요.");
                return false;
            }
            if ($("#userPwd").val().trim() === "") {
                alert("이름을 입력하세요.");
                return false;
            }
            document.getElementById("userLogin").submit();
        }
    </script>
</head>
<body>
<form id="userLogin" method="post" action="/login">
    아이디 : <input type="text" id="userId" name="userId">
    <br>
    비밀번호 : <input type="password" id="userPwd" name ="userPwd">
    <input type="submit" value="로그인" onclick="doLoginUserCheck()">
    <button type="button" onclick="document.location.href='/signUpPage'">회원가입</button>
</form>
</body>
</html>
