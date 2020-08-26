<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/Top.do"/>
<script type="text/javascript">
$(function(){
	$("#qnaDel").click(function(){
		var cSize = "";
		$("input[id ^= checkTr]").not(":checked").each(function(){
			$(this).attr("disabled","disabled");
			if(cSize == ""){
				cSize = $(this).val();
			} else {
			 cSize = cSize+","+$(this).val();	
			}
		});
		$('#cnb').submit();
	});
});
qnaEnd = function(val){
	//alert(val);
	$("#Endidx").val(val);
	$("#leF").submit();
}
</script>
<div class="section">
<div class="container">
<form name="leF" id="leF" action="${pageContext.request.contextPath}/qnaListEnd.do" method="post">
	<input type="hidden" name="qna_idx" id="Endidx">
</form>
<form name="chb" id="cnb" action="qnaDel.do" method="post">
	<table class="table table-hover text-center table-responsive">
		<thead>
			<tr class="info">
				<th class="text-center" width="10%">선 택</th>
				<th class="text-center" width="40%">문의 제목</th>
				<th class="text-center" width="25%">문의 일시</th>
				<th class="text-center" width="25%">답변 여부</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${clist eq null or empty clist}">
			<tr>
				<td colspan="4">문의하신 내용이 없습니다.</td>	
			</tr>
			</c:if>
			<c:if test="${clist ne null and not empty clist}">
			<c:forEach var="list" items="${clist}" varStatus="i">
			<tr>
				<td><input type="checkbox" name="checkTr" id="checkTr${i}" value="${list.qna_idx}"></td>
				<td><a onclick="qnaEnd('${list.qna_idx}')">
				<c:if test="${fn:length(list.qna_title)>20}">		
					<c:out value="${fn:substring(list.qna_title,0,20)}" />
			 		...	
				</c:if>
				<c:if test="${fn:length(list.qna_title)<= 20}">		
					<c:out value="${list.qna_title}" />
				</c:if>
				</a></td>
				<td>${list.wdate}</td>
				<c:if test="${list.ch eq 1}">
				<td>답변완료</td>
				</c:if>

				<c:if test="${list.ch ne 1}">
				<td>답변대기</td>
				</c:if>

			</tr>
			</c:forEach>
			</c:if>
			<tr>
				<td colspan="3" align="center">
					${pageNavi}
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	<div class="col-md-12">
		<div class="col-md-offset-10 col-md-2">
			<a class="btn btn-primary" id="qnaDel">선택 삭제</a>
		</div><br>
	</div>
</div>
</div>
<c:import url="/Foot.do"/>

