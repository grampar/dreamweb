<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="nextep.game.Game, nextep.common.Common" %>
<%
	
	
	String search_str = (String)request.getAttribute("search_str") ;
	int go_page = (Integer)request.getAttribute("go_page");	
	String cp_no = (String)request.getAttribute("cp_no") ;
	int game_seq = (Integer)request.getAttribute("game_seq");

	List cpList = (List)request.getAttribute("cpList");
	List genreList = (List)request.getAttribute("genreList");
	List gradeList = (List)request.getAttribute("gradeList");
	
	List gamelanList = (List)request.getAttribute("gamelanList");
	List gameView = (List)request.getAttribute("gameView");
	List gamePriceList = (List)request.getAttribute("gamePriceList");
	
	List saleList = (List)request.getAttribute("saleList");
	List marketList = (List)request.getAttribute("marketList");
	
	
	String release_date="", tmpcp_no="", fee_yn="", game_size="", grade_code="", genre_code="", genre_nm="", grade_nm="";
	String android_requirement="", ios_requirement="", sale_code="", movie_url="", recom_yn="";
    
	Iterator gameviewlst = gameView.iterator();
	if ( gameviewlst.hasNext() ) {
		Game game=(Game)gameviewlst.next();
		
		release_date=game.getRelease_date();
		tmpcp_no=game.getCp_no();
		fee_yn=game.getFee_yn();
		game_size=game.getGame_size();
		grade_code=game.getGrade_code();
		genre_code=game.getGenre_code();
		genre_nm=game.getGenre_nm();
		grade_nm=game.getGrade_nm();
		android_requirement=game.getAndroid_requirement();
		ios_requirement=game.getIos_requirement();
		sale_code=game.getSale_code();
		movie_url=game.getMovie_url();
		recom_yn=game.getRecom_yn();
		
	}
	
	
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

function check_form() {
	
	var f=document.firstform;
	
	if(f.release_date.value==""){
		alert("출시일을 선택해주세요");
		f.release_date.focus();		
		return;		
	}
	
	f.target="modify_process";
	f.submit();
}

function insGameLan(){
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
	
	f.target="modify_process";
	f.submit();
}

function lan_modify(gl_seq){
	//email validition check		
	var win=window.open("<%=ROOT_PATH%>/game/lan_modify.do?gl_seq="+gl_seq,"modify_lan","left=10, top=10, scrolling=yes, resizable=yes");
	win.focus();
}

function lan_del(gl_seq){	
	//email validition check
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			url: "<%=ROOT_PATH%>/game/lan_del_ok.do", 
			type: "GET", 
			data: "gl_seq="+gl_seq,
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

function price_input(){
	var f=document.priceform;
	if(f.price.value==""){
		alert("가격을 입력하세요");
		f.price.focus();
		return;
	}
	
	if(f.market_url.value==""){
		alert("마켓url을 입력하세요");
		f.market_url.focus();
		return;
	}
	
	f.target="modify_process";
	f.submit();
}

function price_update(price_seq){
	var f=eval("document.pricemodform"+price_seq);
	
	if(f.price.value==""){
		alert("가격을 입력하세요");
		f.price.focus();
		return;
	}
	
	if(f.market_url.value==""){
		alert("마켓url을 입력하세요");
		f.market_url.focus();
		return;
	}
	
	f.action="<%=ROOT_PATH%>/game/price_modify_ok.do";
	f.method="post";
	f.target="modify_process";
	f.submit();
}

function price_update_end(price_seq){
	if(confirm("가격을 만료시키시겠습니까?\n만료하시면 더이상 사용이 불가능합니다.")){
		var f=eval("document.pricemodform"+price_seq);
			
		f.action="<%=ROOT_PATH%>/game/price_modify_end.do";
		f.method="post";
		f.target="modify_process";
		f.submit();
	}
}

function img_input(game_seq){
	var win=window.open("<%=ROOT_PATH%>/game/img_list.do?game_seq="+game_seq,"img_write","left=10, top=10, scrolling=yes, resizables=yes");
	win.focus();
}

function movie_input(game_seq){
	var win=window.open("<%=ROOT_PATH%>/game/movie_write.do?game_seq="+game_seq,"movie_write","left=10, top=10, scrolling=yes, resizables=yes");
	win.focus();
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
<iframe src="" id="modify_process" name="modify_process" width=0 height=0 border=0></iframe>
<table cellspacing="0" border="0" cellpadding="0" align="center" width="95%">
	<tr>
    	<td>
    	
        <table border="0" cellspacing="0" cellpadding="0" width="92%">
            <tr>
                <td><h3>게임정보 수정</h3></td>
            </tr>
        </table><br/>
        
         <table border="0" cellspacing="0" cellpadding="0" width="92%">
            <tr>
                <td><h3>기본정보 수정 &nbsp;<input type=button value="이미지 입력" onclick="img_input(<%=game_seq %>)" />&nbsp;&nbsp;</h3></td>
            </tr>
        </table>        
        <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">    
            <form name="firstform" action="<%=ROOT_PATH%>/game/modify_ok.do" method="post" >
            <input type=hidden name=game_seq value="<%=game_seq%>" />
            <tr bgcolor="#efefef">
                <td bgcolor="white" colspan="2">
                <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">                	
                	<tr bgcolor="white">
		                <td height="32" align=center>출시일(*)</td>
		                <td height="32">
		                <input type=text name="release_date" value="<%=release_date %>" readonly onclick="view_date('firstform')" />
		                </td>
		                <td height="32" align=center>cp</td>
		                <td height="32">
		                <select name="cp_no">
		                <%
							String codecp_no, companey_nm;						
							Iterator cplst = cpList.iterator();																				
								
							while ( cplst.hasNext() ) {
								Common c=(Common)cplst.next();
								codecp_no=c.getCp_no();
								companey_nm=c.getCompany_nm();
								
								out.println("<option value='"+codecp_no+"' "+(codecp_no.equals(tmpcp_no)?"selected":"")+">"+companey_nm+"</option>");																
								
							}
						%>
		                
		                </select>
		                </td>
		            </tr>		           
		            <tr bgcolor="white">
		               
		                <td height="32" align=center>유료여부</td>
		                <td height="32">		                		                
		               <input type=checkbox name="fee_yn" value="Y" <%=(fee_yn.equals("Y")?"checked":"")%>>
		                </td>
		                 <td height="32" align=center>게임등급</td>
		                <td height="32">
		                <select name="grade_code">
		                <%
		                	String code, code_nm;						
							Iterator gradelst = gradeList.iterator();																				
								
							while ( gradelst.hasNext() ) {
								Common c=(Common)gradelst.next();
								code=c.getCode();
								code_nm=c.getCode_nm();
								
								out.println("<option value='"+code+"' "+(grade_code.equals(code)?"selected":"")+">"+code_nm+"</option>");
							}
						%>
		                </select>	
		                </td>		    
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>안드로이드 지원환경</td>
		                <td height="32">
		                <input type=text name="android_requirement" size="30" value="<%=android_requirement%>" /> ex)2.3 & 2.4 & 3.0
		                </td>
		                <td height="32" align=center>IOS 지원환경</td>
		                <td height="32">
		               <input type=text name="ios_requirement" size="30" value="<%=ios_requirement%>"> ex)3 & 4 & 5
		                </td>
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>게임용량</td>
		                <td height="32">
		                <input type=text name="game_size" size="30" value="<%=game_size%>" />
		                </td>
		                <td height="32" align=center>장르</td>
		                <td height="32">
		                <select name="genre_code">
		                <%
													
							Iterator genrelst = genreList.iterator();																				
								
							while ( genrelst.hasNext() ) {
								Common c=(Common)genrelst.next();
								code=c.getCode();
								code_nm=c.getCode_nm();
								
								out.println("<option value='"+code+"' "+(genre_code.equals(code)?"selected":"")+">"+code_nm+"</option>");
							}
						%>
		                </select>		               
		                </td>
		            </tr>
		            <tr bgcolor="white">		               
		                <td height="32" align=center>판매 여부</td>
		                <td height="32">
		                <select name="sale_code">
		                <%													
							Iterator salelst = saleList.iterator();																				
								
							while ( salelst.hasNext() ) {
								Common c=(Common)salelst.next();
								code=c.getCode();
								code_nm=c.getCode_nm();
								
								out.println("<option value='"+code+"' "+(sale_code.equals(code)?"selected":"")+">"+code_nm+"</option>");
							}
						%>
		                </select>		               
		                </td>
		                <td height="32" align=center>동영상 url</td>
		                <td height="32">
		                <input type=text name="movie_url" size="50" value="<%=movie_url%>" />
		                </td>
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>추천</td>
		                <td height="32" colspan="3">
		                <input type=checkbox name="recom_yn" value="Y" <%=(recom_yn.equals("Y"))?"checked":"" %>>
		                </td>		                
		            </tr>
		            
		        </table>        
                </td>
            </tr>            
            <tr bgcolor="#efefef">
                <td bgcolor="white" colspan="4" align="center">
                <input type=button value="수정" onclick="check_form()" />   <input type=button value="목록" onclick="location.href='<%=ROOT_PATH%>/game/list.do'" />
                </td>
            </tr> 
          </form>
        </table> 
        <br/><br/>
        
        
         <table border="0" cellspacing="0" cellpadding="0" width="92%">
            <tr>
                <td><h3>상품가격</h3></td>
            </tr>
        </table>
         <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">
			<tr bgcolor="white">                   
                <td height="32" align=center>가격</td>
		        <td height="32">
		        	<table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">
		        	<form name="priceform" action="<%=ROOT_PATH%>/game/price_write_ok.do" method="post">
		        	<input type="hidden" name="game_seq" value="<%=game_seq%>" />                	
	                <tr bgcolor="white">
		                <td height="32">
		                	가격(*):<input type=text name="price" />&nbsp;
		                	마켓종류:<select name="market_code">
		                <%						
							Iterator marketlst = marketList.iterator();																				
								
							while ( marketlst.hasNext() ) {
								Common c=(Common)marketlst.next();
								code=c.getCode();
								code_nm=c.getCode_nm();
								
								out.println("<option value='"+code+"'>"+code_nm+"</option>");
							}
						%>
		                </select>	
		                마켓url(*):<input type=text name="market_url" size="50" />&nbsp;		                
		                <input type=button value='입력' onclick="price_input()" />
		                </td>
		            </tr>
		            </form>
		            </table>		            
		            <table border="0" cellspacing="1" cellpadding="1" width="70%" >                   	
                       <tr>
                       	<td class="rowTT" width="10%">가격번호</td>
                       	<td class="rowTT" width="10%">가격</td>
                       	<td class="rowTT" width="10%">마켓종류</td>
                       	<td class="rowTT" width="20%">마켓url</td>                       	
                       	<td class="rowTT" width="15%">시작일</td>
                       	<td class="rowTT" width="15%">종료일</td>                       	
                        <td class="rowTT">수정/만료</td>                           
                       </tr>	
                       <%
							
						String begin_date, end_date, tmp_end_date, market_url, market_code, market_code_nm;
						int price_seq, price;
					
						Iterator gamePricelst = gamePriceList.iterator();																					
							
						while ( gamePricelst.hasNext() ) {
							Game game= (Game)gamePricelst.next();
							price_seq=game.getPrice_seq();
							price=game.getPrice();
							begin_date=game.getBegin_date();
							end_date=game.getEnd_date();
							tmp_end_date=end_date.substring(0, 4);
							market_url=game.getMarket_url();
							market_code=game.getMarket_code();
							market_code_nm=game.getMarket_code_nm();
							
							
							
						%>
							<form name="pricemodform<%=price_seq%>">
							<input type=hidden name="game_seq" value="<%=game_seq %>">							
							<input type=hidden name="price_seq" value="<%=price_seq %>">
							<tr>
							<td><%=price_seq %></td>
	                       	<td><input type=text name=price value="<%=price%>" /></td>
	                       	<td>
	                       	<select name="market_code">
			                <%
			               		marketlst = marketList.iterator();
								while ( marketlst.hasNext() ) {
									Common c=(Common)marketlst.next();
									code=c.getCode();
									code_nm=c.getCode_nm();
									
									out.println("<option value='"+code+"' "+(market_code.equals(code)?"selected":"")+">"+code_nm+"</option>");
								}
							%>
			                </select>
	                       	</td>
	                       	<td><input type=text name=market_url value="<%=market_url%>" size="50" /></td>
	                       	<td><%=begin_date %></td>
	                       	<td><%=end_date %></td>
	                        <td>
	                        <%
	                        if(tmp_end_date.equals("9999")){
	                        %>
	                        <input type=button value="수정" onclick="price_update(<%=price_seq%>)" />/
	                        <input type=button value="만료" onclick="price_update_end(<%=price_seq%>)" />
	                        <%
	                        }
	                        %>
	                        </td>                           
	                       </tr>	
	                       </form>
						
						<%																
						}		
						%>				
                   </table>
                  </td>
                </tr>
            </table><br/><br/>
            
            
         <table border="0" cellspacing="0" cellpadding="0" width="92%">
            <tr>
                <td><h3>게임 설명 입력</h3></td>
            </tr>
        </table>
        <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">    
            <form name="myform" action="<%=ROOT_PATH%>/game/lan_write_ok.do" method="post">
            <input type=hidden name="game_seq" value="<%=game_seq %>" />
            <tr bgcolor="#efefef">
                <td bgcolor="white" colspan="2">
                <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">
                	<tr bgcolor="white">
		                <td height="32" align=center>게임명(*)</td>
		                <td height="32" >
		                <input type=text name="game_nm" />
		                </td>
		                <td height="32" align=center>언어</td>
		                <td height="32" >
		                <select name="nation_code">
	                	<option value="KR">한국</option>
	                	<option value="US">영어(미국)</option>
	                	<option value="JP">일본</option>
	                	<option value="CN">중국</option>                
	                	</select>
		                </td>			               
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>짧은설명(*)</td>
		                <td height="32" colspan="3">
		                <input type=text name="short_desc" size="100" />
		                </td>
		            </tr>		            
		            <tr>
                       <td colspan="4" bgcolor="white">
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
                       <td colspan="4" bgcolor="white">
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
                <td bgcolor="white" colspan="4" align="center"><input type=button value="입력" onclick="insGameLan()" /></td>
            </tr> 
          </form>
        </table><br/><br/>
        
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
                    <td class="searchBG"><table border="0" cellspacing="1" cellpadding="1" width="100%" >
                    	
                        <tr>
                        	<td class="rowTT" width="5%">게임명</td>
                            <td class="rowTT" width="10%">짧은설명</td>
                            <td class="rowTT" width="35%">게임설명</td>                            
                            <td class="rowTT" width="35%">게임특징</td>
                            <td class="rowTT" width="5%">언어</td>                                                                                                                
                            <td class="rowTT" width="5%">수정/삭제</td>
                        </tr>
						<%
							
							String game_nm, short_desc, game_desc, game_feather, nation_code, nation_nm;
							int gl_seq;
						
							Iterator gamelanlst = gamelanList.iterator();																					
								
							while ( gamelanlst.hasNext() ) {
								Game game= (Game)gamelanlst.next();
								gl_seq=game.getGl_seq();
								game_nm=game.getGame_nm();
								short_desc=game.getShort_desc();
								game_desc=game.getGame_desc();
								game_feather=game.getGame_feather();
								nation_code=game.getNation_code();
								nation_nm=game.getNation_nm();
																
								
						%>
                        <tr bgcolor="#ffffff">
                        	<td class="rowAlignCt"><%=game_nm %></td>
                        	<td class="rowAlignCt"><%=short_desc %></td>
                            <td class="rowAlignCt"><%=game_desc %></td>
                            <td class="rowAlignCt"><%=game_feather %></td>                                                                                    
                            <td class="rowAlignCt"><%=nation_nm %></td>
                            <td class="rowAlignCt"><a href="javascript:lan_modify(<%=gl_seq%>)">수정</a>/
                            <a href="javascript:lan_del(<%=gl_seq%>)">삭제</a></td>
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

<!-- bottom-->
</TD></TR>
<jsp:include page="/WEB-INF/web/include/tail.jsp" flush="true">
<jsp:param name="i_over" value="imoticon" />
</jsp:include>