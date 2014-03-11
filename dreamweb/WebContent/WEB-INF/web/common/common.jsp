<%@ page pageEncoding="UTF-8"%>
<%


String ROOT_PATH=request.getContextPath(); 

String NB_DOMAIN		= "dream.adm.dreamrepublic.net:8080";
String NB_HOME_URL	= "http://"+NB_DOMAIN+"/";
String NB_HOME_URL1	= "/";




// 이미지 서버 기본 셋팅
String IMG_DOMAIN		= "dream.adm.dreamrepublic.net:8080";	//$_IMG_DOMAIN	= "simfile.adm.noribox.com";
String IMG_URL			= "http://"+IMG_DOMAIN+ROOT_PATH;
String IMG_GAME_PATH		= IMG_URL+"/game_img";
String IMG_DESC_PATH		= IMG_URL+"/game_info";

//TITLE
String TITLE = "프로젝트 관리시스템";





response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", 0);
if (request.getProtocol().equals("HTTP/1.1")) {
	response.setHeader("Cache-Control", "no-cache");
}



Cookie[] cookies=request.getCookies();
String ADMIN_ID="";
String R_URL="";

if(cookies!=null){
	for(int i=0;i<cookies.length;i++) {
		if("admin_id".equals(cookies[i].getName())){
			//T_SEQ = Integer.parseInt(java.net.URLDecoder.decode(cookies[i].getValue(),"MS949"));
			ADMIN_ID = java.net.URLDecoder.decode(cookies[i].getValue(),"MS949");
		}else if("R_URL".equals(cookies[i].getName())){
			R_URL= java.net.URLDecoder.decode(cookies[i].getValue(),"MS949");
		}			
	}		
}


%>