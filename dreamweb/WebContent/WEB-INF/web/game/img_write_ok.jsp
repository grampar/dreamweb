<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%


int result =((Integer)request.getAttribute("result")).intValue();

String resultMessage =(String)request.getAttribute("resultMessage");



if(result == 0){
%>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		//alert("수정되었습니다.");
	    parent.location.reload();
	//-->
	</SCRIPT>

<%
}else{
%>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		alert("실패:<%=resultMessage%>");		
	//-->
	</SCRIPT>
<%
	}
%>
