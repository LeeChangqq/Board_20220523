
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오후 4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    ${boardDTO}
    <img src="${pageContext.request.contextPath}/upload/${boardDTO.boardFileName}" alt="" height="100" width="100">
<%--    <input id="pwConfirm" name="boardPassword" placeholder="비밀번호">--%>
<%--    <input type="button" value="버튼" onclick="update()">--%>
<%--    <c:forEach var="board" items="board">--%>
<%--        ${board}    <br>--%>
<%--        <a href="/board/delete">삭제</a>--%>
<%--        <a href="/board/update">수정</a>--%>
<%--    </c:forEach>--%>
        <input type="button" onclick="boardDelete()" value="삭제">
        <input type="button" onclick="boardUpdate()" value="수정">
        <input type="button" onclick="findAll()" value="전체조회">

</body>
<script>
    const  boardUpdate = () => {
        location.href = "/board/update?id=${boardDTO.id}";
    }
    const  boardDelete = () => {
        location.href="/board/passwordCheck?id=${boardDTO.id}";
    }
    const  findAll = () => {
        location.href = "/board/findAll";
    }
</script>
</html>
