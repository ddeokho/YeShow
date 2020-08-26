<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/Top.do" />
<script type="text/javascript">
comment = function(QnA_idx, idx){
	//alert("!23");
	$("#QnA_idx").val(QnA_idx);
	$("#idx").val(idx);
	$("#rf").submit();
}
</script><p><p><br><br>
<div class="section">
<div class="container">
	<table class="table table-hover table-responsive">
		<thead>
			<tr class="info">
				<th class="text-center" width="60%">내 용</th>
				<th class="text-center" width="20%">문의일시</th>
				<th class="text-center" width="20%">답변여부</th>
			</tr>
		</thead>
		<tbody style="padding: 2px 2px 5px 2px">

			<tr>
				<td><span style="font-size: 20px;"> <i
						class="fa fa-fw fa-lg fa-question"></i> <b>${ovo.qna_title}</b></span><br>
				<br> <span style="font-size: 25px;">${ovo.qna_content}</span><br>
					<c:if test="${ovo.qna_Img1 ne null && not empty ovo.qna_Img1}">
					<img src="${pageContext.request.contextPath}/upload/${ovo.qna_Img1}" class="img img-thumbnail img responsive" width="100px">
					</c:if>
					
					<c:if test="${ovo.qna_Img2 ne null && not empty ovo.qna_Img2}">
					<img src="${pageContext.request.contextPath}/upload/${ovo.qna_Img2}" class="img img-thumbnail img responsive" width="100px">
					</c:if>
					
					<c:if test="${ovo.qna_Img3 ne null && not empty ovo.qna_Img3}">
					<img src="${pageContext.request.contextPath}/upload/${ovo.qna_Img3}" class="img img-thumbnail img responsive" width="100px">
					</c:if>
					
					<c:if test="${ovo.qna_Img4 ne null && not empty ovo.qna_Img4}">
					<img src="${pageContext.request.contextPath}/upload/${ovo.qna_Img4}" class="img img-thumbnail img responsive" width="100px">
					</c:if>
					</td>
				<td class="text-center">${ovo.wdate}</td>
				<c:if test="${ovo.ch eq 1}">
					<td class="text-center">답변완료</td>
				</c:if>
				<c:if test="${ovo.ch ne 1}">
					<td class="text-center">답변대기</td>
				</c:if>
			</tr>
			<tr>
				<td>
					<span style="font-size:20px;">
						<i class="fa fa-fw fa-lg fa-ellipsis-h"></i><i class="fa fa-fw fa-lg fa-angle-double-right"></i><b>답변내용</b>
					</span><br><br>
				<c:if test="${ovo.ch eq 1}">
					<span style="font-size:25px;">${ocvo.re_QnA_content}</span>				
				</c:if>
				<c:if test="${ovo.ch ne 1}">
					<span style="font-size:25px;">관리자가 아직 답변을 하지 않았습니다.</span>
				</c:if>	
				</td>
				<td class="text-center">${ocvo.wdate}
				</td>
				<td>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="container text-right">
		<a class="btn btn-primary"
			href="${pageContext.request.contextPath}/admin/qnaList.do">목록</a>
	</div><br><br>
	<c:if test="${ovo.ch ne 1}">
	<div>
	<form name="rf" id="rf" action="${pageContext.request.contextPath}/admin/reply.do" method="POST">
		<input type="text" name="qnA_idx" id="QnA_idx">
		<input type="text" name="idx" id="idx">
		<table class="table table-responsive">
			<tr>
				<th colspan="4" class="info text-center">
					<h3>1:1 문의 답글 달기</h3>
				</th>
			</tr>
			<tr>
				<td width="20%" class="text-center"><b>작성자</b></td>
				<td width="80%"><input type="text" name="re_QnA_Adminid"
					class="form-control" value="관리자"></td>
			</tr>
			<tr>
				<td width="20%" class="text-center"><b>내  용</b></td>
				<td colspan="3" width="80%">
				<textarea class="form-control" name="re_QnA_content" rows="15"></textarea></td>
			</tr>
		</table>
	</form>
	</div>
	<div class="container text-center">
		<a class="btn btn-primary" id="comment"
			onclick="comment('${ovo.qna_idx}','1')">답변완료</a>
	</div>
	</c:if>
</div>
</div>
<c:import url="/Foot.do" />