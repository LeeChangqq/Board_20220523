
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오후 4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>
        #comment-write {
            max-width: 600px;
        }
    </style>
</head>
<body>
    글번호: ${boardDTO.id} <br>
    제목: ${boardDTO.boardTitle} <br>
    작성자: ${boardDTO.boardWriter} <br>
    비밀번호: ${boardDTO.boardPassword} <br>
    내용: ${boardDTO.boardContents} <br>
    작성일자: ${boardDTO.boardCreatedDate} <br>
    조회수: ${boardDTO.boardHits} <br>
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
        <input type="button" onclick="paging()" value="페이징목록">

<div class="container">
    <div id="comment-write" class="input-group mb-3 form-floating">
        <input type="text" id="commentWriter" class="form-control" placeholder="작성자">
        <label for="commentWriter">작성자</label>
        <input type="text" id="commentContents" class="form-control" placeholder="내용">
        <button id="comment-write-btn" class="btn btn-primary">댓글작성</button>
    </div>

    <div id="comment-list">
        <table class="table">
            <tr>
                <th>댓글번호</th>
                <th>작성자</th>
                <th>내용</th>
                <th>작성시간</th>
            </tr>
                <c:forEach items="${commentList}" var="comment">
                    <tr>
                        <td>${comment.id}</td>
                        <td>${comment.commentWriter}</td>
                        <td>${comment.commentContents}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>
                    </tr>
                </c:forEach>
        </table>
    </div>
</div>

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
    const  paging = () => {
        location.href = "/board/paging?page=${page}"; // 직전에 있었던 페이지 값을 컨트롤러로 요청
    }
    $("#comment-write-btn").click(function () {
        // alert("클릭!!");
        // 제이쿼리 문법 (가져온 id값을 클릭하면 함수가 호출됨)
        // 댓글 작성자, 내용을 가져오고
        // ajax 문법을 활용하여 /comment/save 주소로 post 방식으로 작성자, 내용, 글번호 이렇게
        // 세개의 값을 보내는 코드를 작성하십시오.
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = $("#commentContents").val();
        const boardId = ${boardDTO.id};

        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {"commentWriter":commentWriter,"commentContents":commentContents,"boardId":boardId},
            data_type: "json",
            success: function(result){
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in result){
                    output += "<tr>";
                    output += "<td>"+result[i].id+"</td>";
                    output += "<td>"+result[i].commentWriter+"</td>";
                    output += "<td>"+result[i].commentContents+"</td>";
                    // output += "<td>"+result[i].commentCreatedDate+"</td>";
                    output += "<td>"+moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "</tr>";
                }
                output += "</table>";

                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentWriter').value='';
                document.getElementById('commentContents').value='';
            },
            error: function () {
                alert("틀림");
            }
        });
    })
</script>
</html>
