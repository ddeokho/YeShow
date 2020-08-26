<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/Top.do"/>
<%-- <%
	MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	AdminVO loginAdmin = (AdminVO) session.getAttribute("loginAdmin");
	if(loginAdmin == null && loginUser == null){
%>
<script type="text/javascript">
	alert('로그인해야 이용 가능');
	location.href = "../index.mp";
</script>
<%
	return;
	}
	
	String idx = request.getParameter("idx");
	NoteboardDAO dao = new NoteboardDAO();
	List<NoteboardVO> arr = dao.getQnAListIdx(Integer.parseInt(idx));
	
%> --%>
<div class="container">
	<table class="table table-hover table-responsive">
		<thead>
			<tr class="info">
				<th class="text-center" width="60%">내  용</th>
				<th class="text-center" width="20%">문의일시</th>
				<th class="text-center" width="20%">답변여부</th>
			</tr>
		</thead>
		<tbody style="padding:2px 2px 5px 2px">
			<%-- <%
				if (arr != null) {
			%>
			<%
				for (int i = 0; i < arr.size(); i++) {
						NoteboardVO vo = arr.get(i);
			%> --%>
			<tr>
				<td>
					<span style="font-size:20px;">
					<i class="fa fa-fw fa-lg fa-question"></i>
					<b>${note.qna_title}</b></span><br><br>
					<span style="font-size:25px;">${note.qna_content}</span><br>
					
					<c:if test="${note.qna_Img1 ne null && not empty note.qna_Img1}">
					<img src="${pageContext.request.contextPath}/upload/${note.qna_Img1}" class="img img-thumbnail img responsive" width="100px">
					</c:if>
					
					<c:if test="${note.qna_Img2 ne null && not empty note.qna_Img2}">
					<img src="${pageContext.request.contextPath}/upload/${note.qna_Img2}" class="img img-thumbnail img responsive" width="100px">
					</c:if>
					
					<c:if test="${note.qna_Img3 ne null && not empty note.qna_Img3}">
					<img src="${pageContext.request.contextPath}/upload/${note.qna_Img3}" class="img img-thumbnail img responsive" width="100px">
					</c:if>
					
					<c:if test="${note.qna_Img4 ne null && not empty note.qna_Img4}">
					<img src="${pageContext.request.contextPath}/upload/${note.qna_Img4}" class="img img-thumbnail img responsive" width="100px">
					</c:if>
					
				</td>
				<td class="text-center">${note.wdate}</td>
				<c:if test="${note.ch eq true}">
				<td class="text-center">답변완료</td>
				</c:if>
				<c:if test="${note.ch ne true}">
				<td class="text-center">답변대기</td>
				</c:if>
			</tr>
			<tr>
				<td colspan="3">
					<span style="font-size:20px;">
						<i class="fa fa-fw fa-lg fa-ellipsis-h"></i><i class="fa fa-fw fa-lg fa-angle-double-right"></i><b>답변내용</b>
					</span><br><br>
				<c:if test="${note.ch eq true}">
					<span style="font-size:25px;"><%-- <%=vo.getAdminreview() %> --%></span>				
				</c:if>
				<c:if test="${note.ch ne true}">
					<span style="font-size:25px;">관리자가 아직 답변을 하지 않았습니다.</span>
				</c:if>
				
				</td>
			
			</tr>
		
		</tbody>
	</table>
</div>
<c:import url="/Foot.do"/>