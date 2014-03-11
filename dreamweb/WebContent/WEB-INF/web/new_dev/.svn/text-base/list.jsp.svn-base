<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="nextep.develop.NewDevelop, nextep.common.Common" %>
<%@page import="java.util.Date"%>

<%
	

	String pageTitle = "how to beging Spring - rubist.net";
	String ctx = request.getContextPath();

	List<NewDevelop> list = (List<NewDevelop>)request.getAttribute("boardList");
	
	String page_navi= (String)request.getAttribute("page_navi");
	
	
	String search_str= request.getAttribute("search_str")!=null? (String)request.getAttribute("search_str"):"";
		
	int go_page = (request.getParameter("go_page")!=null)? Integer.parseInt(request.getParameter("go_page")) : 1;
	
	//List<Common> genlist = (List<Common>)request.getAttribute("genList");
	
		
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

  
<script type="text/javascript">  
<!--
/*
jQuery(function($){  
    var tab = $('.tab_face');  
    tab.removeClass('js_off');  
    function onSelectTab(){  
        var t = $(this);  
        var myclass = [];  
        t.parentsUntil('.tab_face:first').filter('li').each(function(){  
            myclass.push( $(this).attr('class') );  
        });  
        myclass = myclass.join(' ');  
        if (!tab.hasClass(myclass)) tab.attr('class','tab_face').addClass(myclass);  
    }  
    //tab.find('li>a').click(onSelectTab).focus(onSelectTab);  
});  

*/


function str_search(){
	var f=document.myform;
	
	if(f.search_str.value==""){
		alert("검색어를 입력하세요");
		f.search_str.focus();
		return;
	}
	
	f.submit();
}

function change_value(str){
	location.href="<%=ROOT_PATH%>/dev/list.do?sort="+str;
}
//-->
</script>


<table cellspacing="0" cellpadding="0" align="center" width="95%">
	<tr>
    	<td>    		
    		<table border="0" cellspacing="0" cellpadding="0" width="92%">
                <tr>
                    <td><h3>유저 정보</h3></td>
                </tr>
            </table>     
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <form name="myform" action="<%=ROOT_PATH %>/user/list.do" method="get" >
                    <tr>
                        <td width="80%"> 로그인 아이디:
                        <input type="text" name="search_str" value="<%=search_str %>" /> &nbsp;<input type=button value="검색" onclick="str_search()" />
                        &nbsp;&nbsp;&nbsp;&nbsp;                                                                  	                    
                        </td>                        
            			<td width="20%">  
            			<input type="button" value="엑셀 다운로드" onclick="location.href='<%=ROOT_PATH %>/user/list_execl.do'" />    	                       
                        </td>
                    </tr>
                </form>
            </table>
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
                    <td class="searchBG"><table border="0" cellspacing="1" cellpadding="1" width="100%" >
                    	
                        <tr>
                            <td class="rowTT">이메일</td>
                            <td class="rowTT">닉네임</td>
                            <td class="rowTT">생년월일</td>
                            <td class="rowTT">국가</td>
                            <td class="rowTT">등록일시</td>                                                        
                        </tr>
						<%
							Iterator lst = list.iterator();
									
							String user_no, login_id, user_pwd, user_nm, user_nick, yyyymmdd, hp, user_sex, nation_code, reg_date;
							String equip_code, code_nm, nation_nm;
							
								
							while ( lst.hasNext() ) {
								NewDevelop nd= (NewDevelop)lst.next();
								
								user_no=nd.getUser_no();
								login_id=nd.getLogin_id();
								user_nick=nd.getUser_nick();
								yyyymmdd=nd.getYyyyymmdd();
								hp=nd.getHp();
								user_sex=nd.getUser_sex();
								nation_code=nd.getNation_code();
								reg_date=nd.getReg_date();
								equip_code=nd.getEquip_code();
								code_nm=nd.getCode_nm();
								nation_nm=nd.getNation_nm();
								
																
																
								
						%>
                        <tr bgcolor="#ffffff">
                            <td class="rowAlignCt"><a href="<%=ROOT_PATH %>/user/view.do?user_no=<%=user_no%>&go_page=<%=go_page%>&search_str=<%=search_str%>"><%=login_id %></a></td>
                            <td class="rowAlignCt"><%=user_nick %></td>
                            <td class="rowAlignCt"><%=yyyymmdd %></td>
                            <td class="rowAlignCt"><%=nation_nm %></td>
                            <td class="rowAlignCt"><%=reg_date %></td>                                                        
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