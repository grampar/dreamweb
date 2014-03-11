<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%
String left_menu1="menu";
String left_menu2="menu";
String left_menu3="menu";
String left_menu4="menu";
String left_menu5="menu";

String cur_url=request.getRequestURI();

if(cur_url.indexOf("userxl/")!=-1) {
	left_menu1="menuTitle";
}else if(cur_url.indexOf("new_dev/")!=-1) {
	left_menu2="menuTitle";
}else if(cur_url.indexOf("notice/")!=-1) {
	left_menu3="menuTitle";
}else if(cur_url.indexOf("game/")!=-1) {
	left_menu4="menuTitle";
}else if(cur_url.indexOf("cp/")!=-1) {
	left_menu5="menuTitle";
}
%>

<table border="0" cellspacing="1" cellpadding="3" align="center" width="200">
<tr><td>&nbsp;</td></tr>
<tr><td class="<%=left_menu1%>"><a href="<%=ROOT_PATH%>/userxl/list.do">수퍼크로스 유저</a></td></tr>
<tr><td class="<%=left_menu2%>"><a href="<%=ROOT_PATH%>/user/list.do">유저정보</a></td></tr>
<tr><td class="<%=left_menu3%>"><a href="<%=ROOT_PATH%>/gamenotice/list.do">공지사항</a></td></tr>
<tr><td class="<%=left_menu4%>"><a href="<%=ROOT_PATH%>/game/list.do">게임정보</a></td></tr>
<tr><td class="<%=left_menu5%>"><a href="<%=ROOT_PATH%>/cp/list.do">cp정보</a></td></tr>
<tr><td>&nbsp;</td></tr>
</table>

<br>