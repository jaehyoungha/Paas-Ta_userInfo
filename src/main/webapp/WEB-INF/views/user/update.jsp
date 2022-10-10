<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.UserDTO" %>
<%@ page import="java.lang.reflect.Member" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String userId = (String) session.getAttribute("userId");
    String userEmail = (String) request.getAttribute("userEmail");
    UserDTO uDTO = (UserDTO) request.getAttribute("uDTO");
    if (uDTO == null) {
        uDTO = new UserDTO();
    }

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>회원정보 수정</title>
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    function kakaoPost(f) { // 주소 우편번호 찾기
        new daum.Postcode({
            oncomplete: function (data) {
                let address = data.address;f
                let zonecode = data.zonecode;
                f.addr1.value = "(" + zonecode + ")" +address
            }
        }).open();
    }
    </script>
</head>
<body>
    <h2>회원정보 수정</h2>
    <form action="/user/doUpdate" method="post">
        <label>아이디</label>
        <div><input type="text" id="user_Id" value="<%=CmmUtil.nvl(uDTO.getUserId())%>" name="userId" readonly></div>
        <label>비밀번호</label>
        <div><input type="password" id="user_Pwd" name="userPwd"></div>
        <label>비밀번호 확인</label>
        <div><input type="password" id="check_Pwd" name="check_Pwd" onkeyup="pwdConfirm()"></div>
        <div id="check_Pwd1"></div>
        <label>이름</label>
        <div><input value="<%=CmmUtil.nvl(uDTO.getUserName())%>" name="userName"></div>
        <label>이메일</label>
        <div><input type="email" id="userEmail" value="<%=CmmUtil.nvl(uDTO.getUserEmail())%>" name="userEmail">
            <button type="button" onclick="doSendmail();" style="display:inline-block">인증번호 발송</button></div>
        <label>전화번호</label>
        <div><input type="tel" id="phoneNumber" value="<%=CmmUtil.nvl(uDTO.getPhoneNumber())%>" name="phoneNumber"></div>
        <label>우편번호</label>
        <div><input type="text" value="<%=CmmUtil.nvl(uDTO.getAddr1())%>" id="addr1" name="addr1" readonly placeholder="우편번호">
            <button type="button" style="display:inline-block" onclick="kakaoPost(this.form)">우편번호찾기</button></div>
        <label>상세주소</label>
        <div><input type="text" value="<%=CmmUtil.nvl(uDTO.getAddr2())%>" name="addr2"></div>
        <div><input type="submit" value="업데이트"></div>
    </form>
</body>
</html>