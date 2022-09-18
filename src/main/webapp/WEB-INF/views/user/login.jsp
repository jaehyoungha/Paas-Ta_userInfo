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
    <script type="text/javascript">
        function doLoginUserCheck(f) {
            if (f.user_Id.value === "") {
                alert("아이디를 입력하세요");
                f.user_Id.focus();
                return false;
            }
            if (f.user_Pwd.value === "") {
                alert("비밀번호를 입력하세요");
                f.user_Pwd.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<form name="f" method="post" action="/login" onsubmit="return doLoginUserCheck(this);">
    아이디 : <input type="text" name="userId">
    비밀번호 : <input type="password" name ="userPwd">
    <input type="submit" value="로그인">
</form>
</body>
</html>
