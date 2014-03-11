<%@ page pageEncoding="utf-8"%>
<%
	

	if(ADMIN_ID.equals("")){
%>
		<script> 
		alert("로그인해주세요"); 
		location.href="<%=ROOT_PATH%>/index.do";
		</script>
<%
		return;
	}
%>