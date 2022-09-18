<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>회원정보 수정</title>
    <script type="text/javascript">
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
</head>
<body>
    <h2>회원정보 수정</h2>
    <form action="doUpdate" method="post">
        <div>비밀번호</div>
        <div><input type="password" id="user_Pwd" name="userPwd"></div>
        <div>비밀번호 확인</div>
        <div><input type="password" id="check_Pwd" name="check_Pwd" onkeyup="pwdConfirm()"></div>
        <div id="check_Pwd1"></div>
        <div>이름</div>
        <div><input name="name"></div>
        <div>이메일</div>
        <div><input type="email" id="user_Email" name="user_Email"></div>
        <div><input type="submit" value="업데이트"></div></form>
</body>
</html>