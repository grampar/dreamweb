<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%



int result =((Integer)request.getAttribute("insertResult")).intValue();

if(result == 0){
%>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		//alert("게시물이 수정되었습니다.");
	    location.replace("<%=ROOT_PATH%>/game/list.do");
	//-->
	</SCRIPT>

<%
}else{
%>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		alert("오류:"+<%=result%>);
		history.back();
	//-->
	</SCRIPT>
<%
	}
%>
