<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="nextep.noticeinfo.NoticeInfo, nextep.common.Common" %>
<%@page import="java.util.Date"%>

<%
	
	
	String search_mode =(String) request.getAttribute("search_mode") ;
	String search_str = (String)request.getAttribute("search_str") ;
	int game_seq = (Integer)request.getAttribute("game_seq");
	int go_page = (Integer)request.getAttribute("go_page");
	
	String equip_code = (String)request.getAttribute("equip_code") ;
	String kind_code = (String)request.getAttribute("kind_code") ;
	
	
		

	List<NoticeInfo> list = (List<NoticeInfo>)request.getAttribute("boardList");		
	List<NoticeInfo> gameList = (List<NoticeInfo>)request.getAttribute("gameList");
	
	List codeList = (List)request.getAttribute("codeList");
	
	String page_navi= (String)request.getAttribute("page_navi");
	
	
	
	
	String search="game_seq="+game_seq+"&go_page="+go_page+"&search_mode="+search_mode+"&search_str="+search_str+"&equip_code="+equip_code+"&kind_code="+kind_code;
		
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

function notice_del(n_seq){	
	//email validition check
	if(confirm("정말로 삭제하시겠습니까?")){
		$.ajax({
			url: "<%=ROOT_PATH%>/gamenotice/maindel.do", 
			type: "GET", 
			data: "n_seq="+n_seq,
			success:function(msg){
				//alert(msg);
				if(msg==0){
					location.reload();	
				}else{
					alert('실패');
				}
				
			}
		});				
	}
	
}

function change_value(str){
	location.href="<%=ROOT_PATH%>/gamenotice/list.do?game_seq="+str;
}
//-->
</script>


<table cellspacing="0" cellpadding="0" align="center" width="95%">
	<tr>
    	<td><br/>
    		<table border="0" cellspacing="0" cellpadding="0" width="100%">                
                    <tr>
                        <td width="80%"> 
                             	게임	:
                        <select name="game_seq" onchange="change_value(this.value)">                        
                        <%
                        
							Iterator gamelst = gameList.iterator();
									
							String game_nm, game_nm_en;
							int tmpgame_seq=0;
								
							while ( gamelst.hasNext() ) {
								NoticeInfo cc= (NoticeInfo)gamelst.next();
								tmpgame_seq=cc.getGame_seq();
								game_nm=cc.getGame_nm();
								game_nm_en=cc.getGame_nm_en();
								
								
								out.println("<option value='"+tmpgame_seq+"' "+(tmpgame_seq==game_seq?"selected":"")+" >"+game_nm+"</option>");
							}
							
						%>
                        </select>
                        </td>
                    </tr>
                </form>
            </table>
            <br/>            
                		
    		<table border="0" cellspacing="0" cellpadding="0" width="92%">
                <tr>
                    <td><h3>공지사항</h3></td>
                </tr>
            </table> 
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <form name="myform" action="<%=ROOT_PATH %>/gamenotice/list.do" method="get" >
                    <tr>
                        <td width="80%">
                         	분류:
                         <select name="kind_code">
                         <option value=""></option>
		                <%							
							String code, tmpcode_nm;						
							Iterator codelst = codeList.iterator();
							while ( codelst.hasNext() ) {
								Common c=(Common)codelst.next();
								code=c.getCode();
								tmpcode_nm=c.getCode_nm();
								
								out.println("<option value='"+code+"' "+(code.equals(kind_code)?"selected":"")+">"+tmpcode_nm+"</option>");	
								
							}
						%>		                
		                </select> 
		                장비:
		                <select name="equip_code">
		                <option value=''></option>
		                <option value="C01" <%=(equip_code.equals("C01")?"selected":"")%>>아이폰</option>
		                <option value="C02" <%=(equip_code.equals("C02")?"selected":"")%>>안드로이드</option>
		                </select>
                        
                                               제목:
                        <input type="text" name="search_str" value="<%=search_str%>" /> &nbsp;<input type=button value="검색" onclick="str_search()" />
                        &nbsp;&nbsp;&nbsp;&nbsp;                                                                  	                    
                        </td>                        
            			<td width="20%">  
            			<input type="button" value="입력" onclick="location.href='<%=ROOT_PATH %>/gamenotice/write.do?game_seq=<%=game_seq%>'" />    	                       
                        </td>
                    </tr>
                </form>
            </table>
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
                    <td class="searchBG">
                    <table border="0" cellspacing="1" cellpadding="1" width="100%" >
                    	
                        <tr>
                            <td class="rowTT" width="40%">제목</td>
                            <td class="rowTT" width="20%">등록일시</td>                                                                                    
                            <td class="rowTT" width="15%">분류</td>
                            <td class="rowTT" width="15%">장비</td>
                            <td class="rowTT">삭제</td>
                        </tr>
						<%
							Iterator lst = list.iterator();
							String main_title, reg_date, code_nm, equip_code_nm ;
							int n_seq;
														
								
							while ( lst.hasNext() ) {
								NoticeInfo nd= (NoticeInfo)lst.next();
								
								n_seq=nd.getN_seq();
								main_title=nd.getMain_title();
								reg_date=nd.getReg_date();
								code_nm=nd.getCode_nm();
								equip_code_nm=nd.getEquip_code_nm();
								
						%>
                        <tr bgcolor="#ffffff">
                            <td class="rowAlignCt"><a href="<%=ROOT_PATH%>/gamenotice/write.do?n_seq=<%=n_seq%>&<%=search%>"><%=main_title %></a></td>
                            <td class="rowAlignCt"><%=reg_date %></td>   
                             <td class="rowAlignCt"><%=code_nm %></td>
                             <td class="rowAlignCt"><%=equip_code_nm %></td>
                            <td class="rowAlignCt"><a href="javascript:notice_del(<%=n_seq%>)">삭제</a></td>
                                                                                                             
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