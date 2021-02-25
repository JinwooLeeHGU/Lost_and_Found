<!-- 코드가 위 그리고 그것을 설명하는 주석이 아래 식으로 배치하겠다.  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"	
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>채팅</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 반응형 웹에 사용하는 메타태그 -->

<script> 
  function deleteok(id) {
    var a = confirm("정말로 삭제하겠습니까?");
    if (a)
      location.href = 'deleteok/' + id;
  }
</script>

<style>
 	div { text-align: center; }
</style>
</head>
<body>
<span id="name"> </span>
	<%
		//out.write("<h1> hi there </h1>");
		if(session.getAttribute("userid") == null){
			out.write("<location.href ='../login/login'>");
			/* out.write("<h1> hi there </h1>"); */	
		}else {
			String userid = (String)session.getAttribute("userid");
			out.write("<span> welcome" + "<strong> " + userid + "</strong> </span>");
		}
	%>
	
    <%@include file="./modules/header.jsp"%>
    <%@include file="./modules/navbar.jsp"%>

<div>
	<!-- 모듈화  -->

		<h1>채팅하기</h1>

		<form action="chatok" method="post" enctype="multipart/form-data">
		<table id="list" class="table table-striped"
		style="text-align: center; border: 1px solid #dddddd">
	
		<thead>
			<tr id="hidden" style="display:none;">
				<th style="background-color: #eeeeee; text-align: center;"></th>
				<th style="background-color: #eeeeee; text-align: center;"></th>
				<th style="background-color: #eeeeee; text-align: center;"></th>
				<th style="background-color: #eeeeee; text-align: center;"></th>
			</tr>
		</thead>
		<tbody>
				<tr id="hidden" style="display:none;">
				<td></td>
				<td id="hidden">본인 아이디</td>
				<td><input type="text" name="fromID" value="${userid}"></td>	
				<td></td>
				</tr>

				<tr>
				<td></td>
				<td id="definition">채팅 ID</td>
				<td><input type="text" name="toID" /></td>
				<td></td>
				</tr>
				
				<tr>
				<td></td>
				<td id="definition">메세지 내용</td>
				<td>
				<textarea cols="30" rows="3" name="content"></textarea>
				</td>
				<td>
				<button type="submit" id="registerButton" 
				style="color: brown; background:yellow; font-size:0.5em;
				border-radius:0.5em; padding:5px 20px;">
				메세지 보내기 </button>
				</td>

		</tbody>
		</table>
		<br />
		</form>
		
	<h1>나에게 온 메세지</h1>
	<table class="table table-striped"
		style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color: #eeeeee; text-align: center;">ID</th>
				<th style="background-color: #eeeeee; text-align: center;">메세지 내용</th>
				<th style="background-color: #eeeeee; text-align: center;">설정</th>
			</tr>
		</thead>
		<tbody>
		
			   <c:forEach var="emp" items="${list}" >  
			   
			   <%--<c:choose >--%>
			  <%-- <c:when test="${emp.fromID eq 'a'}">--%>
				
				<tr>
					<td class="fromID">${emp.toID}</td>
					<td class="charContent">${emp.chatContent}</td>
					<td> <div id="deleteButton">
						<a id="fontcolor" href="javascript:deleteok('${emp.seq}')" 
						class="btn w3-red btn-danger">삭제하기 </a>
						</div>
				 	</td>
				</tr>
				 
		   <%-- </c:when> 
				</c:choose>--%>
				</c:forEach>

		</tbody>
	</table>
</body>
	
	<!-- 모듈화  -->
</html>
<%@include file="./modules/footer.jsp"%>