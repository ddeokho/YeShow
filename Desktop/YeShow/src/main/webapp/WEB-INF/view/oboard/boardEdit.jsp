<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--  -->
<c:import url="/Top.do"/>
<div align="center">
<script type="text/javascript">
	check=function(){
		if(!f.name.value){
			alert('작성자를 입력하세요');
			f.name.focus();
			return;
		}
		if(!f.subject.value){
			alert('제목을 입력하세요');
			f.subject.focus();
			return;
		}
		if(!f.content.value){
			alert("글 내용을 입력하세요");
			f.content.focus();
			return;
		}
		if(!f.pwd.value){
			alert('비밀번호를 입력하세요');
			f.pwd.focus();
			return;
		}
		f.submit();
	}
</script>
<div class="container">
<hr width="500" color="#efefef">
<h3>자유게시판 글수정</h3>
<br>
<a href="list.do">목록</a>|
<a href="${pageContext.request.contextPath}/main.do">HOME</a>|
<hr width="500" color="#efefef">
<!-- 파일업로드 처리 위해 method="POST"
 enctype="multipart/form-data" -->
<form name="f" action="editEnd.do" method="POST"
enctype="multipart/form-data">
 	<!--수정하기 위해 반드시 글번호가 있어야 한다.  -->
 	<input type="hidden" name="idx"  value="${board.idx}">
 	<table  class="table table-bordered">
 		<tr>
 			<td width="20%" class="m2"><b>제목</b></td>
 			<td width="80%" align="left">
 			<input type="text" name="subject"
 			value="${board.subject}"
 			 size="40" class="box"/>
 			</td>
 		</tr>
 		<%-- <tr>
 			<td width="20%" class="m2"><b>글쓴이</b></td>
 			<td width="80%" align="left">
 			<input type="text" name="name"
 			value="${loginUser.userid1}"
 			 size="40" class="box"/>
 			</td>
 		</tr> --%>
 		<%-- <tr>
 			<td width="20%" class="m2"><b>이메일</b></td>
 			<td width="80%" align="left">
 			<input type="text" name="email"
 			value="${board.email}"
 			 size="40" class="box"/>
 			</td>
 		</tr>
 			<tr>
 			<td width="20%" class="m2"><b>홈페이지</b></td>
 			<td width="80%" align="left">
 			<input type="text" name="homepage"
 			 size="40" class="box" value="${board.homepage}"/>
 			</td>
 		</tr> --%>
 			<tr>
 			<td width="20%" class="m2"><b>글내용</b></td>
 			<td width="80%" align="left">
 			<textarea name="content"
 		class="box" rows="10" cols="50">${board.content}</textarea>
 			</td>
 		</tr>
 			<tr>
 			<td width="20%" class="m2"><b>비밀번호</b></td>
 			<td width="80%" align="left">
 			<input type="password" name="pwd"
 			 size="20" class="box"/>
 			</td>
 		</tr>
 			<tr>
 			<td width="20%" class="m2"><b>첨부파일</b></td>
 			<td width="80%" align="left">
 			<c:if test="${board.filesize>0}">
 			<b>${board.filename}</b> [${board.filesize}] bytes
 			<!--hidden data-------------------------  -->
 			<input type="text" name="filename"
 							 value="${board.filename}">
			<input type="text" name="filesize"
 							 value="${board.filesize}"> 							 
 			<!--------------------------------------  -->
 			</c:if>
 			
 			<input type="file" 
 			name="fileup" size="30" class="box"/> 			
 			</td>
 		</tr>
 		<tr>
 			<td colspan="2" class="m1">
 			<input type="button" value="글수정"
 			 onclick="check();">
 			 <input type="reset" value="다시쓰기">
 			</td>
 		</tr>
 	</table>
 <input type="hidden" name="name"
 			 size="40" class="box" value="${loginUser.userid1}"/>
</form>
</div>
</div>
<c:import url="/Foot.do"/>

