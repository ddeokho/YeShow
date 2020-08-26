<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<% 
	String Ctx=request.getContextPath();
%> 
<c:import url="/Top.do"/>
<div align="center">
<script type="text/javascript" src="<%=Ctx%>/ckeditor/ckeditor.js">
</script>
<script src="<%=Ctx%>/js/jquery-1.12.3.min.js" ></script>
<script type="text/javascript">
	check=function(){
		if(!f.mb_userid.value){
			alert('작성자를 입력하세요');
			f.mb_userid.focus();
			return;
		}
		if(!f.mb_title.value){
			alert('제목을 입력하세요');
			f.mb_title.focus();
			return;
		}
		if(!f.mb_select.value){
			alert('말머리를 입력하세요');
			f.mb_select.focus();
			return;
		}
		
		f.submit();
	}
		
	$(function() {
	    $('#star').hide(); 
	    $('#mb_select').change(function(){
	        if($('#mb_select').val() == '리뷰글') {
	            $('#star').show(); 
	        } else {
	            $('#star').hide(); 
	        } 
	    });
	});  
	
</script>
<div class="container">
<hr width="500" color="#efefef">
<h3>게시판 수정</h3>
<br>
<a href="NewboardList.do">목록</a>|
<a href="main.do">HOME</a>|
<hr width="500" color="#efefef">
<!-- 파일업로드 처리 위해 method="POST"
 enctype="multipart/form-data" -->
<form name="f" action="write.do" method="POST"
enctype="multipart/form-data">
<input type="text" name="mb_num"  value="${board.mb_num}">
 	<table  class="table table-bordered">
 		<tr>
 			<td width="20%" class="m2"><b>제목</b></td>
 			<td width="80%" align="left">
 			<input type="text" name="mb_title" id="mb_title"
 			value="${board.mb_title}"
 			 size="40" class="box"/>
 			</td>
 		</tr>
 		<tr>
 			<td width="20%" class="m2"><b>글쓴이</b></td>
 			<td colspan="2" align="left">
 			<input type="text" name="mb_userid"
 			value="${board.mb_userid}"
 			 size="40" class="box"/>
 			</td>
 			
 		</tr>
 		<tr>
 		
 		<td width="20%" class="m2"><b>말머리</b>
 			<td width="80%" align="left">
 			
 			<select name="mb_select" id="mb_select">
 				<optgroup label="::말머리 선택::">
 					<option value="자유글" >자유글</option>
 					<option value="리뷰글" >리뷰글</option>
 				</optgroup>	
 			</select>
 			</td>
 		</tr>
 		
 		<tr id="star">
 			<td width="20%" class="m2"><b>별점</b>
 			<td>
 				<input type="radio" name="mb_score" class="rating" value="1">1점
    			<input type="radio" name="mb_score" class="rating" value="2">2점
    			<input type="radio" name="mb_score" class="rating" value="3">3점
    			<input type="radio" name="mb_score" class="rating" value="4">4점
    			<input type="radio" name="mb_score" class="rating" value="5">5점
 			</td>
 		</tr>
 		
 		<tr>
 			<td width="20%" class="m2"><b>글내용</b></td>
 			<td width="80%" align="left">
 			<textarea name="mb_contents" id="mb_contents"
 			 class="box" rows="10" cols="50">${board.mb_contents}</textarea>
 			 <script type="text/javascript">
 				 CKEDITOR.replace('mb_contents');
 			 </script>
 			</td>
 		</tr>
 			<tr>
 			<td width="20%" class="m2"><b>첨부파일</b></td>
 			<td width="80%" align="left">
 			<input type="file" 
 			name="fileup" size="30" class="box"/>
 			
 			<!--input name이 BoardController의
 			 MultipartFile 타입의 프로퍼티명과
 			일치해야 함
 			파라미터명을 fname으로 주고, BoardController
 			에서 MultipartFile타입의 변수 fname으로 받자. 			
 			 -->
 			 
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
 
</form>
</div>
</div>


<c:import url="/Foot.do"/>

