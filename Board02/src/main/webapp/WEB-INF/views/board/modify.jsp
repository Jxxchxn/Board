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
    <h2><a href="${contextPath}/board/view?bno=${view.bno}">글 수정</a></h2>
    <form method="post">
        <div class="form-group">
            <label>제목:</label>
            <input type="text" class="form-control" name="btitle" value="${view.btitle}">
        </div>
        <div class="form-group">
            <label>작성자:</label>
            <input type="text" class="form-control" name="bwriter" value="${view.bwriter}">
        </div>
        <div class="form-group">
            <label for="comment">내용:</label>
            <textarea class="form-control" rows="5" name="bcontent">${view.bcontent}</textarea>
        </div>
        <tr>
			<th colspan="2"> <input type="submit" value="작성"> </th>
		</tr>
  </form>
</div>

</body>
</html>