package nextep.login;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nextep.common.CommonDao;
import nextep.util.CommonUtil;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class LoginController extends MultiActionController {
	private LoginDao loginDao;
	private CommonDao commonDao;
	
	public void setLoginDao(LoginDao loginDao){
		this.loginDao = loginDao;
	}
	
	public void setCommonDao(CommonDao commonDao){
		this.commonDao = commonDao;
	}
	
	
	public ModelAndView getLoginInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		//logger.info("getNewDevelopList ");
		
		String admin_id=request.getParameter("admin_id");
		String admin_pwd=request.getParameter("admin_pwd");
		
	    
		Login l=new Login();
		l.setAdmin_id(admin_id);
		l.setAdmin_pwd(admin_pwd);
		
		//modelandview		
	    List<Login> boardList = loginDao.getAdminInfo(l);
	    
	    Iterator<Login> boarditl=boardList.iterator();
	    ModelAndView mav=null;
	    if(boarditl.hasNext()){
	    	System.out.println("ok");
	    	
	    	mav = new ModelAndView("login_ok");
	    	mav.addObject("admin_id", admin_id);	 	    
	    }else{
	    	System.out.println("fail");
	    	mav = new ModelAndView("error");	 
	    	mav.addObject("msg", "인증실패");
	    }
	    
	    	    
	    	   	    
	    return mav;
	}
}
