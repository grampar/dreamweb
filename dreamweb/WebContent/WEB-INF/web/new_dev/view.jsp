<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="nextep.develop.NewDevelop, nextep.common.Common" %>
<%
		
	List<NewDevelop> boardList = (List<NewDevelop>)request.getAttribute("boardList");
	
	Iterator<NewDevelop> iter=boardList.iterator();
		
	
	String user_no= (String)request.getParameter("user_no");
	String search_str= (String)request.getParameter("search_str");	
	String go_page= (String)request.getParameter("go_page");
	
	String login_id="", user_pwd="", user_nm="", user_nick="", yyyymmdd="", hp="", user_sex="", nation_code="", reg_date="";
	String equip_code="", code_nm="", nation_nm="";
	
		
	if(iter.hasNext()){
		NewDevelop nd=(NewDevelop)iter.next();
		
		
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
		
	}
		
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
<script language=javascript src="<%=ROOT_PATH%>/js/cal_day.js"></script>
<script language="Javascript">
<!--

function check_form(f) {

	if(f.game_nm.value==""){
		alert("게임명을 입력하세요");
		f.game_nm.focus();
		return false;
	}
	
	if(f.developer.value==""){
		alert("개발사를 입력하세요");
		f.developer.focus();
		return false;
	}

	if(f.genre_code.value==""){
		alert("장르를 선택해주세요.");
		f.genre_code.focus();
		return false;
	}
		
	return true;
}

function iframe_resize(val){
	var obj=document.getElementById("pro_cmnt");	
	obj.height=parseInt(obj.height)+val;
	
}

function status_change(fp_seq){
	var win=window.open("pop_status_change.do?fp_seq="+fp_seq, "pop_status", "width=10, height=10");
	win.focus();
}

function status_change_upt(fp_seq, fps_seq){
	var win=window.open("pop_status_upt.do?fp_seq="+fp_seq+"&fps_seq="+fps_seq, "pop_status_upt", "width=10, height=10");
	win.focus();
}

//-->
</script>

<div id="calendar1" style="position:absolute;visibility:hidden;z-index:100"></div>
<table cellspacing="0" cellpadding="0" align="center" width="95%">
	<tr>
    	<td>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td><h3>유저 정보</h3></td>
                </tr>
            </table>
		
            <br>
             <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">    
	            <form name="myform" action="<%=ROOT_PATH%>/dev/write_ok.do" method="post" onsubmit="return check_form(this)">
				<input type=hidden name="user_no" value="<%=user_no%>">				
	
	            <tr bgcolor="#efefef">
	                <td align=center width="20%">이메일</td>
	                <td bgcolor="white"><%=login_id%></td>                
	            </tr>
	            <tr bgcolor="#efefef" >
	                <td align=center width="20%">닉네임</td>
	                <td bgcolor="white"><%=user_nick%></a></td>
	            </tr>
	            <tr bgcolor="#efefef">
	                <td align=center width="20%">생년월일</td>
	                <td bgcolor="white"><%=yyyymmdd%></td>
	            </tr>
	            <tr bgcolor="#efefef">
	                <td align=center width="20%">전화</td>
	                <td bgcolor="white"><%=hp%></td>
	            </tr>
	            
	            <tr bgcolor="#efefef">
	                <td align=center width="20%">성별</td>
	                <td bgcolor="white"><%=user_sex%></td>
	            </tr>
	            <tr bgcolor="#efefef">
	                <td align=center width="20%">국가</td>
	                <td bgcolor="white">
	                <%=nation_nm%>
	                </td>
	            </tr>	           
	             <tr bgcolor="#efefef">	                
	                <td colspan="2" bgcolor="white" align="center">
	                <input type=button value="목록" onclick="location.href='list.do?search_str=<%=search_str%>&go_page=<%=go_page%>'" >	                
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