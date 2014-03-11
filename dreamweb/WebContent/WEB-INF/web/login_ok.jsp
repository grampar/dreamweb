<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%


String tmpadmin_id =(String) request.getAttribute("admin_id") ;

Cookie cookie=new Cookie("admin_id", tmpadmin_id);
cookie.setDomain("dream.adm.dreamrepublic.net");
cookie.setPath("/");
response.addCookie(cookie);

/*
cookie=new Cookie("callnara_seq",user_seq);
cookie.setDomain("callnara.com");
cookie.setPath("/");
response.addCookie(cookie);
*/

%>
	<SCRIPT LANGUAGE="JavaScript">
	<!--		
	    location.replace("<%=ROOT_PATH%>/user/list.do");
	//-->
	</SCRIPT>


