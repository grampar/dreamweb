<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.File,java.io.RandomAccessFile,java.io.FileOutputStream" %>


<%     
int maxPostSize = 10 * 1024 * 1024; // 10MB     
String saveDirectory = config.getServletContext().getRealPath("/upload");



File dir=new File(saveDirectory);
if(!dir.isDirectory()){
	dir.mkdirs();
}


MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize, "utf-8");      
Enumeration formNames=multi.getFileNames();  // 폼의 이름 반환

String prod_id=multi.getParameter("prod_id");

String fileInput = "";     
String fileName = "";     
String type = "";     
File fileObj = null;     
String originFileName = "";         
String fileExtend = "";     
String fileSize = "";

while(formNames.hasMoreElements()) {          
	fileInput = (String)formNames.nextElement();                // 파일인풋 이름          
	fileName = multi.getFilesystemName(fileInput);            // 파일명          
	if (fileName != null) {               
		type = multi.getContentType(fileInput);                   //콘텐트타입                   
		fileObj = multi.getFile(fileInput);                             //파일객체               
		originFileName = multi.getOriginalFileName(fileInput);           //초기 파일명               
		fileExtend = fileName.substring(fileName.lastIndexOf(".")+1); //파일 확장자               
		fileSize = String.valueOf(fileObj.length());                    // 파일크기          
	}     
}


RandomAccessFile raf=null;
try{
	
	String line = ""; 
	raf = new RandomAccessFile("/webadmin/dreamweb/reserve.log", "rw");
	raf.seek(raf.length());

	FileOutputStream writer = new FileOutputStream(raf.getFD());
	line = "\r\n" +"["+ originFileName + "]\r\n";			
	writer.write(line.getBytes());
	raf.close();		
	
}catch(Exception e){
	e.printStackTrace();	
}


out.println(originFileName+"//"+prod_id+"<br>");



%>
