<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="nextep.game.Game, nextep.common.Common" %>
<%
	

	List<Common> cpList = (List<Common>)request.getAttribute("cpList");
	List genreList = (List)request.getAttribute("genreList");
	List gradeList = (List)request.getAttribute("gradeList");
	
	
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
<script language="JavaScript"  src="<%=ROOT_PATH%>/js/web_edit.js"></script>
<script language="JavaScript"  src="<%=ROOT_PATH%>/js/date_info.js"></script>
<script language="Javascript">
<!--

function check_form(f) {

	if(f.game_nm.value==""){
		alert("게임명을 입력해주세요");
		f.game_nm.focus();
		return false;		
	}
	
	if(f.short_desc.value==""){
		alert("내용을 입력해주세요");
		f.short_desc.focus();
		return false;		
	}
	
	if(f.release_date.value==""){
		alert("출시일을 선택해주세요");
		f.release_date.focus();		
		return false;		
	}
	
	f.game_desc.value=HtmlEditor.document.body.innerHTML;
	f.game_feather.value=HtmlEditor2.document.body.innerHTML;
	
		
		
	return true;
}



var wedit=new WebEdit("wedit", "<%=ROOT_PATH%>");
var wedit2=new WebEdit("wedit2", "<%=ROOT_PATH%>");

window.onload=function(){
	wedit.init(HtmlEditor, document.getElementById("DivBox"), document.myform.game_desc);
	wedit2.init(HtmlEditor2, document.getElementById("DivBox"), document.myform.game_feather);
}





//-->
</script>
<div id='calendarDiv' style='position:absolute;visibility:hidden'></div>
<table cellspacing="0" border="0" cellpadding="0" align="center" width="95%">
	<tr>
    	<td>
    	
        <table border="0" cellspacing="0" cellpadding="0" width="92%">
            <tr>
                <td><h3>게임정보 등록</h3></td>
            </tr>
        </table>
                
        <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">    
            <form name="myform" action="<%=ROOT_PATH%>/game/write_ok.do" method="post" onsubmit="return check_form(this)">
            <tr bgcolor="#efefef">
                <td bgcolor="white" colspan="2">
                <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">                	
                	<tr bgcolor="white">
		                <td height="32" align=center>게임명(*)</td>
		                <td height="32">
		                <input type=text name="game_nm" />
		                </td>
		                <td height="32" align=center>cp(*)</td>
		                <td height="32">
		                <select name="cp_no">
		                <%
							String cp_no, companey_nm;						
							Iterator cplst = cpList.iterator();																				
								
							while ( cplst.hasNext() ) {
								Common c=(Common)cplst.next();
								cp_no=c.getCp_no();
								companey_nm=c.getCompany_nm();
								
								out.println("<option value='"+cp_no+"'>"+companey_nm+"</option>");																
								
							}
						%>
		                
		                </select>
		                </td>
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>짧은설명(*)</td>
		                <td height="32" colspan="3">
		                <input type=text name="short_desc" size="100" />
		                </td>
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>출시일(*)</td>
		                <td height="32">
		                <input type=text name="release_date" readonly onclick="view_date('myform')" />
		                </td>
		                <td height="32" align=center>유료여부</td>
		                <td height="32">
		               <input type=checkbox name="fee_yn" value="Y">
		                </td>
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>안드로이드 지원환경</td>
		                <td height="32">
		                <input type=text name="android_requirement" size="30" /> ex)2.3 & 2.4 & 3.0
		                </td>
		                <td height="32" align=center>IOS 지원환경</td>
		                <td height="32">
		               <input type=text name="ios_requirement" size="30"> ex)3 & 4 & 5
		                </td>
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>게임용량</td>
		                <td height="32">
		                <input type=text name="game_size" size="30" />
		                </td>
		                <td height="32" align=center>장르</td>
		                <td height="32">
		                <select name="genre_code">
		                <%
							String code, code_nm;						
							Iterator genrelst = genreList.iterator();																				
								
							while ( genrelst.hasNext() ) {
								Common c=(Common)genrelst.next();
								code=c.getCode();
								code_nm=c.getCode_nm();
								
								out.println("<option value='"+code+"'>"+code_nm+"</option>");
							}
						%>
		                </select>		               
		                </td>
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>게임등급</td>
		                <td height="32">
		                <select name="grade_code">
		                <%
													
							Iterator gradelst = gradeList.iterator();																				
								
							while ( gradelst.hasNext() ) {
								Common c=(Common)gradelst.next();
								code=c.getCode();
								code_nm=c.getCode_nm();
								
								out.println("<option value='"+code+"'>"+code_nm+"</option>");
							}
						%>
		                </select>	
		                </td>
		                <td height="32" align=center>동영상 url</td>
		                <td height="32">
		                <input type=text name="movie_url" size="50" />
		                </td>		                
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>추천</td>
		                <td height="32" colspan="3">
		                <input type=checkbox name="recom_yn" value="Y">
		                </td>		                
		            </tr>
		            <tr>
                       <td colspan="4">
                       <script>document.write(wedit.getMenu());</script>
                       </td>
                    </tr>
		            <tr id="Editor1" bgcolor="white" style="display:">
		                <td height="32" align=center>게임설명</td>
		                <td height="32" colspan="3">
		                <iframe id="HtmlEditor" frameborder="0" style="width:80%; height: 140;" marginwidth="5" marginheight="5" topmargin="5" scrolling="Auto" border="0" 
		                onblur="wedit.SaveSelection();" onfocus="wedit.hideBox();"></iframe>
		                </td>		                
		            </tr>
		            <tr id="html1" bgcolor="white" style="display:none">
		                <td height="32" align=center>게임설명</td>
		                <td height="32" colspan="3">
		                <textarea name="game_desc" style="width:80%; height:150; line-height:18px; overflow:auto; word-break:break-all; border:0 solid #B5B5B5" ></textarea>
		                </td>		                
		            </tr>
		            <tr>
                       <td colspan="4">
                       <script>document.write(wedit2.getMenu());</script>
                       </td>
                    </tr>
		            <tr id="Editor2" bgcolor="white" style="display:" >
		                <td height="32" align=center>게임특징</td>
		                <td height="32" colspan="3">
		                <iframe id="HtmlEditor2" frameborder="0" style="width:80%; height: 140;" marginwidth="5" marginheight="5" topmargin="5" scrolling="Auto" border="0" 
		                onblur="wedit2.SaveSelection();" onfocus="wedit2.hideBox();"></iframe>
		                </td>		                
		            </tr>
		            <tr id="html2" bgcolor="white" style="display:none" >
		                <td height="32" align=center>게임특징</td>
		                <td height="32" colspan="3">
		                <textarea name="game_feather" style="width:80%; height:150; line-height:18px; overflow:auto; word-break:break-all; border:0 solid #B5B5B5" ></textarea>
		                </td>
		            </tr>  
		           
		        </table>        
                </td>
            </tr>            
            <tr bgcolor="#efefef">
                <td bgcolor="white" colspan="4" align="center">
                <input type=submit value="전송" />   <input type=button value="목록" onclick="location.href='<%=ROOT_PATH%>/game/list.do'" />
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