<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Top.do"/>
<script type="text/javascript">
	var find_pwd1=function(){
		findpwd2.submit();
	}
</script>

<form role="form" name="findpwd2" id="findpwd2" action="${pageContext.request.contextPath}/member/find_pwd.do" method="POST">
<div class="section">
<div class="container">
<div class="row">
	<div id="div_findpwd_name" class="form-group">
		<label class="control-label" for="findpwd_id">아이디</label>
		<input class="form-control" type="text" autofocus="autofocus" name="findpwd_id"
			id="findpwd_id" placeholder="아이디를 입력하세요.">
	</div>
	
	<div id="div_findpwd_email" class="form-group">
		<label class="control-label" for="findpwd_email">이메일</label>
			<input class="form-control" type="email" name="findpwd_email" id="findpwd_email"
				placeholder="e-mail을 입력하세요.">
	</div>
	
	<div class="text-center">
		<button type="button" class="btn btn-primary" onclick="find_pwd1()">비밀번호 찾기</button>
	</div>
</div>
</div>
</div>
</form>


<c:import url="/Foot.do"/>