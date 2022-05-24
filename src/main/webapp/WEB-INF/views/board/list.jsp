<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오후 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include> <!-- ./현재폴더 ../상위폴더 -->
    <table class="table">
        <tr>
            <th>id</th>
            <th>제목</th>
            <th>작성자</th>
            <th>비밀번호</th>
            <th>내용</th>
            <th>조회수</th>
            <!--<th>시간</th>-->
            <th>시간</th>
        </tr>
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>${board.id}</td>
                <td><a href="/board/detail?id=${board.id}"> ${board.boardTitle}</a></td>
                <td>${board.boardWriter}</td>
                <td>${board.boardPassword}</td>
                <td>${board.boardContents}</td>
                <td>${board.boardHits}</td>
                <!--<td>$ {board.boardCreatedDate}</td>-->
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.boardCreatedDate}"></fmt:formatDate></td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
