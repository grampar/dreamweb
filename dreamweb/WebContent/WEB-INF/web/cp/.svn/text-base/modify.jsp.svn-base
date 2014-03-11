<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="nextep.cp.Cp, nextep.common.Common" %>
<%
	
			
	List nationList = (List)request.getAttribute("nationList");
	List cpView = (List)request.getAttribute("cpView");
	
	String search_str = (String)request.getAttribute("search_str") ;
	int go_page = (Integer)request.getAttribute("go_page");
	String cp_no = (String)request.getAttribute("cp_no") ;
	
	
	String cp_id="", cp_pwd="", company_nm="", contact_nm="", contact_tel="", reg_date="", nation_code="", addr="";
	Iterator cpviewlti=cpView.iterator();
	
	if(cpviewlti.hasNext()){
		Cp cp=(Cp)cpviewlti.next();
		
		
		cp_id=cp.getCp_id();
		cp_pwd=cp.getCp_pwd();
		company_nm=cp.getCompany_nm();
		contact_nm=cp.getContact_nm();
		contact_tel=cp.getContact_tel();
		reg_date=cp.getReg_date();
		nation_code=cp.getNation_code();
		addr=cp.getAddr();
	}
	
	String search="search_str="+search_str+"&go_page="+go_page;
	
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
            <form name="myform" action="<%=ROOT_PATH%>/cp/modify_ok.do" method="post" onsubmit="return check_form(this)">            
            <input type="hidden" name="go_page" value="<%=go_page %>" />                       	
            <input type="hidden" name="cp_no" value="<%=cp_no %>" />
           
            <tr bgcolor="#efefef">
                <td bgcolor="white" colspan="2">
                <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">                	
		            <tr bgcolor="white">
		                <td height="32" align=center>CP ID(로그인)(*)</td>
		                <td height="32">
		                <input type=text name="cp_id" size="20" value="<%=cp_id%>" />
		                </td>
		                <td height="32" align=center>CP pwd(*)</td>
		                <td height="32">
		                <input type=text name="cp_pwd" size="20" value="<%=cp_pwd%>" />
		                </td>
		            </tr>		                         	
                	<tr bgcolor="white">
		                <td height="32" align=center>회사명(*)</td>
		                <td height="32">
		                <input type=text name="company_nm" size="20" value="<%=company_nm%>" />
		                </td>
		                <td height="32" align=center>담당자</td>
		                <td height="32">
		                <input type=text name="contact_nm" size="20" value="<%=contact_nm%>" />
		                </td>
		            </tr>         
		            <tr bgcolor="white">
		                <td height="32" align=center>담당자 전화</td>
		                <td height="32"><input type=text name="contact_tel" value="<%=contact_tel%>" size="20"/></td>
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
								
								out.println("<option value='"+tmpnation_code+"' "+(nation_code.equals(tmpnation_code)?"selected":"")+">"+nation_nm+"</option>");
							}
						%>		                
		                </select>
		                </td>
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>주소</td>
		                <td height="32" colspan="3"><input type=text name="addr" value="<%=addr%>" size="60"/></td>
		            </tr>
		        </table>        
                </td>
            </tr>            
            <tr bgcolor="#efefef">
                <td bgcolor="white" colspan="2" align="center">
                <input type=submit value="수정" />   <input type=button value="목록" onclick="location.href='<%=ROOT_PATH%>/cp/list.do?<%=search%>'" />
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