<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.UserDTO" %>
<%
    String id =(String)session.getAttribute("userId");
    UserDTO uDTO = (UserDTO) request.getAttribute("uDTO");

    if (uDTO == null) {
        uDTO = new UserDTO();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>index</title>
    <script type="text/javascript">
        function confirmLogout(){
            if(confirm("정말 로그아웃 하시겠습니까?")) {
                location.href = "<c:url value='logout'/>";
            }
        }
    </script>
</head>
<body>
<%if (id != null) { %>
<%=id%>님 환영합니다.
<a href="/user/updatePage">회원정보 수정</a>
<a href="logout" onclick="confirmLogout();">로그아웃</a>
<%} else {%>
<a href="/user/loginPage">로그인하기</a>
<%}%>

</body>
</html>