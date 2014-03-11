<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="nextep.game.Game, nextep.common.Common" %>
<%@page import="java.util.Date"%>

<%
	
	
	String search_str = (String)request.getAttribute("search_str") ;
	int go_page = (Integer)request.getAttribute("go_page");	
	String cp_no = (String)request.getAttribute("cp_no") ;
		

	List<Game> boardList = (List<Game>)request.getAttribute("boardList");		
	List<Common> cpList = (List<Common>)request.getAttribute("cpList");
	
	String page_navi= (String)request.getAttribute("page_navi");
	
	
	
	
	String search="search_str="+search_str+"&go_page="+go_page+"&cp_no="+cp_no;
		
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
    	<td>     
                		
    		<table border="0" cellspacing="0" cellpadding="0" width="92%">
                <tr>
                    <td><h3>게임정보</h3></td>
                </tr>
            </table> 
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <form name="myform" action="<%=ROOT_PATH %>/game/list.do" method="get" >
                    <tr>
                        <td width="80%">cp:
                         <select name="cp_no">
                         <option value=""></option>
		                <%							
							String tmpcp_no, tmpcompany_nm;
		                
							Iterator cplst = cpList.iterator();
							while ( cplst.hasNext() ) {
								Common c=(Common)cplst.next();
								tmpcp_no=c.getCp_no();
								tmpcompany_nm=c.getCompany_nm();
								out.println("<option value='"+tmpcp_no+"' "+(tmpcp_no.equals(cp_no)?"selected":"")+">"+tmpcompany_nm+"</option>");	
								
							}
						%>		                
		                </select>
		                	게임명:
                        <input type="text" name="search_str" value="<%=search_str%>" /> &nbsp;<input type=button value="검색" onclick="str_search()" />
                        &nbsp;&nbsp;&nbsp;&nbsp;                                                                  	                    
                        </td>                        
            			<td width="20%">  
            			<input type="button" value="입력" onclick="location.href='<%=ROOT_PATH %>/game/write.do'" />    	                       
                        </td>
                    </tr>
                </form>
            </table>
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
                    <td class="searchBG">
                    <table border="0" cellspacing="1" cellpadding="1" width="100%" >
                        <tr>
                            <td class="rowTT" width="10%">게임명</td>
                            <td class="rowTT" width="10%">출시일</td>                                                                     
                            <td class="rowTT" width="15%">cp</td>
                            <td class="rowTT" width="10%">장르</td>
                            <td class="rowTT" width="10%">등급</td>
                            <td class="rowTT" width="10%">유료여부</td>
                            <td class="rowTT" width="10%">추천여부</td>
                            <td class="rowTT" width="15%">등록일</td>
                        </tr>
                      
						<%
							Iterator lst = boardList.iterator();
							String game_nm, release_date, reg_date, genre_nm, grade_nm, cp_id, company_nm, fee_yn, recom_yn ;
							int game_seq;
								
							while ( lst.hasNext() ) {
								Game g= (Game)lst.next();
								
								game_seq=g.getGame_seq();
								game_nm=g.getGame_nm();
								release_date=g.getRelease_date();
								reg_date=g.getReg_date();
								fee_yn=g.getFee_yn();
								genre_nm=g.getGenre_nm();
								grade_nm=g.getGrade_nm();
								cp_id=g.getCp_id();								
								recom_yn=g.getRecom_yn();																
								company_nm=g.getCompany_nm(); 
								
								if(recom_yn.equals("Y")) recom_yn="추천";
								else recom_yn="미추천";
								
								if(fee_yn.equals("Y")) fee_yn="유료";
								else fee_yn="무료";
								
								
						%>   
                            
                        <tr bgcolor="#ffffff">
                            <td class="rowAlignCt"><a href="<%=ROOT_PATH%>/game/modify.do?game_seq=<%=game_seq%>&<%=search%>"><%=game_nm %></a></td>
                            <td class="rowAlignCt"><%=release_date %></td>   
                             <td class="rowAlignCt"><%=company_nm %></td>
                             <td class="rowAlignCt"><%=genre_nm %></td>
                             <td class="rowAlignCt"><%=grade_nm%></td>
                             
                             <td class="rowAlignCt"><%=fee_yn%></td>
                             <td class="rowAlignCt"><%=recom_yn%></td>
                             <td class="rowAlignCt"><%=reg_date%></td>                                                                                 
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