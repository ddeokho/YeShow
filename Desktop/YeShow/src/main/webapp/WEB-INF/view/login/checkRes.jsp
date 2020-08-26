<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/view/Top.jsp"/>

  <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 ">
          <h2>���� ������ ���� Ȯ��</h2><br>
          <h4>������Ҵ� 2�� ������ �����մϴ�. ������ ���� ��� ��ȭ�� �� ���ּ���.</h4>
            <table class="table">
              <thead>
                <tr>
                  <th width="3%">#</th>
                  <th width="13%">���� �̸�</th>
                  <th width="13%">���� ��ȣ</th>
                  <th width="43%">���� ��ġ</th>
                  <th width="13%">���� ��¥</th>
                  <th width="10%">���� �ð�</th>
                  <th width="3"></th>
                  <th width="3"></th>
                </tr>
              </thead>
              <tbody>
             <!-- ������ �����ִ� for -->
             <c:forEach var="r" items="${res }" varStatus="i">
                <tr>
                  <td>${i.count }</td>
                  <td>${r.uprestaurant }</td>
                  <td>${r.upphon }</td>
                  <td>${r.uplocation }</td>
                  <td>${r.resdate }</td>
                  <td>${r.re_restime }</td>
                  <td><a class="btn btn- btn-info" href="resdetail.do?upnum=${r.upnum }">���庸��</a></td>
                  <td><a class="btn btn- btn-danger" href="javascript:goresdel('${r.num }')">����ϱ�</a></td>
                </tr>
             </c:forEach>   
              </tbody>
            </table>

          </div>
        </div>
      </div>
    </div>

<!-- ������ -->
<form id="godelres" name="godelres" method="POST">
	<input type="hidden" id="resvnum" name="resvnum">
	<input type="hidden" id="residx" name="residx" value="${loginUser.idx }">
</form>

<script type="text/javascript">
	
	var goresdel=function(vnum){
		
		var yn=window.confirm("���� ����Ͻʴϱ�?");
		if(yn){
		godelres.resvnum.value=vnum;
		godelres.action="delResve.do";
		godelres.submit();
		
		}
	}
	
</script>

<jsp:include page="/WEB-INF/view/Foot.jsp"/>