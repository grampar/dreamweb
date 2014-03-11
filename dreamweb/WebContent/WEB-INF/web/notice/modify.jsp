<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="nextep.noticeinfo.NoticeInfo, nextep.common.Common" %>
<%
	
			
	List boardList = (List)request.getAttribute("boardList");
	
	int nn_seq = (Integer)request.getAttribute("nn_seq");
	
	String title="", cmnt="";
	Iterator boarditl=boardList.iterator();
	
	if(boarditl.hasNext()){
		NoticeInfo n=(NoticeInfo)boarditl.next();
		title=n.getTitle();
		cmnt=n.getCmnt();
	}
	
	//out.println(n_seq);
	//out.println(search_mode+"//"+search_str);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=ROOT_PATH%>/css/common.css" rel=stylesheet type=text/css />
<script language=javascript src="<%=ROOT_PATH%>/js/common.js"></script>
<script type="text/javascript" src="<%=ROOT_PATH%>/js/jquery-1.8.2.min.js"></script>
<script language="Javascript">
<!--

window.onload=function(){
	WinResize("800", "400");
}

function check_form(f) {

	if(f.title.value==""){
		alert("제목을 입력해주세요");
		f.title.focus();
		return false;		
	}
	
	if(f.cmnt.value==""){
		alert("내용을 입력해주세요");
		f.cmnt.focus();
		return false;		
	}
	
		
	return true;
}

//-->
</script>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" width="92%">
<tr>
	<td><h3>수정</h3></td>
</tr>
</table>
<table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">
<form name="myform" action="<%=ROOT_PATH%>/gamenotice/modify_ok.do" method="post" onsubmit="return check_form(this)">    
    <input type="hidden" name="nn_seq" value="<%=nn_seq %>" />                
     <tr bgcolor="white">
         <td height="32" align=center width="10%">제목</td>
         <td height="32"><input type=text name="title" value="<%=title%>" size="120" /></td>
     </tr>
     <tr bgcolor="white">
         <td height="32" align=center width="10%">내용</td>
         <td height="32" ><textarea name="cmnt" rows="10" cols="120"><%=cmnt%></textarea></td>
     </tr>
     <tr bgcolor="#efefef">
       <td bgcolor="white" colspan="2" align="center">
       <input type=submit value="수정" />       
       </td>
   </tr> 
     </form>
 </table>   

</body>
</html>