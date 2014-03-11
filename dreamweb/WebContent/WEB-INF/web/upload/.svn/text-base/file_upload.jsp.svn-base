<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>Spring 2.5 에서 파일 업로드</title>
 <script>
 function check_form(){
	 return true;
 }
 </script>
 </head>
 <body><center><br></br>
 다음 양식을 작성한 후에 [업로드]버튼을 눌러 주세요
 <hr width="40%">
 
 
 <form name="myform" action="<%=ROOT_PATH%>/upload/write_ok.do"  method="post"  enctype="multipart/form-data" onsubmit="return check_form()">
 <table>
 <tr><th>aaa</th>
  <td><input  type="text"  name="aaa"></td></tr>
  <tr><th>파일 1</th>
  <td><input  type="file"  name="file1"></td></tr>
  <!-- 
  <tr><th>파일 2</th>
  <td><input  type="file"  name="file2"></td></tr>
  <tr><th>파일 2</th>
  <td><input  type="file"  name="file3"></td></tr>
   -->
  <tr><td colspan="2"  align="left"><input type="submit"  value="업로드"></td></tr>
 </table>
 </form>
 </center>
 </body>
 </html>