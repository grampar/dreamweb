<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>로그인 폼</title>
<script type="text/javascript">
<c:if test="${!empty loginFail}">
 alert("${loginFail}");
</c:if>
</script>
</head>
<body><center><br></br>
 
${loginFail}<br>
<form action="login.do" method="post">

 <p>
ID: <input type="text" name="admin_id" value="${login.admin_id}" onclick="this.value='';">${IDrequired}<br><br>
PWD: <input type="password" name="admin_pwd" value="${login.admin_pwd}" onclick="this.value='';">${PWDrequired}<br>
<input type="submit" value="로그인">
</form>
 
</center>
</body>
</html>



