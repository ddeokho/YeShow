<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/Top.do"/>

<script type="text/javascript">
	var adminJoin = function(){
		if (!$("#userid1").val()) {
			alert('아이디를 입력하세요');
			$("#userid1").focus();
			return;
		}
		if (!$("#pwd1").val()) {
			alert('패스워드를 입력하세요');
			$("#pwd1").focus();
			return;
		}
		$("#adminF").submit();
	}
</script>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-offset-2 col-md-7">
				<form role="form" name="amdinF" id="adminF" method="post" action="admin_joinEnd.do">
					<input type="text" name="상태" value="0">
					<div id="divname" class="form-group">
						<label class="control-label" for="name">이 름</label>
						<input class="form-control" type="text"	name="aname" id="aname" placeholder="이름을 입력하세요.">
					</div>

					<div id="divid" class="form-group">
						<label class="control-label" for="id">아이디</label>
						<input class="form-control" type="text" name="userid1" id="userid1"	placeholder="아이디를 입력하세요.(영어,숫자 조합 8~20자리)">
					</div>

					<div id="divpwd" class="form-group">
						<label class="control-label" for="pwd">비밀번호</label>
						<input class="form-control" type="password" name="pwd1" id="pwd1"
							placeholder="비밀번호를 입력하세요.(영어, 숫자, 특수문자 조합 8~16자리)">
					</div>
					<div id="divemail" class="form-group">
						<label class="control-label" for="email">이메일</label>
						<input class="form-control" type="email" name="email" id="email"
							placeholder="e-mail을 입력하세요.">
					</div>
					<div class="form-group" id="divmhp">
						<label class="control-label" for="hp1">연락처
						<input type="text" class="form-control" name="hp1" id="hp1"
							style="margin: 5px 0px 0px 0px" placeholder="연락처 앞 3자리"
							maxlength="3">
						</label> - 
						<label for="hp2" class="control-label">
						 <input type="text" class="form-control" name="hp2" id="hp2"
							placeholder="연락처 가운데 3~4자리" maxlength="4">
						</label> - 
						<label for="hp3" class="control-label">
						<input type="text" class="form-control" name="hp3" id="hp3"
							placeholder="연락처 마지막 4자리" maxlength="4">
						</label>
					</div>
					<div class="text-center">
					<div class="form-group">
						<a class="btn btn-primary" onclick="adminJoin()">등  록</a>
					</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<c:import url="/Foot.do"/>

























