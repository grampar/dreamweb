<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="nextep.cp.Cp, nextep.common.Common" %>
<%@page import="java.util.Date"%>
<%
		
	String search_str = (String)request.getAttribute("search_str") ;
	int go_page = (Integer)request.getAttribute("go_page");
	
	List boardList = (List)request.getAttribute("boardList");		
	String page_navi= (String)request.getAttribute("page_navi");
	
	
	String search="search_str="+search_str;		
%>
<!-- top-->
<jsp:include page="/WEB-INF/web/include/top.jsp" flush="true">
<jsp:param name="i_over" value="imoticon" />
</jsp:include>
<TR>
    <TD bgcolor="#f4f4f4" vAlign=top>
    
	<!-- left-->
	<jsp:include page="/WEB-INF/web/new_dev/left.jsp" flush="true">
	<jsp:param name="i_over" value="imoticon" />
	</jsp:include>

    </TD>
    <TD height="100%" vAlign=top width="100%">

<script language=javascript src="<%=ROOT_PATH%>/js/common.js"></script>
<script type="text/javascript" src="<%=ROOT_PATH%>/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">  
<!--


function str_search(){
	var f=document.myform;
	/*
	if(f.search_str.value==""){
		alert("검색어를 입력하세요");
		f.search_str.focus();
		return;
	}
	*/
	
	f.submit();
}


function change_value(str){
	location.href="<%=ROOT_PATH%>/gamenotice/list.do?game_seq="+str;
}
//-->
</script>


<table cellspacing="0" cellpadding="0" align="center" width="95%">
	<tr>
    	<td><br/>
    		    		
    		<table border="0" cellspacing="0" cellpadding="0" width="92%">
                <tr>
                    <td><h3>Cp정보</h3></td>
                </tr>
            </table> 
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <form name="myform" action="<%=ROOT_PATH %>/cp/list.do" method="get" >
                    <tr>
                        <td width="80%">
                        <!-- 	제목:
                        <input type="text" name="search_str" value="<%=search_str%>" /> &nbsp;<input type=button value="검색" onclick="str_search()" />
                        &nbsp;&nbsp;&nbsp;&nbsp;  -->                                                                 	                    
                        </td>                        
            			<td width="20%">  
            			<input type="button" value="입력" onclick="location.href='<%=ROOT_PATH %>/cp/write.do'" />    	                       
                        </td>
                    </tr>
                </form>
            </table>
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
                    <td class="searchBG">
                    <table border="0" cellspacing="1" cellpadding="1" width="100%" >
                    	
                        <tr>
                            <td class="rowTT" width="10%">cp아이디</td>
                            <td class="rowTT" width="30%">회사명</td>                                                                                    
                            <td class="rowTT" width="15%">담당자</td>
                            <td class="rowTT" width="15%">담당자 전화</td>
                            <td class="rowTT" width="15%">등록일시</td>
                            <td class="rowTT" width="15%">국가</td>                            
                        </tr>
						<%
							Iterator boardlst = boardList.iterator();
							String cp_no, cp_id, cp_pwd, company_nm, contact_nm, contact_tel, reg_date, nation_code, nation_nm;
								
							while ( boardlst.hasNext() ) {
								Cp cp= (Cp)boardlst.next();
								
								cp_no=cp.getCp_no();
								cp_id=cp.getCp_id();
								cp_pwd=cp.getCp_pwd();
								company_nm=cp.getCompany_nm();
								contact_nm=cp.getContact_nm();
								contact_tel=cp.getContact_tel();
								reg_date=cp.getReg_date();
								nation_code=cp.getNation_code();
								nation_nm=cp.getNation_nm();
						%>
                        <tr bgcolor="#ffffff">
                            <td class="rowAlignCt"><a href="<%=ROOT_PATH %>/cp/modify.do?cp_no=<%=cp_no%>"><%=cp_id%></a></td>
                            <td class="rowAlignCt"><%=company_nm%></td>   
                            <td class="rowAlignCt"><%=contact_nm %></td>
                            <td class="rowAlignCt"><%=contact_tel %></td>
                            <td class="rowAlignCt"><%=reg_date %></td>
                            <td class="rowAlignCt"><%=nation_nm %></td>                                                                                                             
                        </tr>
                        <%
							}
						%>
                    </table></td>
                </tr>
            </table>
            <br>
            <table border="0" cellspacing="0" cellpadding="1" align="center" width="92%">
                <tr>
                    <td align="center">
					<%=page_navi %>
					</td>
                </tr>
            </table>
            </td>
    </tr>
</table>


<!-- bottom-->      
</TD></TR>
<jsp:include page="/WEB-INF/web/include/tail.jsp" flush="true">
<jsp:param name="i_over" value="imoticon" />
</jsp:include>