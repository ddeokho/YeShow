<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<c:import url="/Top.do"/>
<div class="row">
	<div class="col-md-10 col-md-offset-2">
		<h1>${idx}번 ${title}</h1>
		<p>
		<form name="pwdF" id="pwdF" method="POST">
		<!-- hidden data------------------ -->
		<input type="hidden" name="idx" value="${idx}">
		<!-- ------------------------------ -->
			<label for="pwd" class="col-md-2">비밀번호</label>
			<div class="col-md-6">
			<input type="password" class="form-control"
			 name="pwd" id="pwd">
			</div>
			<button type="button"
			 class="btn btn-success"
			  onclick="send()">${title}</button>
		</form>
	</div>
</div>
<script type="text/javascript">
	function send(){
		if(!pwdF.pwd.value){
			alert('글 비밀번호를 입력하세요');
			pwdF.pwd.focus();
			return;
		}
		<c:if test="${mode eq 1}">/*편집  */
			pwdF.action="editForm.do";
		</c:if>
		<c:if test="${mode eq 2}">/*삭제  */
			pwdF.action="delete.do";
		</c:if>
		pwdF.method="POST";
		pwdF.submit();
	}
</script>





<c:import url="/Foot.do"/>