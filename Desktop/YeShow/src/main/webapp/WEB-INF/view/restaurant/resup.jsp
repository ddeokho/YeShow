<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/view/Top.jsp"/>
  
  
 
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">업장 등록</h1><br><br>
            <form class="form-horizontal text-right" role="form" id="gores" name="gores"  method="POST" enctype="multipart/form-data">
              
              <!-- idx 회원 참조키 -->
              <input type="hidden" id="idx" name="idx" value="${loginUser.idx }">
              <!-- 작성자 -->
              <input type="hidden" id="upwriter" name="upwriter" value="${loginUser.name }">
              

              <!-- 카테고리 나라 -->
              <!-- <input type="text" id="connum" name="connum" value="1"> -->
              <!-- 카테고리 대표음식 -->
              <!-- <input type="text" id="fonum" name="fonum" value="1"> -->
              <!-- 상태 -->
              <input type="hidden" id="upstate" name="upstate" value="0">
              
              
              <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">가게명 *</label>
                </div>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="uprestaurant" name="uprestaurant">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">간단 소개*</label>
                </div>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="uptitle" name="uptitle">
                </div>
              </div>
              
              <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">업장 번호*</label>
                  <br>(" - " 제외 )</div>
                <div class="col-sm-4">
                  <input type="text" class="form-control" name="upphon" id="upphon">
                </div>
                <div class="col-sm-2">
                  <label class="control-label">수용 인원*</label>
                </div>
               <div class="col-sm-3">
                  <input type="text" class="form-control" id="upaccept" name="upaccept">
                </div>
                <div class="col-sm-1 text-left">
                  <label class="control-label">명</label>
                </div>
              </div>
              
                     <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputEmail3" class="control-label">영업시간*</label>
                </div>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="upbusiness" name="upbusiness" placeholder="ex)월요일~금요일 09:00~22:00 ">
                </div>
                <div class="col-sm-2">
                  <label for="inputPassword3" class="control-label">휴무일*</label>
                </div>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="uprest" name="uprest" placeholder="ex)매주 첫째쭈 일요일">
                </div>
              </div>
              
              
              <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">대표메뉴*</label>
                </div>
                <div class="col-sm-4">
                  <select class="form-control input-sm" id="fonum" name="fonum"> <!-- id="fonum" name="fonum" -->
                    <option>짜장면</option>
                    <option>스테이크</option>
                    <option>고기</option>
                    <option>죽</option>
                    <option>찌개</option>
                    <option>탕</option>
                    <option>탕수육</option>
                    <option>부페식</option>
                    <option>면</option>
                    <option>햄버거</option>
                    <option>기타</option>
                  </select>
                </div>
                    <div class="col-sm-2">
                  <label class="control-label">업종*</label>
                </div>
                <div class="col-sm-4">
                  <select class="form-control" id="connum" name="connum"><!-- id="connum" name="connum" -->
                    <option>한식</option>
                    <option>중식</option>
                    <option>일식</option>
                    <option>양식</option>
                    <option>기타</option>
                  </select>
                </div>
              </div>
              
              <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">상세 주소*</label>
                </div>
                <div class="col-sm-10">
                  <!--< input type="text" id="uplocation" name="uplocation" class="form-control"> -->
                  <input type="text" id="sample5_address" name="uplocation" class="form-control" placeholder="주소">
				  <br><input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
                  <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
                </div>
              </div>
              
              <!-- <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">이미지</label>
                </div>
                <div class="col-sm-10">
                  <input type="file" id="resimage" name="resimage">
                </div>
              </div> -->
              
              
               <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">상세 소개</label>
                </div>
                <div class="col-sm-10">
                  <textarea class="form-control" id="upmsg" name="upmsg" autofocus></textarea>
                </div>
              </div>
              
              
              <!-- 파일 업로드 -->
              
              <div class="form-group">
              	<div class="col-sm-2">
                	<label class="control-label">Files*</label>
               	</div>
               	<div class="col-sm-9">
               		<input type="file" id="upfile" name="upfile" class="form-control">
               		
               	</div>
               	<div class="col-md-1 text-left" >
            		<a onclick="upimage()"><i class="fa fa-3x fa-fw fa-cloud-upload"></i></a>
          		</div>
              </div>  
                <br>
               
               
               <!--  <input type="file" class="multi" name="filename" id="filename" />
                
                <a id="addmore" name="addmore" href="javascript:ful()" >upload</a> -->
                
             <%-- <%@ include file="myupload.jsp" %> --%>
             
	          <%--  <c:forEach var="f" items="${resimage }" varStatus="st">
	             <img src="MyData/upload/${f.filename}" width="100px">
	           </c:forEach>  --%>
                
               <!-- 반복문 ------------- -->
	             <c:forEach var="file" items="${resimage }" varStatus="st">
	               	<div class="col-sm-3">${st.count }
	               	</div>
	               	<div class="col-sm-7">
	                <input type="text" class="form-control" id="upiname" name="upiname" value="${file.upiname}" readonly>   
	               	</div>
	               </c:forEach> 
               <!-- ------------------- -->             
              
              
              <!-- ----- -->
              <br>
              <br>
             
              
              
              <div class="form-group">
                <div class="col-sm-10 col-sm-offset-2 text-left">
                  <button type="button" class="btn btn-default btn-lg" onclick="upres()">등록</button>
                </div>
              </div>
            </form>
          </div>
          
         <!--  <div class="col-md-6">
            <label>테이블 구성</label>
            <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
            class="img-responsive">
            <img class="img-responsive" src="http://maps.googleapis.com/maps/api/staticmap?center=Tombouctou,Mali&amp;zoom=12&amp;size=200x200&amp;sensor=false">
          </div> -->
          
        </div>
      </div>
    </div>
 
<script type="text/javascript">
	
	var upimage=function(){
		
		if(!gores.upfile.value)
		{
			alert("이미지 파일을 등록하세요.");
			gores.resdate.focus();
			return;
		}
		
		gores.action="fileup.do";
		gores.submit();
		
	}
	
	var upres=function(){
		
		if(!gores.uprestaurant.value)
		{
			alert("가게명을 등록하세요.");
			gores.uprestaurant.focus();
			return;
		}
		
		if(!gores.uptitle.value)
		{
			alert("간단소개를 등록하세요.");
			gores.uptitle.focus();
			return;
		}
		
		if(!gores.upphon.value)
		{
			alert("업장 번호를 등록하세요.");
			gores.upphon.focus();
			return;
		}
		
		if(!gores.upaccept.value)
		{
			alert("수용 인원를 등록하세요.");
			gores.upaccept.focus();
			return;
		}
		
		if(!gores.upbusiness.value)
		{
			alert("영업 시간을 등록하세요.");
			gores.upbusiness.focus();
			return;
		}
		
		if(!gores.uprest.value)
		{
			alert("휴무일을 등록하세요.");
			gores.uprest.focus();
			return;
		}
		
		if(!gores.fonum.value)
		{
			alert("대표메뉴를 등록하세요.");
			gores.fonum.focus();
			return;
		}
		
		if(!gores.connum.value)
		{
			alert("업종를 등록하세요.");
			gores.connum.focus();
			return;
		}
		
		if(!gores.sample5_address.value)
		{
			alert("가게 위치를 등록하세요.");
			gores.sample5_address.focus();
			return;
		}
		
		/* if(!goreres.upmsg.value)
		{
			alert("상세 소개를 등록하세요.");
			goreres.upmsg.focus();
			return;
		} */
		
		
		
		gores.action="resupload.do";
		gores.submit();
		
	}
//<![CDATA[	
	CKEDITOR.replace('upmsg',{
		enterMode:'2',
		shiftEnterMode:'3'
		
//]]>		
	});
	
</script>

<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = fullAddr;
                // 주소로 좌표를 검색
                geocoder.addr2coord(data.address, function(status, result) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
    
<jsp:include page="/WEB-INF/view/Foot.jsp"/>