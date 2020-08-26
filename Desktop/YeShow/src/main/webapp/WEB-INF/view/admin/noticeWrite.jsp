<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/Top.do"/>

<script type="text/javascript">
	var inNoteListEnd = function() {
		if (!$("#ntitle").val()) {
			alert('공지제목을 입력하세요');
			$("#ntitle").focus();
			return;
		}
		if (!$("#ncontents").val()) {
			alert('내용을 입력하세요');
			$("#ntitle").focus();
			return;
		}
		$("#notiF").submit();
	}
</script>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-offset-2 col-md-7">
				<form role="form" name="notiF" id="notiF" method="post" action="${pageContext.request.contextPath}/admin/noticeWriteEnd.do">
					<input type="hidden" name="anum" value="1"><!-- 관리자 번호 -->
					<div class="form-group">
						<label class="control-label" for="name">작성자</label> <span
							class="form-control">admin(관리자아이디)</span> <input
							class="hidden" type="text" name="aid" id="aid"
							value="admin"><!-- 관리자 아이디 -->
					</div>

					<div class="form-group">
						<label class="control-label" for="ntitle">공지 제목</label> <input
							class="form-control" type="text" name="ntitle" id="ntitle">
					</div>
					<div class="form-group">
						<label for="ncontents" class="control-label">공지 내용</label>
						<textarea class="form-control" id="ncontents" name="ncontents"
							rows="16"></textarea>
					</div>
					<div class="text-center">
						<div class="form-group">
							<a class="btn btn-primary" onclick="inNoteListEnd()">등 록</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<c:import url="/Foot.do"/>

























