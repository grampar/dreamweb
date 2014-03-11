<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%

if(!ADMIN_ID.equals("")){
	out.println("<script>location.href='"+ROOT_PATH+"/user/list.do'</script>");
}



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>main</title>
<script type="text/javascript">
<!--
	function check_form(f){
		if(f.admin_id.vale==""){
			alert("아이디 입력해주세요");
			f.admin_id.focus();
			return false;
		}
		
		if(f.admin_pwd.vale==""){
			alert("비밀번호를 입력해주세요");
			f.admin_pwd.focus();
			return false;
		}
		
		return true;
	}
	
	window.onload=function(){
		document.myform.admin_id.focus();
	}
//-->
</script>
</head>
<body>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="100%">
<tr>
	<td align="center">
		<table>
		<form name="myform" action="<%=ROOT_PATH%>/login/login_ok.do" method="post" onsubmit="return check_form(this)">
		<tr>
			<td>id:</td>
			<td><input type=text name="admin_id"></td>
		</tr>
		<tr>
			<td>pwd:</td>
			<td><input type=password name="admin_pwd"></td>
		</tr>
		<tr>	
			<td colspan="2" align="center"><input type=submit value="로그인"></td>
		</tr>
		</form>
		</table>
	</td>
</tr>
</table> 

</body>
</html>



