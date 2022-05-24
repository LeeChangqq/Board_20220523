<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-24
  Time: 오후 1:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<form action="/board/update" method="post" name="updateForm">
    <input type="hidden" class="form-control mb-2" name="id" value="${board.id}" readonly>
    제목: <input type="text" class="form-control mb-2" name="boardTitle" placeholder="제목" value="${board.boardTitle}">
    작성자: <input type="text" class="form-control mb-2" name="boardWriter" placeholder="작성자" value="${board.boardWriter}">
    비밀번호: <input type="text" class="form-control mb-2" name="boardPassword" id="pwConfirm" placeholder="비밀번호">
<%--    내용: <input type="text" class="form-control mb-2" name="boardContents" placeholder="내용">--%>
    내용: <textarea name="boardContents" class="form-control mb-2" cols="30" rows="10" placeholder="내용">${board.boardContents}</textarea>
    <input class="btn btn-primary" type="button" value="정보수정" onclick="update()">
</form>
</body>
<script>
    const  update = () => {
        // const pass = document.getElementById("pwConfirm").value; 밑에랑 같음
        const pass = document.querySelector("#pwConfirm").value;
        const passDB = "${board.boardPassword}";
        if(pass == passDB) {
            updateForm.submit();
        }else {
            alert("비밀번호가 틀립니다.");
        }
    }
</script>
</html>
