<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String adminCtx = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- 다음 우편 & 지도 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1869823f855a028e850ee238641d80ac&libraries=services"></script>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">



 <!-- 파일 업 -->
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">

 	<meta name="description" content="File Upload widget with multiple file selection, drag&amp;drop support, progress bar, validation and preview images, audio and video for jQuery. Supports cross-domain, chunked and resumable file uploads. Works with any server-side platform (Google App Engine, PHP, Python, Ruby on Rails, Java, etc.) that supports standard HTML form file uploads.">

<!-- Bootstrap styles -->
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<!-- Generic page styles -->
	<link rel="stylesheet" href="css/style.css">
	<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
	<link rel="stylesheet" href="css/jquery.fileupload.css">

	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	
	<!-- 글자폼 변경 -->
	<script type="text/javascript" src="<%=adminCtx %>/ckeditor/ckeditor.js"/>
	 
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">


<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">


<!-- 캘린더 -->

</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.do">Yes-Show</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					
					<li><a href="${pageContext.request.contextPath}/NewboardList.do">Board(회원)</a></li>
					<li><a href="${pageContext.request.contextPath}/board/list.do">Board(점주)</a></li>
					<li><a href="${pageContext.request.contextPath}/qna.do">QNA쓰기</a></li>
					<li><a href="${pageContext.request.contextPath}/qnaList.do">QNA확인</a></li>
					<li><a href="${pageContext.request.contextPath}/noticeList.do">공지사항</a></li>
					
				<c:if test="${loginUser.status==3 }">  	
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">관리자<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/admin/memberList.do">회원관리</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/qnaList.do">1:1문의 확인</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/noticeWrite.do">공지사항등록</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/adminJoin.do">관리자가입</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/adminList.do">관리자관리</a></li>
						</ul></li>
				</c:if>		
						
						
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${loginUser != null}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"> <span
								class="label label-success"> ${loginUser.userid1}님 로그인 중</span>
								<i class="fa et-down fa-fw text-muted fa-angle-double-down"></i></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="javascript:editUser('${loginUser.idx}')">MyPage</a></li>
								<li><a href="javascript:checkRes('${loginUser.idx}')">My Reservation</a></li>
								
								<!-- 업주가 예약정보 확인 -->
								<c:if test="${loginUser.status==2 }">
									<li><a href="javascript:ownercheckRes('${loginUser.idx}')">Check Reservation</a></li>
								</c:if>
							</ul></li>
					</c:if>
					<li><c:if test="${loginUser eq null}">
							<a href="#" data-toggle="modal" data-target="#shopLogin"
								id="btnLogin">Login</a>
						</c:if> <c:if test="${loginUser ne null}">
							<a href="<%=adminCtx%>/logout.do">로그아웃</a>
						</c:if></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	
<!-- 수정 처리 관련 폼 -->
<form name="editF">
	<input type="hidden" name="idx" id="idx">
</form>


<script type="text/javascript">
	var editUser=function(idx){
		editF.idx.value=idx;
		editF.method="POST";
		editF.action="memberEdit.do";
		editF.submit();
	}
	var checkRes=function(idx){
		editF.idx.value=idx;
		editF.method="POST";
		editF.action="checkRes.do";
		editF.submit();
	}
	
	var ownercheckRes=function(idx){
		editF.idx.value=idx;
		editF.method="POST";
		editF.action="ownerCheckRes.do";
		editF.submit();
	}
</script>
	<%@ include file="login/loginModal.jsp"%>