<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--Modal --%>
<div id="shopLogin" class="modal fade" role="dialog">
	<div class="modal-dialog modal-md">
		<!--Modal Content-->
		<div class="modal-content">
			<form id="loginF" action="${pageContext.request.contextPath}/loginEnd.do"
		 		method="POST">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">LOGIN</h3>
				</div>
				
				
				<!--header  -->

				<div class="modal-body">
					<div class="row">
						<div class="col-sm-4">아이디</div>
						<div class="col-sm-8">
							<input type="text" name="userid" id="userid" class="form-control">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">비밀번호</div>
						<div class="col-sm-8">
							<input type="password" name="pwd" id="pwd" class="form-control">
						</div>
					</div>
					<div class="row" align="right">
						<a href="#" onclick="find_id()">아이디 찾기</a> / 
						<a href="#" onclick="find_pwd()">비밀번호 찾기</a>
					</div>

				</div>
				<!--body  -->

				<div class="modal-footer">
					<a type="button" class="btn btn-warning" href="${pageContext.request.contextPath}/join.do">회원가입</a>
					<button id="loginBtn" type="button" class="btn btn-success">로그인</button>
					<button id="closeBtn" class="btn btn-primary" data-dismiss="modal"
						type="button">Close</button>
				</div>
				<!--footer  -->
			</form>
		</div>
	</div>  
</div>
<!-- 아이디 찾기 폼 -->
<form id="findid" action="${pageContext.request.contextPath}/find_id.do"></form>
<!-- 비밀번호 찾기 폼 -->
<form id="findpwd" action="${pageContext.request.contextPath}/find_pwd.do"></form>

<script type="text/javascript">
	$(function() {
		$('#loginBtn').click(function() {
			if (!$('#userid').val()) {
				alert('아이디를 입력하세요');
				$('#userid').focus();
				return;
			}//if-----------
			if (!$('#pwd').val()) {
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				return;
			}
			$('#loginF').submit();
		});
	});
	
	var find_id=function(){
		findid.submit();
	}
	
	var find_pwd=function(){
		findpwd.submit();
	}
</script>












