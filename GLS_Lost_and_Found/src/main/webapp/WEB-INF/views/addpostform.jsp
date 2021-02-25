<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>글 작성하기</title>
<link rel="stylesheet" href="${path}/resources/css/style.css">

</head>
<body>
	<%@include file="./modules/header.jsp"%>
	<%@include file="./modules/navbar.jsp"%>

	<h1>새 물품 등록하기</h1>
	<div class="buttonHolder">
		<form action="addok" method="post" enctype="multipart/form-data">
			<table id="list">
				<tr>
					<td id="definition">Lost/Found</td>
					<td><input type="radio" id="lost" name="lost" value="0"
						checked> <label for="lost">Lost</label> <input
						type="radio" id="found" name="lost" value="1"> <label
						for="found">Found</label></td>
				</tr>
				<tr>
					<td id="definition">글 작성자 </td>
					<td><input type="text" name="writer" /></td>
				</tr>
				<tr>
					<td id="definition">글 제목</td>
					<td><input type="text" name="title" /></td>
				</tr>
				<tr>
					<td id="definition">글 내용</td>
					<td><textarea cols="50" rows="5" name="content"></textarea></td>
				</tr>
				<tr>
					<td id="definition">분실/습득 날짜</td>
					<td><input type="date" id="lost_found_date"
						name="lost_found_date"></td>
				</tr>
				<tr>
					<td id="definition">이미지 </td>
					<td><input name="file" type="file" class="custom-file-input"
						style="margin: 0 auto;" id="customFile"></td>
					<!-- why not this? -->
					<!-- <td><input name="file" type="file" style= "margin: 0 auto;"></td> -->
				</tr>
				<tr>
					<td id="definition">분실/습득 카테고리 </td>
					<td><input type="text" name="category" /></td>
				</tr>
				
				<tr>
					<td id="definition">특징</td>
					<td><textarea cols="50" rows="5" name="feature"></textarea></td>
				</tr>

			</table>
			<br />
			<button type="submit" id="addButton" class="center">저장</button>
			<button type="reset" id="cancelButton">취소</button>
			<button type="button" id="listPageButton" onclick="history.back()">목록</button>

		</form>
	</div>

</body>
</html>