<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--  -->
<% 
	String Ctx=request.getContextPath();
%>   
<script src="<%=Ctx%>/js/jquery-1.12.3.min.js"></script>
<c:import url="/Top.do"/>
<div align="center" class="container">
<hgroup>
	<h1>글 내용 보기</h1>
</hgroup>


<br>

<table  class="table table-bordered" >
	<tr>
		<td width="20%" class="m1">글번호</td>
		<td width="30%">${board.mb_num}</td>
		<td width="20%" class="m1">작성일</td>
		<td width="30%">${board.mb_indate}</td>
	</tr>
	<tr>
		<td width="20%" class="m1">글쓴이</td>
		<td width="30%"><c:out value="${board.mb_userid}"/></td>
		<td width="20%" class="m1">조회수</td>
		<td width="30%">${board.mb_hits}</td>
	</tr>
	
	<tr>
		<td width="20%" class="m1">제목</td>
		<td width="40%" align="left">
		${board.mb_title}
		</td>
		<td width="10%" class="m1">말머리</td>
		<td width="30%" class="m1">${board.mb_select}</td>
	</tr>
	<tr>
	<c:if test="${board.mb_score eq 0}">
	<td width="20%" class="m1">글 추천 수</td>
	<td colspan="3">${board.mb_recommand}</td>
	</c:if>
	<c:if test="${board.mb_score ne 0}">
	<td width="20%" class="m1">글 추천 수</td>
	<td width="30%">${board.mb_recommand}</td>
	<td width="20%" class="m1" >별점 수</td>
	<td width="30%">
	<c:if test="${board.mb_score eq 1}">★</c:if>
	<c:if test="${board.mb_score eq 2}">★★</c:if>
	<c:if test="${board.mb_score eq 3}">★★★</c:if>
	<c:if test="${board.mb_score eq 4}">★★★★</c:if>
	<c:if test="${board.mb_score eq 5}">★★★★★</c:if>
	</td>
	</c:if>
	</tr>
	<tr height="60" >
		<td width="20%" class="m1">글내용</td>
		<td id="contents1"colspan="3" align="left">
		${board.mb_contents}
		<br>
		<div class="text-center">
		<hr />
		<a id="r1" class="btn btn-default" onclick='recommend()'>추천하기</a>
		</div>
		</td>
		
	</tr>
	<tr>
		<td colspan="4" align=center>
		<a href="NewboardList.do">목록</a>|
	
		<c:if test="${loginUser.idx == board.idx}">
		<a onclick="Edit()" >편집</a>|
		<a onclick="Delete()" >삭제</a>|
		</c:if>
		
		<a href="#">답변</a>	
		
		</td>
	</tr>
</table>
<!--편집 또는 삭제 관련 form 시작----------------  -->

<form name="pf" id="pf" method="POST">
	<input type="hidden" name="mb_num" id="mb_num" value="${board.mb_num}">
</form> 

<!-- -------------------------------------------- -->
</div>
</div>



<script type="text/javascript">
function recommend(){
	$('#r1').attr('disabled','disabled');
	
}
function Delete(){
	pf.action="delete.do";
	pf.method="POST";
	pf.submit();
}
function Edit(){
	pf.action="editForm.do";
	pf.method="POST";
	pf.submit();
}

</script>

<c:import url="/Foot.do"/>
