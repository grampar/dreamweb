 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>

 </TD></TR>
  <TR>
    <TD colSpan=2 vAlign=bottom>
      <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
        <TBODY>
        <TR bgColor='#AAAAA9'>
          <TD colSpan=2><IMG height=1 src="<%=ROOT_PATH%>/images/dot.gif" width=1></TD></TR>
        <TR bgColor='#ffffff'>
          <TD colSpan=2><IMG height=1 src="<%=ROOT_PATH%>/images/dot.gif" width=1></TD></TR>
        <TR bgColor='#d5d5d5'>
          <TD height=26 bgcolor="#EEEEEC" class=copyright>&nbsp;&nbsp;Copyright&copy; 2000-2003 Nextepmedia, Inc. All rights reserved.</TD>
          <TD align=right bgcolor="#EEEEEC"><?= $acc[("http://".$_SERVER["HTTP_HOST"].$_SERVER["PHP_SELF"])] ?><!--A href="http://www.techsystem.net/" target=_blank><IMG alt="EAP Korea, Inc." border=0 height=24 src="images/logo_tst.gif" width=247></A--></TD></TR>
        <TR bgColor='#adadad'>
          <TD colSpan=2><IMG height=1 src="<%=ROOT_PATH%>/images/dot.gif" width=1></TD></TR>
		</TBODY>
	  </TABLE>
    </TD></TR>
</TBODY>
</TABLE>
</BODY>
</HTML>
