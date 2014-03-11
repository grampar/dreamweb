<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="nextep.noticeinfo.NoticeInfo, nextep.common.Common" %>
<%
	
			
	List boardList = (List)request.getAttribute("boardList");
	List codeList = (List)request.getAttribute("codeList");
	List nviewList = (List)request.getAttribute("nviewList");
	String search_mode =(String) request.getAttribute("search_mode") ;
	String search_str = (String)request.getAttribute("search_str") ;
	String equip_code = (String)request.getAttribute("equip_code") ;
	String kind_code = (String)request.getAttribute("kind_code") ;
	
	int game_seq = (Integer)request.getAttribute("game_seq");
	int n_seq = (Integer)(request.getAttribute("n_seq")!=null? request.getAttribute("n_seq") : 0);
	int go_page = (Integer)request.getAttribute("go_page");
	
	
	String search="game_seq="+game_seq+"&go_page="+go_page+"&search_mode="+search_mode+"&search_str="+search_str+"&equip_code="+equip_code+"&kind_code="+kind_code;
	
	
	Iterator nvlst=nviewList.iterator();
	String view_yn="";
	if(nvlst.hasNext()){		
		NoticeInfo nvo=(NoticeInfo)nvlst.next();
		view_yn=(nvo.getView_yn()==null?"":nvo.getView_yn());
		
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
<script language="Javascript">
<!--

function check_form(f) {

	if(f.title.value==""){
		alert("제목을 입력해주세요");
		f.title.focus();
		return false;		
	}
	
	if(f.cmnt.value==""){
		alert("내용을 입력해주세요");
		f.cmnt.focus();
		return false;		
	}
	
		
	return true;
}

function notice_modify(nn_seq){
	//email validition check		
	var win=window.open("<%=ROOT_PATH%>/gamenotice/modify.do?nn_seq="+nn_seq,"modify","width=100, height=100");
	win.focus();
}

function notice_del(nn_seq){	
	//email validition check
	if(confirm("정말로 삭제하시겠습니까?")){
		$.ajax({
			url: "<%=ROOT_PATH%>/gamenotice/del.do", 
			type: "GET", 
			data: "nn_seq="+nn_seq,
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

function check_view(n_seq){
	
	var view_yn;
	if(document.myform.view_yn.checked==true){
		view_yn="Y";
	}else{
		view_yn="N";
	}
	
	$.ajax({
		url: "<%=ROOT_PATH%>/gamenotice/view_update.do", 
		type: "GET", 
		data: "view_yn="+view_yn+"&n_seq="+n_seq,
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

//-->
</script>
<table cellspacing="0" border="0" cellpadding="0" align="center" width="95%">
	<tr>
    	<td>
    	
        <table border="0" cellspacing="0" cellpadding="0" width="92%">
            <tr>
                <td><h3>공지사항 등록</h3></td>
            </tr>
        </table>
                
        <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">    
            <form name="myform" action="<%=ROOT_PATH%>/gamenotice/write_ok.do" method="post" onsubmit="return check_form(this)">
            <input type="hidden" name="game_seq" value="<%=game_seq %>" />
            <input type="hidden" name="search_mode" value="<%=search_mode %>" />
            <input type="hidden" name="search_str" value="<%=search_str %>" />
            <input type="hidden" name="n_seq" value="<%=n_seq %>" />
            <input type="hidden" name="go_page" value="<%=go_page %>" />
            <%                	
            if(n_seq!=0){
            %>
            <tr bgcolor="#efefef">
            	<td bgcolor="white" colspan="2">
            	<input type=checkbox id="view_yn" name="view_yn" value="Y" onclick="check_view(<%=n_seq%>)" <%=(view_yn.equals("Y")?"checked":"") %>>
            	공지보이기</td>
            </tr>
            <%
            }
            %>            	
           
            <tr bgcolor="#efefef">
                <td bgcolor="white" colspan="2">
                <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%" bgcolor="d3d5d6" class="view_table">
                	<%                	
                	if(n_seq==0){
                	%>
                	<tr bgcolor="white">
		                <td height="32" align=center>분류</td>
		                <td height="32">
		                <select name="kind_code">
		                <%
							
							String code, code_nm;
						
							Iterator codelst = codeList.iterator();																					
								
							while ( codelst.hasNext() ) {
								Common c=(Common)codelst.next();
								code=c.getCode();
								code_nm=c.getCode_nm();
								
								out.println("<option value='"+code+"'>"+code_nm+"</option>");
								
																								
								
							}
						%>
		                
		                </select>
		                </td>
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>장비</td>
		                <td height="32">
		                <select name="equip_code">
		                <option value="C01">아이폰</option>
		                <option value="C02">안드로이드</option>
		                </select>
		                </td>
		            </tr>
		            <%
                	}
		            %>	                    	
                	<tr bgcolor="white">
		                <td height="32" align=center>언어</td>
		                <td height="32">
		                <select name="nation_code">
	                	<option value="KR">한국</option>
	                	<option value="US">영어(미국)</option>
	                	<option value="JP">일본</option>
	                	<option value="CN">중국</option>                
	                	<option value="TW">대만</option>
	                	</select>
	                </td>
		            </tr>         
		            <tr bgcolor="white">
		                <td height="32" align=center>제목</td>
		                <td height="32"><input type=text name="title" value="" size="120"/></td>
		            </tr>
		            <tr bgcolor="white">
		                <td height="32" align=center>내용</td>
		                <td height="32" ><textarea name="cmnt" rows="15" cols="120"></textarea></td>
		            </tr>
		        </table>        
                </td>
            </tr>            
            <tr bgcolor="#efefef">
                <td bgcolor="white" colspan="2" align="center">
                <input type=submit value="전송" />   <input type=button value="목록" onclick="location.href='<%=ROOT_PATH%>/gamenotice/list.do?<%=search%>'" />
                </td>
            </tr> 
          </form>
        </table> 
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
                    <td class="searchBG"><table border="0" cellspacing="1" cellpadding="1" width="100%" >
                    	
                        <tr>
                        	<td class="rowTT" width="5%">언어</td>
                            <td class="rowTT" width="20%">제목</td>
                            <td class="rowTT" width="60%">내용</td>                            
                            <td class="rowTT" width="10%">등록일시</td>                                                                                    
                            <td class="rowTT" width="5%">수정/삭제</td>
                        </tr>
						<%
							int nn_seq;
							String nation_code, title, cmnt, reg_date, nation_nm;
						
							Iterator boardlst = boardList.iterator();																					
								
							while ( boardlst.hasNext() ) {
								NoticeInfo nd= (NoticeInfo)boardlst.next();
								nn_seq=nd.getNn_seq();
								nation_code=nd.getNation_code();
								title=nd.getTitle();
								cmnt=nd.getCmnt().replaceAll("\n", "<br/>");
								reg_date=nd.getReg_date();								
								nation_nm=nd.getNation_nm();
																
																
								
						%>
                        <tr bgcolor="#ffffff">
                        	<td class="rowAlignCt"><%=nation_nm %></td>
                        	<td class="rowAlignCt"><%=title %></td>
                            <td class="rowAlignCt"><%=cmnt %></td>
                            <td class="rowAlignCt"><%=reg_date %></td>                                                                                    
                            <td class="rowAlignCt"><a href="javascript:notice_modify(<%=nn_seq%>)">수정</a>/
                            <a href="javascript:notice_del(<%=nn_seq%>)">삭제</a></td>
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