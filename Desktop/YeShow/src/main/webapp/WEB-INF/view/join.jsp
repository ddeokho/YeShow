<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Top.do"/>
<script type="text/javascript">
	var member=function(val){
		if(val==1){
			statuS.sta.value="1";
			statuS.submit();
		}else if(val==2){
			statuS.sta.value="2";
			statuS.submit();
		}
	}
</script>


<body>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <img src="${pageContext.request.contextPath}/images/member.PNG"
           class="center-block img-responsive img-thumbnail" width="191px">
            <a class="btn btn-block btn-primary" href="#" onclick="member('1')">개인 회원가입</a>
          </div>
          <div class="col-md-6">
            <img src="${pageContext.request.contextPath}/images/shop.PNG"
            class="center-block img-responsive img-thumbnail" width="250px">
            <a class="btn btn-block btn-primary" href="#" onclick="member('2')">업주용 회원가입<br></a>
          </div>
        </div>
      </div>
    </div>
  </body>

<form name="statuS" action="${pageContext.request.contextPath}/member.do" method="GET">
	<input type="text" name="sta" id="sta">
	
</form>
  
<c:import url="/Foot.do"/>










