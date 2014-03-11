<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@page import="java.io.File" %>
<%



String file_nm =(String) request.getAttribute("file_nm") ;
String gubun = (String)request.getAttribute("gubun") ;
String resultMessage = (String)request.getAttribute("resultMessage") ;


//file_nm=IMG_URL+ROOT_PATH+"/"+file_nm;
file_nm=ROOT_PATH+"/"+file_nm;

if(resultMessage.equals("")){
%>
	<script>
		var gubun="<%=gubun%>";
		var file_nm="<%=file_nm%>";
		if(gubun=="wedit"){
			parent.wedit.imageinsert(file_nm);
		}else{
			parent.wedit2.imageinsert(file_nm);
		}
	</script>
<%
}else{
%>
	<script>
		alert("<%=resultMessage%>");
	</script>

<%
}
%>