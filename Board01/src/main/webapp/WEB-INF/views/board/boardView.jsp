<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
    <h2><a href="${contextPath}/boardList">게시글 상세 보기</a></h2>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4>${board.btitle}</h4>
            <table style="text-align: center;">
            	<thead>
		            <tr>
		                <th>작성자</th>
		                <th>작성일</th>
		                <th>조회수</th>
		            </tr>
        		</thead>
        		<tbody>
		            <tr>
		                <td>${board.bwriter}</td>
		                <td>${board.bdate}</td>
		                <td>${board.bcount}</td>
		            </tr>
        		</tbody>
            </table>
        </div>
        <div class="panel-body">
            ${board.bcontent}
        </div>
        <div class="panel-footer">
            <tr>
				<th colspan="2">
					<a class="btn btn-primary" href="${contextPath}/boardList" >글 목록</a>
					<a class="btn btn-primary" href="${contextPath}/boardModifyForm?viewBno=${board.bno}">수정</a>
					<a class="btn btn-primary" href="${contextPath}/boardDelete?delBno=${board.bno}" >삭제</a>		
				</th>
			</tr>
        </div>
    </div>

<br><br><br><br><br>

<!-- 댓글 출력 -->
<hr>
<c:forEach items="${replyList}" var="reply" >
    <div class="panel-heading">
        <table class="table">
            <thead>
                <tr>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th><a href="${contextPath}/replyDelete?delRno=${reply.rno}&viewBno=${board.bno}" class="btn btn-sm btn-danger">삭제</a></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${reply.rwriter}</td>
                    <td>${reply.rdate}</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="panel-body">
        ${reply.rcontent}
    </div>
</c:forEach>		
		
<hr>
</div>
</body>
</html>
