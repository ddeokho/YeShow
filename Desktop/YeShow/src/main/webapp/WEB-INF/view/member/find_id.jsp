<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Top.do"/>

<script type="text/javascript">
	var	find_id2=function(){
		findid2.submit();
	}
</script>

<form role="form" name="findid2" id="findid2" action="${pageContext.request.contextPath}/member/find_id.do" method="POST">
<div class="section">
	<div class="container">
        <div class="row">
          <div class="col-md-12">
	<div id="div_findid_name" class="form-group">
		<label class="control-label" for="findid_name">이 름</label>
		<input class="form-control" type="text" autofocus="autofocus" name="findid_name"
			id="findid_name" placeholder="이름을 입력하세요.">
	</div>
	
	<div id="div_findid_email" class="form-group">
		<label class="control-label" for="findid_email">이메일</label>
			<input class="form-control" type="email" name="findid_email" id="findid_email"
				placeholder="e-mail을 입력하세요.">
	</div>
	
	<div class="text-center">
		<button type="button" class="btn btn-primary" onclick="find_id2()">아이디 찾기</button>
	</div>
</div>
</div>
</div>
</div>
</form>
<c:import url="/Foot.do"/>
