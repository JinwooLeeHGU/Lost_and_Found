<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>자유게시판</title>
<%-- <link rel="stylesheet" href="${path}/resources/css/style.css"> --%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/uikit@3.5.16/dist/css/uikit.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
  function delete_ok(id) {
    var a = confirm("정말로 삭제하겠습니까?");
    if (a)
      location.href = 'deleteok/' + id;
  }
</script>


<style>
#editButton {
	width: 80px;
	margin: auto;
	color: white;
	border: 1px #81BEF7;
	background: white;
	padding: 5px 5px;
	text-align: center;
	font-weight: bold;
	display: inline-block;
}

.panel-primary>.panel-heading {
	background-color: darkslategray;
	border-color: white;
}

.panel-primary {
	border-color: black;
}

#deleteButton {
	width: 80px;
	margin: auto;
	border: 1px #E2A9F3;
	background: lightgrey;
	padding: 5px 5px;
	text-align: center;
	font-weight: bold;
	display: inline-block;
}

#buttonArea {
	text-align: center;
	padding: 10px;
}

div.card {
	width: 95%;
	height: 450px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	text-align: left;
	margin: 14px;
	position: relative;
	float: left;
}

div.header {
	background-color: #4CAF50;
	color: white;
	padding: 10px;
	font-size: 40px;
}

div.description {
	padding: 10px;
}

#desc1 {	
	font-size: 20px;
	text-align: left;
	font-weight: 700;
	padding-left: 5%;
}


.username {
	position: fixed;
	left: 1%;
	padding-top: 1px;
}


@media only screen and (min-width: 520px) {
	div.card {
		width: 44%;
	}
}

@media only screen and (min-width: 768px) {
	div.card {
		width: 29%;
	}
}

@media only screen and (min-width: 1024px) {
	div.card {
		width: 22%;
	}
}



</style>
<script>
//원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
function searchlist(page){
	location.href="${path}/board/searchlist?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
}
</script>
</head>

<body>

<span id="name"> </span>
	<%-- <%
		//out.write("<h1> hi there </h1>");
		if(session.getAttribute("userid") == null){
			out.write("<location.href ='../login/login'>");
			/* out.write("<h1> hi there </h1>"); */	
		}else {
			String userid = (String)session.getAttribute("userid");
			out.write("<span> welcome" + "<strong> " + userid + "</strong> </span>");
		}
	%> --%>
	<span class="username"> welcome <strong> ${login.username} </strong> </span>
	
	<%@include file="./modules/header.jsp"%>
	<%@include file="./modules/navbar.jsp"%>
	
	<!-- 레코드의 갯수를 출력 -->
	${map.count}개의 게시물이 있습니다.
	
	<table id="list" width="90%">
		<c:forEach items="${map.list}" var="u">

			<div class="card">
				<div class="seq">${u.seq}</div>
				<div class="image">
					<img src=${u.photourl}
						style="box-sizing: border-box; width: 100%; height: 230px" />
				</div>
				<div class="description">					
					
					<script>
					var lf = ${u.lost};
					if(lf) document.write ( '<span style="background-color:#CBECBB; padding:1.5px 3px; border-radius: 3px;">Found</span>' );
					else document.write ( '<span style="background-color:#F1CBC2; padding:1.5px 3px; border-radius: 3px;">Lost</span>' );
					</script>
					
					 <span class="title">${u.title}</span>

					<div class="name"> 카테고리 : ${u.category}</div>

					<div class="price">작성자 : ${u.writer}</div>

					<div class="other" style="box-sizing: border-box; height: 50px;">비고
						: ${u.content}</div>

					<div class="regdate">작성일자 : ${u.regdate}</div>
					
					<%-- <c:out value="${u.writer }"/> --%>
					<%-- <c:out value="${login.username }"/> --%>
					
					<c:if test="${login.username == u.writer}">
					<%-- <c:if test="${sessionScope.username ==  }" --%>
						<div id="buttonArea">
							<div id="editButton">
								<a id="fontcolor" href="editform/${u.seq}">Edit</a>
							</div>
	
							<div id="deleteButton">
								<a id="fontcolor" href="javascript:delete_ok('${u.seq}')">Delete</a>
							</div>
	
						</div>
					</c:if>

				</div>


			</div>
		</c:forEach>
		
		<!-- 페이징 -->
		<tr>
			<td colspan="5">
				<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:searchlist('1')">[처음]</a>
				</c:if>
				
				<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:searchlist('${map.boardPager.prevPage}')">[이전]</a>
				</c:if>
				
				<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
				<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
					<!-- 현재페이지이면 하이퍼링크 제거 -->
					<c:choose>
						<c:when test="${num == map.boardPager.curPage}">
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:searchlist('${num}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
					<a href="javascript:searchlist('${map.boardPager.nextPage}')">[다음]</a>
				</c:if>
				
				<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
					<a href="javascript:searchlist('${map.boardPager.totPage}')">[끝]</a>
					<c;out value="${map.boardPager.totPage}"/>
				</c:if>
			</td>
		</tr>
		<!-- 페이징 -->
	</table>
	
	
 



	<%-- <div class="container">
		<div class="row">
			<table id="list" width="90%">
				<c:forEach items="${list}" var="u">
					<div class="col-sm-4">
						<div class="panel panel-primary">

							<div class="panel-heading">${u.seq}</div>
							<div class="panel-heading">${u.title}</div>
							<div class="panel-body"
								style="box-sizing: border-box; width: 300px; height: 300px;">
								<img src=${u.photourl
									}
									style="box-sizing: border-box; width: 100%; height: 100%;" />
							</div>
							<div class="panel-footer">상품명 : ${u.category}</div>
							<div class="panel-footer">가격 : ${u.writer}</div>
							<div class="panel-footer"
								style="box-sizing: border-box; height: 100px;">비고 :
								${u.content}</div>
							<div class="panel-footer">${u.regdate}</div>
							<div class="panel-footer">
								<div id="buttonArea">
									<div id="editButton">
										<a id="fontcolor" href="editform/${u.seq}">Edit</a>
									</div>

									<div id="deleteButton">
										<a id="fontcolor" href="javascript:delete_ok('${u.seq}')">Delete</a>
									</div>

								</div>



							</div>
						</div>
					</div>

				</c:forEach>
			</table>


		</div>
	</div>
 --%>
	<br>
	<br>

	<%@include file="./modules/footer.jsp"%>

</body>
</html>