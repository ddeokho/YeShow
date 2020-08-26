<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--  -->
<c:import url="/Top.do"/>
<div align="center" class="container">
<hgroup>
	<h1>글 내용 보기</h1>
</hgroup>

<br>
<table  class="table table-bordered" >
	<tr>
		<td width="20%" class="m1">순번</td>
		<td width="30%">${board.idx}</td>
		<td width="20%" class="m1">작성일</td>
		<td width="30%">${board.wdate}</td>
	</tr>
	<tr>
		<td width="20%" class="m1">글쓴이</td>
		<td width="30%"><c:out value="${loginUser.userid1}"/></td>
		<td width="20%" class="m1">첨부파일</td>
		<td width="30%">
		<a href="../fileDown.do?filename=${board.filename}">
		${board.filename}</a>[${board.filesize}] bytes
		</td>
		<%-- <td width="20%" class="m1">조회수</td>
		<td width="30%">${board.readnum}</td> --%>
	</tr>
	<%-- <tr>
		<td width="20%" class="m1">홈페이지</td>
		<td width="30%">${board.homepage}</td>
		<td width="20%" class="m1">첨부파일</td>
		<td width="30%">
		<a href="../fileDown.do?filename=${board.filename}">
		${board.filename}</a>[${board.filesize}] bytes
		</td>
	</tr> --%>
	<tr>
		<td width="20%" class="m1">제목	</td>
		<td colspan="3" align="left">
		<c:out value="${board.subject}"/>
		</td>
	</tr>
	<tr height="60" >
		<td width="20%" class="m1">글내용</td>
		<td colspan="3" align="left">
		<c:out value="${board.content}"/>
		</td>
	</tr>
	<tr>
		<td colspan="4" align=center>
		<a href="list.do">목록</a>|
		<a href="#" onclick="setting('${board.idx}','1')">편집</a>|
		<a href="#" onclick="setting('${board.idx}','2')">삭제</a>|
		<a href="javascript:goRewrite()">답변</a>		
		</td>
	</tr>
</table>
<!--편집 또는 삭제 관련 form 시작----------------  -->
<form name="pf" id="pf" action="./pForm.do" method="POST">
	<input type="hidden" name="idx2" id="idx2">
	<input type="hidden" name="mode" id="mode">
</form>
<!-- -------------------------------------------- -->

<!-- 답변 달기 form 시작------------------------------- -->
<form name="rcf" id="rcf" action="./rewrite.do"  method="POST">
	<input type="hidden" name="idx"
			 		value="${board.idx}">
	<input type="hidden" name="subject"
	 				value="${board.subject}">
	<!-- hidden으로 부모글의 글번호와 제목을 넘기자 -->
</form>


<!--리플 목록 테이블---------------------  -->
<table class="table table-condensed table-hover">
	<tr>
		<th colspan="3" class="text-center">
		<h2>:::Reply List:::</h2>
		<c:if test="${rCount>0}">
		<span class="label label-warning pull-right">
		${rCount}</span>
		</c:if>
		</th>
	</tr>
	<tr>
		<th width="10%">글번호</th>
		<th width="70%">글내용</th>
		<th width="20%">작성일</th>
	</tr>
	<!-- ------------------- -->
	<c:if test="${rList eq null or empty rList }">
	<tr>
		<td colspan="3">리플이 없습니다.</td>
	</tr>
	</c:if>
	<c:if test="${rList ne null and not empty rList }">	
	<c:forEach var="rvo" items="${rList}" varStatus="st">
	<tr>
		<td>${rvo.num}</td>
		<td>${rvo.content}
			<span class="pull-right">${rvo.name} [${rvo.userid}]</span>
		</td>
		<td>
			<fmt:formatDate value="${rvo.wdate}"
			pattern="yyyy-MM-dd hh:mm"/>
		</td>
	</tr>
	</c:forEach>
	</c:if>
	<!-- ------------------- -->
</table>
<!-- ------------------------------------------------ -->

<!-- 꼬리글 달기 form시작---------------------------------->
<p></p>

<!-- 꼬리글 펼치기 
<form name="frm">
  <input type="button" onclick="javascript:openReply()" value="리플보기">
 </form>
 <div id="reply" style="display:none;">ssssssss</div>
----------  -->
  
<form name="rf" id="rf" action="../user/board/reply.do"
 method="POST">
<input type="hidden" name="idx_fk" value="${board.idx}">

<table class="table table-responsive table-bordered">
	<tr>
	<th colspan="4" class="text text-success text-center">
	<h2>:::꼬리글 달기:::</h2></th>
	</tr>
	<tr>
		<td width="20%"><b>작성자</b></td>
		<td width="30%"><c:out value="${loginUser.name}"/></td>
		<!-- <td width="30%">
		<input type="hidden" name="name" id="name"			
		 class="form-control">
		
		</td> -->	
		<td width="20%"><b>아이디</b></td>
		<td width="30%"><c:out value="${loginUser.userid1}"/></td>
		
		<!-- <td width="30%">
			<input type="hidden" name="userid"
			  class="form-control" value="Hong">
		</td> -->
	</tr>
	<tr>
		<td width="20%"><b>글내용</b></td>
		<td colspan="3" width="80%">
		<input type="text" name="content" 
		id="content" class="form-control">
		<input type="submit" value="글쓰기"
		 class="btn btn-default">
		</td>
	</tr>
</table>
<input type="hidden" name="name" id="name" value="${loginUser.name}"class="form-control">
<input type="hidden" name="userid1" class="form-control" value="${loginUser.userid1}">
</form>
<p></p>
<!-- ------------------------------------------------------- -->

</div>

<script type="text/javascript">

function setting(vidx, vmode){
	alert(vidx);
	$('#idx2').val(vidx);
	
	//vmode가 1이면 편집, 2면 삭제
	$('#mode').val(vmode);
	pf.submit();
}

function goRewrite(){
	//cf.submit();
	var url=$('#rcf').attr('action');
	//alert(url);
	$('#rcf').submit();
}//----------------

function openReply(){
	  if(document.getElementById("reply").style.display=="block"){
	   document.getElementById("reply").style.display="none";
	  }else{
	   document.getElementById("reply").style.display="block";
	  }
	 }

</script>


<c:import url="/Foot.do"/>


