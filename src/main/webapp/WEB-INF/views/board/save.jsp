<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="display-4 fw-normal">
        <form action="/board/save" method="post">
            <input class="form-control mb-2" type="text" name="boardTitle" placeholder="제목">  <br>
            <input class="form-control mb-2" type="text" name="boardWriter" placeholder="작성자">    <br>
            <input class="form-control mb-2" type="text" name="boardPassword" placeholder="비밀번호"> <br>
            <textarea class="form-control mb-2" name="boardContents" rows="5" cols="10"></textarea>   <br>
            <!--<input type="text" name="boardContents" placeholder="내용"> <br>-->
            <input class="btn btn-primary" value="작성" type="submit">
        </form>
    </div>
</div>
</body>
</html>
