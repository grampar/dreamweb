<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%



String search_mode =(String) request.getAttribute("search_mode") ;
String search_str = (String)request.getAttribute("search_str") ;

int game_seq = (Integer)request.getAttribute("game_seq");
int n_seq = (Integer)(request.getAttribute("n_seq")==null?0:request.getAttribute("n_seq"));
int go_page = (Integer)request.getAttribute("go_page");


String search="search_mode="+search_mode+"&search_str="+search_str+"&game_seq="+game_seq+"&n_seq="+n_seq+"&go_page="+go_page;


int retVal = ((Integer)request.getAttribute("insertResult")).intValue();

if(retVal == 0){
%>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		//alert("게시물이 수정되었습니다.");
	    location.replace("<%=ROOT_PATH%>/gamenotice/write.do?<%=search%>");
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
