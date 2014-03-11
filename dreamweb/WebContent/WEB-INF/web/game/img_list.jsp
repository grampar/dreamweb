<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="nextep.game.Game, nextep.common.Common" %>
<%
	
	int game_seq = (Integer)request.getAttribute("game_seq");
			
	List boardList = (List)request.getAttribute("boardList");
	List typeList = (List)request.getAttribute("typeList");
	
	
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=ROOT_PATH%>/css/common.css" rel=stylesheet type=text/css />
<script language=javascript src="<%=ROOT_PATH%>/js/common.js"></script>
<script type="text/javascript" src="<%=ROOT_PATH%>/js/jquery-1.8.2.min.js"></script>
<script language="Javascript">
<!--


function check_form() {
	
	var f=document.myform;
	if(f.img_file.value==""){
		alert("이미지를 선택해주세요");
		return;
	}	
	
	f.target="img_upload_process";
	f.submit();
}

window.onload=function(){
		
	WinResize("800", "500");	
	
}

var game_seq="<%=game_seq%>";
function img_del(img_seq){
	//email validition check
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			url: "<%=ROOT_PATH%>/game/img_del_ok.do", 
			type: "GET", 
			data: "game_seq="+game_seq+"&img_seq="+img_seq,
			success:function(msg){
				//alert(msg);
				if(msg==0){
					alert("삭제되었습니다.")
					location.reload();	
				}else{
					alert('실패');
				}				
			}
		});				
	}	
}

//-->
</script>

<table cellspacing="0" cellpadding="0" align="center" width="95%">
<iframe src="" id="img_upload_process" name="img_upload_process" width=0 height=0></iframe>
	<tr>
    	<td>    		
    		<table border="0" cellspacing="0" cellpadding="0" width="92%">
                <tr>
                    <td><h3>게임정보</h3></td>
                </tr>
            </table> 
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <form name="myform" action="<%=ROOT_PATH %>/game/img_write_ok.do" method="post" enctype="multipart/form-data">
                <input type=hidden name="game_seq" value="<%=game_seq %>" />
                    <tr>
                        <td width="80%">이미지 종류:
                         <select name="type_code">                         
		                <%							
							String code_nm, code;
		                
							Iterator typelst = typeList.iterator();
							while ( typelst.hasNext() ) {
								Common c=(Common)typelst.next();
								code=c.getCode();
								code_nm=c.getCode_nm();
								out.println("<option value='"+code+"' >"+code_nm+"</option>");	
								
							}
						%>		                
		                </select>		                	
                        <input type="file" name="img_file" /> &nbsp;<input type="button" value="입력" onclick="check_form()" />                                                                  	                    
                        </td>
                    </tr>
                </form>
            </table>
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
                    <td class="searchBG">
                    <table border="0" cellspacing="1" cellpadding="1" width="100%" >
                        <tr>
                            <td class="rowTT" width="10%">게임타입</td>
                            <td class="rowTT" width="60%">이미지</td>                                                                     
                            <td class="rowTT" width="20%">등록일시</td>                            
                            <td class="rowTT" width="10%">삭제</td>
                        </tr>
                      
						<%
							Iterator lst = boardList.iterator();
							String type_code, file_nm, reg_date, type_nm;
							int img_seq;
								
							while ( lst.hasNext() ) {
								Game g= (Game)lst.next();
								
								img_seq=g.getImg_seq();
								type_code=g.getType_code();
								file_nm=g.getFile_nm();
								reg_date=g.getReg_date();
								type_nm=g.getType_nm();							
								
						%>   
                            
                        <tr bgcolor="#ffffff">
                            <td class="rowAlignCt"><%=type_nm %></td>
                            <td class="rowAlignCt"><img src="<%=IMG_GAME_PATH+"/"+game_seq+"/"+file_nm %>" border=0></td>   
                             <td class="rowAlignCt"><%=reg_date %></td>
                             <td class="rowAlignCt"><a href="javascript:img_del(<%=img_seq%>)">삭제</a></td>                                                                                                              
                        </tr>
                        <%
							}
						%>
                    </table></td>
                </tr>
            </table>
            </td>
    </tr>
</table>

</body>
</html>