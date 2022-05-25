<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        const saveFileForm = () => {
            location.href = "/board/saveFile";
        }
    </script>
</head>
<body>
    <a href="/board/save">글 작성</a> <br>
    <button onclick="saveFileForm()">글 작성(파일)</button>
    <a href="/board/findAll">리스트</a>
    <a href="/board/paging">페이징</a>
</body>
</html>
