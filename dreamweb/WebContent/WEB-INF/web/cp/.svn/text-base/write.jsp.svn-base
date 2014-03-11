<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="nextep.cp.Cp, nextep.common.Common" %>
<%
	
			
	List nationList = (List)request.getAttribute("nationList");
		
		
	
%>
<!-- top-->
<jsp:include page="/WEB-INF/web/include/top.jsp" flush="true">
<jsp:param name="i_over" value="imoticon" />
</jsp:include>
<TR>
    <TD bgcolor="#f4f4f4" vAlign=top>
    
	<!-- left-->
	<!-- left-->
	<jsp:include page="/WEB-INF/web/new_dev/left.jsp" flush="true">
	<jsp:param name="i_over" value="imoticon" />
	</jsp:include>

    </TD>
    <TD height="100%" valign=top width="100%">
<script language=javascript src="<%=ROOT_PATH%>/js/common.js"></script>
<script type="text/javascript" src="<%=ROOT_PATH%>/js/jquery-1.8.2.min.js"></script>
<script language="Javascript">
<!--

function check_form(f) {

	if(f.cp_id.value==""){
		alert("cp id를 입력해주세요");
		f.cp_id.focus();
		return false;		
	}
	
	if(f.cp_pwd.value==""){
		alert("cp 비밀번호를 입력해주세요");
		f.cp_pwd.focus();
		return false;		
	}
	
	if(f.company_nm.value==""){
		alert("회사명을 입력해주세요");
		f.company_nm.focus();
		return false;		
	}
	
		
	return true;
}


//-->
</script>
<table cellspacing="0" border="0" cellpadding="0" align="center" width="95%">
	<tr>
    	<td>
    	
        <table border="0" cellspacing="0" cellpadding="0" width="92%">
            <tr>
                <td><h3>Cp 수정</h3></td>
            </tr>
        </table>
                
        <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">    
            <form name="myform" action="<%=ROOT_PATH%>/cp/write_ok.do" method="post" onsubmit="return check_form(this)">
           
            <tr bgcolor="#efefef">
                <td bgcolor="white" colspan="2">
                <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">                	
		            <tr bgcolor="white">
		                <td height="32" align=center>CP ID(로그인)(*)</td>
		                <td height="32">
		                <input type=text name="cp_id" size="20" />
		                </td>
		                <td height="32" align=center>CP pwd(*)</td>
		                <td height="32">
		                <input type=text name="cp_pwd" size="20" />
		                </td>
		            </tr>		                         	
                	<tr bgcolor="white">
		                <td height="32" align=center>회사명(*)</td>
		                <td height="32">
		                <input type=text name="company_nm" size="20" />
		                </td>
		                <td height="32" align=center>담당자</td>
		                <td height="32">
		                <input type=text name="contact_nm" size="20"  />
		                </td>
		            </tr>         
		            <tr bgcolor="white">
		                <td height="32" align=center>담당자 전화</td>
		                <td height="32"><input type=text name="contact_tel" size="20"/></td>
		                <td height="32" align=center>국가</td>
		                <td height="32">
		                <select name="nation_code">
		                <%							
							String tmpnation_code, nation_nm;						
							Iterator nationlst = nationList.iterator();																				
								
							while ( nationlst.hasNext() ) {
								Common c=(Common)nationlst.next();
								tmpnation_code=c.getNation_code();
								nation_nm=c.getNation_nm();
								
								out.println("<option value='"+tmpnation_code+"'>"+nation_nm+"</option>");
							}
						%>		                
		                </select>
		                </td>
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>주소</td>
		                <td height="32" colspan="3"><input type=text name="addr" size="60"/></td>
		            </tr>
		        </table>        
                </td>
            </tr>            
            <tr bgcolor="#efefef">
                <td bgcolor="white" colspan="2" align="center">
                <input type=submit value="입력" />  <input type=button value="목록" onclick="location.href='<%=ROOT_PATH%>/cp/list.do'" />
                </td>
            </tr> 
          </form>
        </table> 
        
		</td>		
    </tr>
    
</table>

<!-- bottom-->
</TD></TR>
<jsp:include page="/WEB-INF/web/include/tail.jsp" flush="true">
<jsp:param name="i_over" value="imoticon" />
</jsp:include>