<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="nextep.game.Game, nextep.common.Common" %>
<%
	
	int gl_seq = (Integer)request.getAttribute("gl_seq");
			
	List gameLanView = (List)request.getAttribute("gameLanView");
	
	
	String game_nm="", short_desc="", game_desc="", game_feather="", nation_code="", nation_nm="";
	
	Iterator gamelanitl=gameLanView.iterator();
	
	if(gamelanitl.hasNext()){
		Game game=(Game)gamelanitl.next();
		
		game_nm=game.getGame_nm();
		short_desc=game.getShort_desc();
		game_desc=game.getGame_desc();
		game_feather=game.getGame_feather();
		nation_code=game.getNation_code();
		nation_nm=game.getNation_nm();
		
	}
	
	//out.println(n_seq);
	//out.println(search_mode+"//"+search_str);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=ROOT_PATH%>/css/common.css" rel=stylesheet type=text/css />
<script language=javascript src="<%=ROOT_PATH%>/js/common.js"></script>
<script type="text/javascript" src="<%=ROOT_PATH%>/js/jquery-1.8.2.min.js"></script>
<script language="JavaScript"  src="<%=ROOT_PATH%>/js/web_edit.js"></script>
<script language="Javascript">
<!--


function check_form() {
	
	var f=document.myform;
	if(f.game_nm.value==""){
		alert("게임명을 입력해주세요.");
		f.game_nm.focus();		
		return;		
	}
	
	if(f.short_desc.value==""){
		alert("짧은 설명을 입력해주세요.");
		f.short_desc.focus();		
		return;		
	}
	
	f.game_desc.value=HtmlEditor.document.body.innerHTML;
	f.game_feather.value=HtmlEditor2.document.body.innerHTML;
		
	f.submit();
}


var wedit=new WebEdit("wedit", "<%=ROOT_PATH%>");
var wedit2=new WebEdit("wedit2", "<%=ROOT_PATH%>");

window.onload=function(){
	wedit.init(HtmlEditor, document.getElementById("DivBox"), document.myform.game_desc);
	wedit2.init(HtmlEditor2, document.getElementById("DivBox"), document.myform.game_feather);
	
	WinResize("1100", "700");
	
	HtmlEditor.document.body.innerHTML=document.myform.game_desc.value;
	HtmlEditor2.document.body.innerHTML=document.myform.game_feather.value;
}

//-->
</script>
</head>
<body>
 <table border="0" cellspacing="0" cellpadding="0" width="92%">
    <tr>
        <td><h3>게임 설명 수정</h3></td>
    </tr>
</table>
<table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">    
     <form name="myform" action="<%=ROOT_PATH%>/game/lan_modify_ok.do" method="post">
     <input type=hidden name="gl_seq" value="<%=gl_seq %>" />
     <input type=hidden name="nation_code" value="<%=nation_code %>" />          
     <tr bgcolor="#efefef">
         <td bgcolor="white" colspan="2">
         <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">
         	<tr bgcolor="white">
           <td height="32" align=center>게임명</td>
           <td height="32" colspan="3">
           <input type=text name="game_nm" value="<%=game_nm%>" />
           </td>          
       </tr>
       <tr bgcolor="white">
           <td height="32" align=center>짧은설명</td>
           <td height="32" colspan="3">
           <input type=text name="short_desc" size="100" value="<%=short_desc%>" />
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
           <iframe id="HtmlEditor" frameborder="0" style="width:100%; height: 140;" marginwidth="5" marginheight="5" topmargin="5" scrolling="Auto" border="0" 
           onblur="wedit.SaveSelection();" onfocus="wedit.hideBox();"></iframe>
           </td>		                
       </tr>
       <tr id="html1" bgcolor="white" style="display:none">
           <td height="32" align=center>게임설명</td>
           <td height="32" colspan="3">
           <textarea name="game_desc" style="width:100%; height:150; line-height:18px; word-break:break-all; border:0 solid #B5B5B5" ><%=game_desc %></textarea>
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
           <iframe id="HtmlEditor2" frameborder="0" style="width:100%; height: 140;" marginwidth="5" marginheight="5" topmargin="5" scrolling="Auto" border="0" 
           onblur="wedit2.SaveSelection();" onfocus="wedit2.hideBox();"></iframe>
           </td>		                
       </tr>
       <tr id="html2" bgcolor="white" style="display:none" >
           <td height="32" align=center>게임특징</td>
           <td height="32" colspan="3">
           <textarea name="game_feather" style="width:100%; height:150; line-height:18px; word-break:break-all; border:0 solid #B5B5B5" >
           <%=game_feather %></textarea>
           </td>		                
       </tr>  
      
   </table>        
         </td>
     </tr>            
     <tr bgcolor="#efefef">
         <td bgcolor="white" colspan="4" align="center"><input type=button value="수정" onclick="check_form()" /></td>
     </tr> 
   </form>
 </table>

</body>
</html>