package nextep.cp;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import nextep.common.Common;
import nextep.common.CommonDao;

import nextep.util.CommonUtil;


public class CpController extends MultiActionController {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	private CpDao cpDao;
	private CommonDao commonDao;
	

	public void setCpDao(CpDao cpDao){
		this.cpDao = cpDao;
	}
	
	public void setCommonDao(CommonDao commonDao){
		this.commonDao = commonDao;
	}
	
	public ModelAndView getCpList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		
		
		String search_str = (request.getParameter("search_str")!=null)? request.getParameter("search_str") : "";
		int go_page = (request.getParameter("go_page")!=null)? Integer.parseInt(request.getParameter("go_page")) : 1;
				

		int record_scale = 10;
		int page_scale = 10;

		String search = "&search_str="+search_str;
		String gurl="";
		
		Cp cp=new Cp();
		cp.setSearch_str(search_str);
						
		//total count
	    int total_record = cpDao.getCpCount(cp);
	    
	    
		int totalpage = (int)Math.ceil((double)total_record / (double)record_scale);
		if (totalpage>0 && totalpage < go_page) 
			go_page = totalpage;

		int start_num = (go_page - 1) * record_scale + 1;
		int end_num = start_num + record_scale - 1;		
		
		cp.setSearch_str(search_str);		
		cp.setStart_num(start_num);
		cp.setEnd_num(end_num);
		
		
	    List<Cp> boardList = cpDao.getCpList(cp);
	    String page_navi=CommonUtil.getPage(total_record, record_scale, page_scale, go_page, search, gurl);
	    
	    List<Common> cpList=commonDao.getCP("");
	    
	    
	    request.setAttribute("search_str", search_str);	    
	    request.setAttribute("go_page", go_page);
	  
	    
	    //modelandview
	    ModelAndView mav = new ModelAndView("cp/list");
	    mav.addObject("boardList", boardList);
	    mav.addObject("page_navi", page_navi);
	    	    
	    
	    	   	    
	    return mav;
	}
	
	
	public ModelAndView getCpWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//logger.info("getNewDevelopWrite 호출합니다.");
				
		String cp_no="";
		
		
		List<Common> nationList = commonDao.getNation("");
				
	
	    
	    //view finder에게 보낸다.
	    ModelAndView mav = new ModelAndView("cp/write");
	    mav.addObject("nationList", nationList);
	    	    
	    	    
	    return mav;
	}
	
	public ModelAndView insCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		Cp cp= new Cp();

		/* board 객체 Binding */
		bind(request, cp);
				
		int result=cpDao.insCp(cp);
		
		
		ModelAndView mav = new ModelAndView("cp/write_ok");
		mav.addObject("insertResult" ,result );
				
		return mav;
	}
	
	
	public ModelAndView getCpModify(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//logger.info("getNewDevelopWrite 호출합니다.");
		
		
		String cp_no=(request.getParameter("cp_no")==null)? "": request.getParameter("cp_no");
		int go_page=(request.getParameter("go_page")==null)? 1: Integer.parseInt(request.getParameter("go_page"));
		String search_str=(request.getParameter("search_str")==null)? "": request.getParameter("search_str");
		
						
		Cp cp=new Cp();
		cp.setCp_no(cp_no);
						
		List<Cp> cpView=cpDao.getCpView(cp);
		
		List<Common> nationList = commonDao.getNation("");
		
		
		
		request.setAttribute("search_str", search_str);	    
		request.setAttribute("go_page", go_page);
		request.setAttribute("cp_no", cp_no);
			    
	    //view finder에게 보낸다.
	    ModelAndView mav = new ModelAndView("cp/modify");
	    mav.addObject("cpView", cpView);
	    mav.addObject("nationList", nationList);
	    
	   	    	    	    
	    return mav;
	}
	
	public ModelAndView uptCp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		String cp_no=(request.getParameter("cp_no")==null)? "": request.getParameter("cp_no");
		int go_page=(request.getParameter("go_page")==null)? 1: Integer.parseInt(request.getParameter("go_page"));
		String search_str=(request.getParameter("search_str")==null)? "": request.getParameter("search_str");
		
		Cp cp= new Cp();

		/* board 객체 Binding */
		bind(request, cp);
						
		
		int result=cpDao.uptCp(cp);
		
		request.setAttribute("search_str", search_str);	    
		request.setAttribute("go_page", go_page);
		request.setAttribute("cp_no", cp_no);
		
		ModelAndView mav = new ModelAndView("cp/modify_ok");
		mav.addObject("insertResult" ,result );
				
		return mav;
	}
	
	
}
