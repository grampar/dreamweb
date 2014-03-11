<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/web/common/common.jsp" %>
<%



int retVal = ((Integer)request.getAttribute("insertResult")).intValue();


out.print(retVal);
%>
