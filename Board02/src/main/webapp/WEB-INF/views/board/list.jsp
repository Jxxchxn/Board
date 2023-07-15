<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
    <h2><a href="${contextPath}/">게시글 목록</a></h2>          
    <table class="table table-hover">
        <thead>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="list">
            <tr>
                <td>${list.bno}</td>
                <td><a href="${contextPath}/board/view?bno=${list.bno}">${list.btitle}</a></td>
                <td>${list.bwriter}</td>
                <td><fmt:formatDate value="${list.bdate}" pattern="yyyy-MM-dd" /></td>
                <td>${list.bcount}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>


<div class="container">                 
    <ul class="pager">
        <c:if test="${page.prev}">
            <li>
                <a href="${contextPath}/board/list?num=${page.startPageNum - 1}${page.searchTypeKeyword}">Previous</a>
            </li>
        </c:if>
    
        <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
            <span>
            
                <c:if test="${select != num}">
                    <a href="${contextPath}/board/list?num=${num}${page.searchTypeKeyword}">${num}</a>
                </c:if>
                  
                <c:if test="${select == num}">
                    <b>${num}</b>
                </c:if>
            </span>
        </c:forEach>
    
        <c:if test="${page.next}">
            <li>
                <a href="${contextPath}/board/list?num=${page.endPageNum + 1}${page.searchTypeKeyword}">Next</a>
            </li>
        </c:if>
    </ul>
</div>


<div class="container">
    <div class="form-group row">
    	<div class="col-sm-3">
	        <select class="form-control" name="searchType">
	            <option value="btitle" <c:if test="${page.searchType eq 'btitle'}">selected</c:if>>제목</option>
	            <option value="bcontent" <c:if test="${page.searchType eq 'bcontent'}">selected</c:if>>내용</option>
	            <option value="btitle_bcontent" <c:if test="${page.searchType eq 'btitle_bcontent'}">selected</c:if>>제목+내용</option>
	            <option value="bwriter" <c:if test="${page.searchType eq 'bwriter'}">selected</c:if>>작성자</option>
	        </select>
        </div>
        <div class="col-sm-7">
		    <input class="form-control mr-sm-2" type="text" placeholder="Search" name="keyword" value="${page.keyword}">
		</div>
		<div class="col-sm-2">
		    <button class="btn btn-success" type="button" id="searchBtn">Search</button>
    	</div>
    </div>
</div>


<%-- 	<div>
		<select name="searchType">
			<option value="btitle" <c:if test="${page.searchType eq 'btitle'}">selected</c:if>>제목</option>
	        <option value="bcontent" <c:if test="${page.searchType eq 'bcontent'}">selected</c:if>>내용</option>
			<option value="btitle_bcontent" <c:if test="${page.searchType eq 'btitle_bcontent'}">selected</c:if>>제목+내용</option>
			<option value="bwriter" <c:if test="${page.searchType eq 'bwriter'}">selected</c:if>>작성자</option>
		</select>
	 
		<input type="text" name="keyword" value="${page.keyword}"/>
		<button type="button" id="searchBtn">검색</button>
	</div> --%>

<script>

 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;

  location.href = "${contextPath}/board/list?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
 };
</script>
</body>
</html>