package nextep.fileupload;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class UploadController extends MultiActionController {
	protected final Log logger = LogFactory.getLog(getClass());
	private File uploadDir;
	public void setUploadDir(File uploadDir){
		this.uploadDir=uploadDir;
	}
		
	
	public ModelAndView FFFuploadFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		request.setCharacterEncoding("UTF-8");
		
		String resultMessage="";
		
		response.setContentType("text/plain");
		
		if(!(request instanceof MultipartHttpServletRequest)){
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Expected mutipart request");
			return null;
		}
		
		MultipartHttpServletRequest multipartRequest=(MultipartHttpServletRequest) request;
		MultipartFile imgFile=multipartRequest.getFile("file1");
		
		final String imgFileName=imgFile.getOriginalFilename().trim();
		
		System.out.println(uploadDir.getAbsolutePath());
		String filePath=uploadDir.getAbsolutePath()  + File.separator;
		
		//여기에 중복 체크 추가
		
		//용량체크
		long fileSize=imgFile.getSize();
		if(fileSize>2048000 || fileSize<0){
			resultMessage="20MB 이상의 파일은 업로드 할 수 없습니다.";
		}
		
		
		//확장자 체크
		int pathPoint=imgFileName.lastIndexOf(".");
		String filePoint=imgFileName.substring(pathPoint+1, imgFileName.length());
		String fileType=filePoint.toLowerCase();
		
		if(!fileType.equals("jpg") && !fileType.equals("gif")){
			resultMessage="이미지만 업로드 할실 수 있습니다.";
		}
		
		File f=new File(filePath+"64");
		if(!f.exists()){
			f.mkdirs();
		}
		UUID uid = new UUID(1,1);
		
		
		
		String finalFnm=filePath+"64"+File.separator+uid.randomUUID().toString()+"."+fileType;
		imgFile.transferTo(new File(finalFnm));
		
		
		ModelAndView mv=new ModelAndView("upload/file_success");
				
		
		//ModelAndView mv=new ModelAndView("upload/file_upload");
	    	   	    
	    return mv;
	}
	
	public ModelAndView uploadForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		
		
		ModelAndView mv=new ModelAndView("upload/file_upload");
		
		
	    
	    	   	    
	    return mv;
	}
	
	
	
	public ModelAndView setMobileuploadFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		request.setCharacterEncoding("UTF-8");
		
		String resultMessage="";
		
		response.setContentType("text/plain");
		
		if(!(request instanceof MultipartHttpServletRequest)){
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Expected mutipart request");
			return null;
		}
		
		MultipartHttpServletRequest multipartRequest=(MultipartHttpServletRequest) request;
		MultipartFile imgFile=multipartRequest.getFile("file1");
		
		final String imgFileName=imgFile.getOriginalFilename().trim();
		
		System.out.println(uploadDir.getAbsolutePath());
		String filePath=uploadDir.getAbsolutePath()  + File.separator;
		
		//여기에 중복 체크 추가
		
		//용량체크
		long fileSize=imgFile.getSize();
		if(fileSize>2048000 || fileSize<0){
			resultMessage="20MB 이상의 파일은 업로드 할 수 없습니다.";
		}
		
		
		//확장자 체크
		int pathPoint=imgFileName.lastIndexOf(".");
		String filePoint=imgFileName.substring(pathPoint+1, imgFileName.length());
		String fileType=filePoint.toLowerCase();
		
		if(!fileType.equals("jpg") && !fileType.equals("gif")){
			resultMessage="이미지만 업로드 할실 수 있습니다.";
		}
		
		File f=new File(filePath+"64");
		if(!f.exists()){
			f.mkdirs();
		}
		UUID uid = new UUID(1,1);
		
		
		
		String finalFnm=filePath+"64"+File.separator+uid.randomUUID().toString()+"."+fileType;
		imgFile.transferTo(new File(finalFnm));
		
		
		ModelAndView mv=new ModelAndView("upload/file_success");
				
		
		//ModelAndView mv=new ModelAndView("upload/file_upload");
	    	   	    
	    return mv;
	}
}
