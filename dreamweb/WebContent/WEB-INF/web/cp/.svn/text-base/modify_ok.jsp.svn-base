<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%

String search_str = (String)request.getAttribute("search_str") ;
int go_page = (Integer)request.getAttribute("go_page");
String cp_no = (String)request.getAttribute("cp_no") ;


int retVal = ((Integer)request.getAttribute("insertResult")).intValue();

String search="cp_no="+cp_no+"&search_str="+search_str+"&go_page="+go_page;

if(retVal == 0){
%>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		//alert("게시물이 수정되었습니다.");
	    location.replace("<%=ROOT_PATH%>/cp/modify.do?<%=search%>");
	//-->
	</SCRIPT>

<%
}else{
%>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		alert("오류:"+<%=retVal%>);
		history.back();
	//-->
	</SCRIPT>
<%
	}
%>
