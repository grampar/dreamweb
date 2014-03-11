package nextep.develop;

import java.util.Iterator;
import java.util.List;

import javax.mail.internet.NewsAddress;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nextep.common.Common;
import nextep.common.CommonDao;
import nextep.develop.NewDevelop;
import nextep.develop.NewDevelopService;

import nextep.util.CommonUtil;
import nextep.util.MailSender;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class NewDevelopController extends MultiActionController  {

	protected final Log logger = LogFactory.getLog(getClass());
	
	private NewDevelopService newDevelopService;  // DI Interface
	private CommonDao commonDao;  // DI Interface
	private UserListExeclView userListExeclView;
	
	public void setNewDevelopService(NewDevelopService newDevelopService){
		this.newDevelopService = newDevelopService;
	}
	
	public void setCommonDao(CommonDao commonDao){
		this.commonDao = commonDao;
	}
	
	public void setUserListExeclView(UserListExeclView userListExeclView){
		this.userListExeclView = userListExeclView;
	}
	
	
	
	public ModelAndView getNewDevelopList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		
				
		String search_str = (request.getParameter("search_str")!=null)? request.getParameter("search_str") : "";
		
		int go_page = (request.getParameter("go_page")!=null)? Integer.parseInt(request.getParameter("go_page")) : 1;

		int record_scale = 20;
		int page_scale = 10;

		String search = "&search_str=" + search_str;
		String gurl="";
		
		//total count
	    int total_record = newDevelopService.getNewDevelopCount(search_str);
	    
	    		
		int totalpage = (int)Math.ceil((double)total_record / (double)record_scale);
		if (totalpage>0 && totalpage < go_page) 
			go_page = totalpage;

		int start_num = (go_page - 1) * record_scale + 1;
		int end_num = start_num + record_scale - 1;		
		
			    
		//modelandview
		
	    List<NewDevelop> boardList = newDevelopService.getNewDevelopList(start_num, end_num, record_scale, go_page, search_str);
	    
	    String page_navi=CommonUtil.getPage(total_record, record_scale, page_scale, go_page, search, gurl);
	    
	    
	    //List<Common> genList =commonDao.getCode("NCC");
	    
	    request.setAttribute("search_str", search_str);	    
	    request.setAttribute("go_page", go_page);
	    
	    
	    
	    ModelAndView mav = new ModelAndView("new_dev/list");
	    mav.addObject("boardList", boardList);
	    mav.addObject("page_navi", page_navi);
	   // mav.addObject("genList", genList);
	    
	    	   	    
	    return mav;
	}
	
	
	public ModelAndView getNewDevelopListExecl(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		
		
		String search_str = (request.getParameter("search_str")!=null)? request.getParameter("search_str") : "";
		
			    
		
	    List<NewDevelop> boardList = newDevelopService.getNewDevelopListExecl(search_str);
	        
	    
	    //modelandview
	    ModelAndView mav = new ModelAndView(userListExeclView, "NewDevelop", boardList);
	    //mav.addObject("boardList", boardList);	    
	    // mav.addObject("genList", genList);
	    
	    	   	    
	    return mav;
	}
	
	
	
	public ModelAndView getNewDevelopView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		
		
		String search_str = (request.getParameter("search_str")!=null)? request.getParameter("search_str") : "";
		String sort = (request.getParameter("sort")!=null)? request.getParameter("sort") : "";
		int go_page = (request.getParameter("go_page")!=null)? Integer.parseInt(request.getParameter("go_page")) : 1;
		String user_no = request.getParameter("user_no");
	
		
		    
	    //modelandview
	    List<NewDevelop> boardList = newDevelopService.getNewDevelopView(user_no);
	    
	    
	    
	    request.setAttribute("search_str", search_str);
	    request.setAttribute("sort", sort);
	    request.setAttribute("go_page", go_page);
	    request.setAttribute("user_no", user_no);
	    
	    ModelAndView mav = new ModelAndView("new_dev/view");
	    mav.addObject("boardList", boardList);
	    	    
	    	   	    
	    return mav;
	}
	
	
	public ModelAndView getMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		
	    
	    ModelAndView mav = new ModelAndView("index2");
	    	   	    
	    return mav;
	}
	
	

}
