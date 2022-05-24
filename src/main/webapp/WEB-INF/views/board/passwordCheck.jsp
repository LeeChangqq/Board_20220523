<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-24
  Time: 오전 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/board/delete" method="post">
        <label for="passwordConfirm">비밀번호를 입력해주세요</label>
        <input type="text" id="passwordConfirm"> <br>
        <input type="button" onclick="passwordCheck()" value="입력">
    </form>
</body>
<script>
    const passwordCheck = () => {
        const passwordConfirm = document.getElementById("passwordConfirm").value;
        const passDB = '${board.boardPassword}';
        if(passwordConfirm == passDB) {
            location.href = "/board/delete?id=${board.id}";
        }else {
            alert("비밀번호가 불일치!!!");
            // 일치하지 않으면 상세조회 화면으로
            location.href = "/board/detail?id=${board.id}";
        }
    }
</script>
</html>
