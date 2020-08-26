<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/Top.do"/>
<script type="text/javascript">
	$(function() {
		$("#com_Btn").click(function() {
			if(!$("#qna_title").val() || !$("#qna_content")){
				alert("문의제목과 내용을 입력하세요");
				return;
			}
			$("#pqna_write").attr("action", "${pageContext.request.contextPath}/qnaEnd.do").submit();
		});
	});
</script>
<div class="section">
<div class="container">
<form class="form-horizontal" role="form" id="pqna_write"
	name="pqna_write" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<div class="col-md-2">
			<label for="pqna_id" class="control-label">아이디</label>
		</div>
		<div class="col-md-10">
			<input type="text" value="${loginUser.idx}" id="idx" name="idx">
			<input type="text" class="form-control" id="qna_userid" name="qna_userid"
				value="${loginUser.userid}">
			<%-- <span class="form-control">${loginUser.userid}</span> --%>
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-2">
			<label for="pqna_title" class="control-label">문의 제목</label>
		</div>
		<div class="col-md-10">
			<input type="text" class="form-control" id="qna_title" name="qna_title"
				placeholder="문의 제목">
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-2">
			<label for="pqna_contents" class="control-label">문의 내용</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" id="qna_content" name="qna_content"
				placeholder="문의 내용" rows="16"></textarea>
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-2">
			<label for="pqna_file1" class="control-label">첨부파일</label>
		</div>
		<div class="col-md-10">
			<input type="file" class="form-control" id="qna_Img1" name="mqna_Img1"
				placeholder="첨부파일" multiple>
		</div>
		<div class="col-md-2">
			<label for="pqna_file2" class="control-label"></label>
		</div>
		<div class="col-md-10">
			<input type="file" class="form-control" id="qna_Img2" name="mqna_Img2"
				placeholder="첨부파일" multiple>
		</div>
		<div class="col-md-2">
			<label for="pqna_file3" class="control-label"></label>
		</div>
		<div class="col-md-10">
			<input type="file" class="form-control" id="qna_Img3" name="mqna_Img3"
				placeholder="첨부파일" multiple>
		</div>
		<div class="col-md-2">
			<label for="pqna_file4" class="control-label"></label>
		</div>
		<div class="col-md-10">
			<input type="file" class="form-control" id="qna_Img4" name="mqna_Img4"
				placeholder="첨부파일" multiple>
		</div>
	</div>
	<div class="form-group text-center" id="com">
		<a class="btn btn-primary" id="com_Btn">문의하기</a>
	</div><br>
</form>
</div>
</div>
<c:import url="/Foot.do"/>