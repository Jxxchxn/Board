<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <h2><a href="${contextPath}/board/list?num=1">게시글 상세 보기</a></h2>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4>${view.btitle}</h4>
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
		                <td>${view.bwriter}</td>
		                <td><fmt:formatDate value="${view.bdate}" pattern="yyyy-MM-dd" /></td>
		                <td>${view.bcount}</td>
		            </tr>
        		</tbody>
            </table>
        </div>
        <div class="panel-body">
            ${view.bcontent}
        </div>
        <div class="panel-footer">
            <tr>
				<th colspan="2">
					<a class="btn btn-primary" href="${contextPath}/board/list?num=1" >글 목록</a>
					<a class="btn btn-primary" href="${contextPath}/board/modify?bno=${view.bno}">수정</a>
					<a class="btn btn-primary" href="${contextPath}/board/delete?bno=${view.bno}" >삭제</a>		
				</th>
			</tr>
        </div>
    </div>

<br><br><br><br><br>

<!-- 댓글 작성 -->
<div class="container">
    <h2>Form control: input</h2>
    <p>The form below contains two input elements; one of type text and one of type password:</p>
    <form method="post" action="${contextPath}/reply/write">
        <div class="form-group">
            <label for="usr">Name:</label>
            <input type="text" class="form-control" name="rwriter">
        </div>
        <div class="form-group">
            <label for="comment">Comment:</label>
            <textarea class="form-control" rows="5" name="rcontent"></textarea>
        </div>
        <input type="hidden" name="bno" value="${view.bno}">
        <button type="submit">댓글 작성</button>
    </form>
</div>

<br><br><br><br><br>

<!-- 댓글 출력 -->
<hr>
<c:forEach items="${reply}" var="reply" >
    <div class="panel-heading">
        <table class="table">
            <thead>
                <tr>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th><a href="${contextPath}/reply/modify?bno=${view.bno}&rno=${reply.rno}" class="btn btn-sm btn-primary">수정</a></th>
                    <th><a href="${contextPath}/reply/delete?bno=${view.bno}&rno=${reply.rno}" class="btn btn-sm btn-danger">삭제</a></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${reply.rwriter}</td>
                    <td><fmt:formatDate value="${reply.rdate}" pattern="yyyy-MM-dd" /></td>
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
