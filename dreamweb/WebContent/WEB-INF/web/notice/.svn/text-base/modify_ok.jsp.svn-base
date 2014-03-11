<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%


int retVal = ((Integer)request.getAttribute("insertResult")).intValue();

if(retVal == 0){
%>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		//alert("게시물이 수정되었습니다.");
	    opener.location.reload();
	    window.close();
	//-->
	</SCRIPT>

<%
}else{
%>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		alert("오류:"+<%=retVal%>);
		window.close();
	//-->
	</SCRIPT>
<%
	}
%>
