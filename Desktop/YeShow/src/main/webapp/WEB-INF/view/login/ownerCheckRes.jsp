<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/view/Top.jsp"/>

  <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 ">
          
          <!-- �г�Ƽ�ֱ� -->
          <form id="gopres" name="gopres" method="POST">
	          <h2>�츮���� ���� ���� Ȯ��</h2><br>
	          <h4>ȸ���� �� ���� ��, ���� �ð��� ���� �� 1�� ���� ����ϼž� ó���˴ϴ�.</h4>
	            <table class="table">
	              <thead>
	                <tr>
	                  <th width="3%">#</th>
	                  <th width="10%">���� ��ȣ</th>
	                  <th width="15%">���� �̸�</th>
	                  <th width="13%">ȸ�� �̸�</th>
	                  <th width="15%">����ó</th>
	                  <th width="13%">���� ��¥</th>
	                  <th width="10%">���� �ð�</th>
	                  <th width="10%">��� Ƚ��</th>
	                  <th width="3"></th>
	                  <th width="3"></th>
	                </tr>
	              </thead>
	              <tbody>
	             <!-- ������ �����ִ� for -->
	             <c:forEach var="o" items="${owner }" varStatus="i">
	                <tr>
	                  <td>${i.count }</td>
	                  <td>${o.num }</td>
	                  <td>${o.re_resname }</td>
	                  <td>${o.re_resuser }</td>
	                  <td>${o.hp1 }-${o.hp2 }-${o.hp3 }</td>
	                  <td>${o.resdate }</td>
	                  <td>${o.re_restime }</td>
	                  
	              <!-- �г�Ƽ -->    
	                  <c:if test="${o.penalty==null}">
	                  <td>0</td>
					  </c:if>
					  <c:if test="${o.penalty!=null}">
	                  <td>${o.penalty }</td>
					  </c:if>		
	              <!--  -->   
	              
	              <!-- �г�Ƽ 1	���� �ֱ� -->
	              <!-- ���üũ�� ���� ���� ��� -->
	              <c:if test="${nullflag==1}">
	                  		<td><a class="btn btn- btn-info" onclick="gopenalty('${o.memb }','${o.owner }','${o.num }')">���üũ</a></td>
	              </c:if>
	              
	               <!-- ��� üũ�� �� ��� -->
	              <c:if test="${nullflag==0}">
	              
	              	<td><a id="b${i.index}" class="btn btn- btn-info" href="javascript:gopenalty('${o.memb }','${o.owner }','${o.num }')">���üũ</a></td>
	              
	               <!-- flag ���̺��� ã�� --> 
	              <c:forEach var="f" items="${flag }"> 
	                  <c:if test="${f.num==o.num}">
								<script>
									$('#b${i.index}').addClass('btn btn- btn-info disabled').attr('onclick','').unbind('click');
												
								</script>
	             	  </c:if>	
	              </c:forEach>
	              </c:if>
	                  
	                  <td><a class="btn btn- btn-danger" href="javascript:goOwnerdel('${o.num }')">����ϱ�</a></td>
	                </tr>
	             </c:forEach>   
	              </tbody>
	            </table>
	            
	            <!-- ����ȸ�� �ѹ� -->
				<input type="hidden" id="presvnum" name="presvnum">
				<!-- ���� �ѹ� -->
				<input type="hidden" id="oesvnum" name="oresvnum">
				<!-- num -->
				<input type="hidden" id="num" name="num">
				<!-- idx -->
				<input type="hidden" id="idx" name="idx" value="${loginUser.idx }">
	            
			</form>
          </div>
        </div>
      </div>
    </div>

<!-- ������ -->
<form id="godelores" name="godelores" method="POST">
	<!-- ���� ��ȣ -->
	<input type="hidden" id="oresvnum" name="oresvnum">
	<!-- ���� ��ȣ -->
	<input type="hidden" id="oresidx" name="oresidx" value="${loginUser.idx }">
</form>


<script type="text/javascript">
	
	var goOwnerdel=function(vnum){
		
		var yn=window.confirm("���� ����Ͻʴϱ�?");
		if(yn){
			godelores.oresvnum.value=vnum;
			godelores.action="deloResve.do";
			godelores.submit();
		
		}
	}
	
	var gopenalty=function(pnum,onum,vnum){
		

		var yn=window.confirm("����ΰ���?");
		
		if(yn){
			gopres.oresvnum.value=onum;
			gopres.presvnum.value=pnum;
			gopres.num.value=vnum;
			gopres.action="uppResve.do";
			gopres.submit();
		
		}
	}
	
	
	
</script>

<jsp:include page="/WEB-INF/view/Foot.jsp"/>