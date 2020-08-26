<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Top.do"/>


<script type="text/javascript">
/* 우편번호 찾기  */
function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr
								+ ')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('sample6_address').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('sample6_address2').focus();
				}
			}).open();
}
	
	comp = function(){
		if($("#mhp3").val()){
			var str = $("#mhp3").val();		
			if(str.length == 11){
				$("#hp1").val(str.substr(0,3));
				$("#hp2").val(str.substr(3,4));
				$("#hp3").val(str.substr(7,4));
			
			}else if(str.length == 10){
				$("#hp1").val(str.substr(0,3));
				$("#hp2").val(str.substr(3,3));
				$("#hp3").val(str.substr(6,4));
			
			}else if(!str){
				$("#mohpHelp").show();
				$("#divmohp").addClass("has-error");
				return;
			}
		}
		$("#mf").submit();
	}
</script>
<script type="text/javascript">

$(function() {
	$("#name").keyup(function() {
		if (!$("#name").val()) {
			$("#nameHelp").show();
			$('#divname').addClass('has-error');
			return;
		} else {
			$("#nameHelp").hide();
			$('#divname').removeClass('has-error');
			$('#divname').addClass('has-success');
		}
	});
	
	$("#userid1").keyup(function() {
				var check = /^(?=(.*[\d]){1,})(?=(.*[a-z]){1,})(?:[\da-zA-Z]){8,20}$/;
				if (!$("#userid1").val()
						|| check.test($("#userid1").val()) == false) {
					$("#idHelp").html("아이디는 영어, 숫자 조합 8~20자리 입니다.");
					$("#idHelp").show();
					$("#divid").addClass("has-error");
					return;
				} else {
					//alert($("#userid1").val());
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/idCheck.do",
						data : "userid=" + $("#userid1").val(),
						dataType : "json",
						success : function(res) {
								//alert(res);
							var rs = parseInt(res);
							if (rs == 1) {
								$("#idHelp").html("사용가능한 아이디 입니다.");
								$("#idHelp").show();
								$("#divid").removeClass("has-error");
								$("#divid").addClass("has-success");									
							} else {
								//alert(res+"****");
								$("#idHelp").html("아이디가 중복됩니다.");
								$("#idHelp").show();
								$("#divid").addClass("has-error");
								$("#divid").removeClass("has-success");
								
							}
						},
						error : function(e) {
							alert("error : " + e);
						}
					});
					
				} 
			});
	
	var checkpwd = /^(?=(.*[\d]){1,})(?=(.*[a-z]){1,})(?=(.*[!@#$%^&*()]){1,})(?:[\da-zA-Z!@#$%^&*()]){8,16}$/;
	$("#pwd1").keyup(function() {
		if (!$("#pwd1").val()
				|| !checkpwd.test($("#pwd1").val())) {
			$("#pwdHelp1").html("비밀번호는 영어, 숫자, 특수문자 조합 8~16자리 입니다.");
			$("#pwdHelp1").show();
			$("#divpwd").addClass("has-error");
			return;
		} else {
			$("#pwdHelp1").html("사용가능한 비밀번호 입니다.(비밀번호를 한번더 입력하세요.)");				
			$("#divpwd").removeClass("has-error");
			$("#divpwd").addClass("has-success");
		}
	});
	
	$("#pwd2").keyup(function(){			
		if ($("#pwd1").val() != $("#pwd2").val()) {
			$("#pwdHelp1").hide();
			$("#pwdHelp2").show();
			$("#pwdHelp2").html("비밀번호가 일치 하지 않습니다. 다시 확인해 주세요.");
			$("#divpwd2").addClass("has-error");
			return;
		}else{
			if(!checkpwd.test($("#pwd1").val())){					
				$("#pwdHelp2").html("비밀번호는 영어, 숫자, 특수문자 조합 8~16자리 입니다.");					
			}else{
				$("#pwdHelp2").html("사용가능한 비밀번호 입니다.");
				$("#divpwd2").removeClass("has-error");
				$("#divpwd2").addClass("has-success");
			}
		}
	});
	
	$("#email").keyup(function(){
		var checkemail = /^([\d\w]+[\.\w\d\-_]*)\+?([\.\w\d]*)\@([A-Z|a-z|0-9])+((\.){0,1}[A-Z|a-z|0-9]){2}\.[a-z]{2,3}$/;
		if (!$("#email").val()
				|| checkemail.test($("#email").val()) == false) {				
			$("#emailHelp").html("이메일을 정확히 입력하세요.");
			$("#emailHelp").show();
			$("#divemail").addClass("has-error");
			return;
		} else {
			$("#emailHelp").html("이메일 확인이 완료 되었습니다.");
			$("#divemail").removeClass("has-error");
			$("#divemail").addClass("has-success");
		}
	});
	
	$("#sample6_address2").blur(function(){
		if(!$("#sample6_postcode").val() || !$("#sample6_address").val()){
			$("#divpost").addClass("has-error");
			$("#laddr").addClass("has-error");
			$("#postHelp").show();
			$("#addr1Help").show();
		}else{
			$("#divpost").removeClass("has-error");
			$("#divpost").addClass("has-success");
			$("#laddr").removeClass("has-error");
			$("#laddr").addClass("has-success");
			$("#postHelp").hide();
			$("#addr1Help").hide();
		}
		
		if(!$("#name").val() || !$("#userid1").val() || !$("#pwd1").val() || !$("#pwd2").val()
				|| !$("#email").val() || !$("#hp1").val() || !$("#hp2").val()
				|| !$("#hp3").val() || !$("#sample6_postcode").val() || !$("#sample6_address").val()
				|| !$("#sample6_address2").val()){			
			alert("모든 양식을 채워주세요.");
			$("#name").focus();
			return;
		} 
	});
	

});

</script>

	
<form role="form" name="mf" id="mf" action="${pageContext.request.contextPath}/member.do" method="POST">
<input type="hidden" name="status" id="status" value="${sta}">
	<div class="container">
	<div id="divname" class="form-group">
		<label class="control-label" for="name">이 름</label>
		<input class="form-control" type="text" autofocus="autofocus" name="name"
			id="name" placeholder="이름을 입력하세요."> 
		<span style="display: none;" id="nameHelp" class="help-block">이름을 입력하세요.</span>
	</div>

	<div id="divid" class="form-group">
		<label class="control-label" for="userid1">아이디</label> 
		<input class="form-control" type="text" name="userid1" id="userid1"
			placeholder="아이디를 입력하세요.(영어,숫자 조합 8~20자리)"> 
		<span style="display: none;" id="idHelp" class="help-block">아이디를 입력하세요.</span>
	</div>

	<div id="divpwd" class="form-group" style="margin-bottom:5px;">
		<label class="control-label" for="pwd1">비밀번호</label>
		<input class="form-control" type="password" name="pwd1" id="pwd1"
			placeholder="비밀번호를 입력하세요.(영어, 숫자, 특수문자 조합 8~16자리)">		
		<span style="display: none;" id="pwdHelp1" class="help-block">비밀번호를 입력하세요.</span>
	</div>
	<div id="divpwd2" class="form-group">
		<input class="form-control" type="password" id="pwd2"
			style="margin: 5px 0px 0px 0px" placeholder="비밀번호를 한번 더 입력하세요">
		<span style="display: none;" id="pwdHelp2" class="help-block">비밀번호가 일치하지 않습니다.</span>
	</div>
	<div id="divemail" class="form-group">
		<label class="control-label" for="email">이메일</label>
			<input class="form-control" type="email" name="email" id="email"
				placeholder="e-mail을 입력하세요.">
			<span style="display: none;" id="emailHelp" class="help-block">이메일을 입력하세요.</span>
	</div>
	<div class="form-group hidden-xs" id="divmhp">
		<label class="control-label" for="hp1">핸드폰
			<input type="text" class="form-control" name="hp1" id="hp1"
				style="margin: 5px 0px 0px 0px" placeholder="연락처 앞 3자리" maxlength="3">
		</label> - 
		<label for="hp2" class="control-label">
			<input type="text" class="form-control" name="hp2" id="hp2"
				placeholder="연락처 가운데 3~4자리" maxlength="4">
		</label> -
		<label for="hp3" class="control-label">
		<input type="text" class="form-control" name="hp3" id="hp3"
			placeholder="연락처 마지막 4자리" maxlength="4">
		</label>
		<span style="display: none;" id="mhpHelp" class="help-block">연락처를 입력하세요.</span>
		<span style="display: none;" id="mhpHelp2" class="help-block">연락처는 숫자여야 합니다.</span>
	</div>
	<!-- 모바일용 회원가입 핸드폰 -->
	<div class="form-group hidden-lg hidden-md hidden-sm" id="divmohp">
		<label class="control-label" for="mhp3">핸드폰</label>
			<input type="text" class="form-control" name="mhp3" id="mhp3"
				placeholder="핸드폰 번호 입력 시 - 없이 입력하세요." maxlength="11">
		<span style="display: none;" id="mohpHelp" class="help-block">연락처를 입력하세요.</span>
		<span style="display: none;" id="mohpHelp2" class="help-block">연락처는 숫자여야 합니다.</span>
	</div>
	<!--  -->
	
	<div class="form-group" id="divpost">
		<label class="control-label" for="sample6_postcode">우편번호</label>
			<input class="form-control" type="text" name="post" id="sample6_postcode"
				placeholder="우편번호검색 버튼을 클릭하세요" readonly>
		<span style="display: none;" id="postHelp" class="help-block">우편번호를 입력하세요.</span>
	</div>
	<div class="text-right">
		<button id="btpost" type="button" class="btn btn-primary"
			onclick="sample6_execDaumPostcode()">우편번호검색</button>
	</div>

	<div class="form-group" id="laddr">
		<label class="control-label" for="sample6_postcode">주 소</label>
		<input class="form-control" type="text" name="addr1" id="sample6_address"
			placeholder="기본주소" readonly>
		<span style="display: none;" id="addr1Help" class="help-block">기본주소를 입력하세요.</span>
	</div>
	<div class="form-group" id="laddr2">
		<input class="form-control" type="text" name="addr2" id="sample6_address2"
			style="margin: 5px 0px 0px 0px" placeholder="상세주소">
		<span style="display: none;" id="addr2Help" class="help-block">상세주소를 입력하세요.</span>
	</div>
	<div class="text-right">
		<button id="btpost" type="button" class="btn btn-primary"
			onclick="comp()">회원가입</button>
	</div>
	</div>
</form>
<c:import url="/Foot.do"/>










