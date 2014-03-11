<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%@ include file="/WEB-INF/web/common/check_user.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="<%=ROOT_PATH%>/css/common.css" rel=stylesheet type=text/css />
</head>
<body bgcolor='#ffffff' bottommargin=0 leftmargin=0 rightmargin=0 topmargin=0 marginheight="0" marginwidth="0">
####################### 테스트 서버 ################################
<table border=0 cellpadding=0 cellspacing=0 height="100%" width="100%">
  <tbody>
  <tr>
    <td colspan=2 valign=top>
      <table border=0 cellpadding=0 cellspacing=0 width="100%">
        <tbody>
        <tr bgcolor='#c67400'><td colspan=2><img height=1 src="<%=ROOT_PATH%>/images/dot.gif" width=1></td></tr>
        <tr bgcolor='#4a7ba5'>
			 <td bgcolor="#1698b8" height=70><a href="http://java.pms.adm.noribox.com/pub/cal.do" onfocus='this.blur()'><div id="logo_title" name="logo_title" class="login_title">프로젝트 관리시스템</div></a></td>
          <td align=right valign=bottom bgcolor="#1698b8">
            
			<TABLE border=0 cellPadding=0 cellSpacing=0>
              <TBODY>
              <TR>
                <TD class=topInfo height=14 noWrap vAlign=bottom>IP Address - <?= $_SERVER['REMOTE_ADDR'] ?></TD>
                <TD><IMG height=1 src="<%=ROOT_PATH%>/images/dot.gif" width=10></TD>
                <TD bgColor='#1698b8' rowSpan=2><IMG height=1 src="<%=ROOT_PATH%>/images/dot.gif" width=1></TD>
                <TD><IMG height=1 src="<%=ROOT_PATH%>/images/dot.gif" width=10></TD>
                <TD class=topInfo noWrap vAlign=bottom><?= date("M d, Y H:i")?></TD>
                <TD><IMG height=1 src="<%=ROOT_PATH%>/images/dot.gif" width=10></TD>
                <TD bgColor='#1698b8' rowSpan=2><IMG height=1 src="<%=ROOT_PATH%>/images/dot.gif" width=1></TD>
                <TD><IMG height=1 src="<%=ROOT_PATH%>/images/dot.gif" width=10></TD>
                <TD class=topInfo noWrap vAlign=bottom>Ver. 2.0.0<!-- 버전관련 정보는 WEB_ROOT/version.txt에서 확인 할수 있습니다. --></TD>
                <TD><IMG height=1 src="<%=ROOT_PATH%>/images/dot.gif" width=10></TD>
              </TR>
              <TR>
                <TD colSpan=10><IMG height=3 src="<%=ROOT_PATH%>/images/dot.gif" width=1></TD></TR>
				</TBODY>
			</TABLE>          	
        	</td></tr>
		</tbody>
		</table>
<%
String menu_style1="menu";
String menu_style2="menu";
String menu_style3="menu";
String menu_style4="menu";
String menu_style5="menu";
String menu_style6="menu";
String menu_style7="menu";
String menu_style8="menu";
String menu_style9="menu";



String cur_url=request.getRequestURI();


if(cur_url.indexOf("main")!=-1){ //현황판
	menu_style1="menuTitle";
}else if(cur_url.indexOf("project")!=-1){ //프로젝트
	menu_style2="menuTitle";
}else if(cur_url.indexOf("issue")!=-1){ //이슈/업무관리
	menu_style3="menuTitle";
}else if(cur_url.indexOf("publishing")!=-1){ //게임출시
	menu_style4="menuTitle";
}else if(cur_url.indexOf("board")!=-1){ //게시판
	menu_style5="menuTitle";
}else if(cur_url.indexOf("report")!=-1){ //문서
	menu_style6="menuTitle";
}else if(cur_url.indexOf("team")!=-1){ //팀관리
	menu_style7="menuTitle";
}else if(cur_url.indexOf("publish/holiday")!=-1){ //팀관리
	menu_style8="menuTitle";
}else if(cur_url.indexOf("publish/")!=-1){ //팀관리
	menu_style9="menuTitle";
}


%>

</TD></TR>