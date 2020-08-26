<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/Top.do"/>
<script type="text/javascript">
qnaEnd = function(idx){
	$("#c_idx").val(idx);
	$("#qnaEndf").submit();
}
</script>
<div class="section">
<div class="container">
<form name="qnaEndf" id="qnaEndf" action="${pageContext.request.contextPath}/admin/complainListEnd.do" method="post">
	<input type="hidden" name="idx" id="c_idx">
</form>
	<table class="table table-hover text-center table-responsive">
		<thead>
			<tr>
				<th colspan="4" class="text-right">총 문의 : <span
					style="color: red; font-weight: blod;">${totalCount} 개</span>
				</th>
				<th class="text-center">미 답변문의 : <span
					style="color: red; font-weight: blod;"> ${noComment} 개</span>
				</th>
			</tr>
			<tr class="info">
				<th class="text-center" width="10%">글번호</th>
				<th class="text-center" width="25%">문의 아이디</th>
				<th class="text-center" width="25%">문의 제목</th>
				<th class="text-center" width="20%">문의 일시</th>
				<th class="text-center" width="20%">답변 여부</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${list eq null || empty list}">
				<tr>
					<td colspan="4">문의하신 내용이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${list ne null && not empty list}">
				<c:forEach var="i" items="${list }">
					<tr>
						<td>${i.qna_idx }</td>
						<td>${i.qna_userid}</td>
						<td><a onclick="qnaEnd('${i.qna_idx}')"><c:if
									test="${fn:length(i.qna_title)>20}">
									<c:out value="${fn:substring(i.qna_title,0,20)}" />
			 		...	
				</c:if> <c:if test="${fn:length(i.qna_title)<= 20}">
									<c:out value="${i.qna_title}" />
								</c:if>
						</a></td>
						<td>${i.wdate}</td>
						<c:if test="${i.ch eq 1 }">
							<td>답변완료</td>
						</c:if>
						<c:if test="${i.ch ne 1 }">
							<td>답변대기</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="5" align="center">${pageNavi}</td>
			</tr>
		</tbody>
	</table>
</div>
</div>
<c:import url="/Foot.do"/>
