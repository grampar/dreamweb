package nextep.noticeinfo;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import nextep.common.Common;
import nextep.common.CommonDao;
import nextep.noticeinfo.NoticeInfoDao;

import nextep.util.CommonUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;




public class NoticeInfoController extends MultiActionController {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	private NoticeInfoDao noticeInfoDao;
	private CommonDao commonDao;
	
	public void setNoticeInfoDao(NoticeInfoDao noticeInfoDao){
		this.noticeInfoDao = noticeInfoDao;
	}
	
	public void setCommonDao(CommonDao commonDao){
		this.commonDao = commonDao;
	}
	
	public ModelAndView getNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		if(logger.isDebugEnabled()){
			logger.info("getNoticeList ");
		}
		//logger.info("getNewDevelopList ");
		
		int game_seq = (request.getParameter("game_seq")!=null)? Integer.parseInt(request.getParameter("game_seq")) : 1;
		String search_mode = (request.getParameter("search_mode")!=null)? request.getParameter("search_mode") : "";
		String search_str = (request.getParameter("search_str")!=null)? request.getParameter("search_str") : "";
		int go_page = (request.getParameter("go_page")!=null)? Integer.parseInt(request.getParameter("go_page")) : 1;
		String kind_code = (request.getParameter("kind_code")!=null)? request.getParameter("kind_code") : "";
		String equip_code = (request.getParameter("equip_code")!=null)? request.getParameter("equip_code") : "";
		

		int record_scale = 20;
		int page_scale = 10;

		String search = "&game_seq="+game_seq+"&search_mode=" + search_mode+"&search_str=" + search_str;
		String gurl="";
		
		//total count
	    int total_record = noticeInfoDao.getNoticeCount(game_seq, search_mode, search_str, equip_code, kind_code);
	    
	    
		
		int totalpage = (int)Math.ceil((double)total_record / (double)record_scale);
		if (totalpage>0 && totalpage < go_page) 
			go_page = totalpage;

		int start_num = (go_page - 1) * record_scale + 1;
		int end_num = start_num + record_scale - 1;		
				
	    
		//modelandview
		
	    List<NoticeInfo> boardList = noticeInfoDao.getNoticeList(game_seq, start_num, end_num, record_scale, go_page, search_mode, search_str, 
	    		equip_code, kind_code);
	    
	    String page_navi=CommonUtil.getPage(total_record, record_scale, page_scale, go_page, search, gurl);
	    
	    
	    List<NoticeInfo> gameList =noticeInfoDao.getGameCodeList();
	    
	    
	    List<Common> codeList = commonDao.getCode("NKC");
	    
	    request.setAttribute("game_seq", game_seq);
	    request.setAttribute("search_mode", search_mode);
	    request.setAttribute("search_str", search_str);	    
	    request.setAttribute("go_page", go_page);
	    request.setAttribute("equip_code", equip_code);
	    request.setAttribute("kind_code", kind_code);
	    
	    
	    	    
	    ModelAndView mav = new ModelAndView("notice/list");
	    mav.addObject("boardList", boardList);
	    mav.addObject("page_navi", page_navi);
	    mav.addObject("gameList", gameList);
	    mav.addObject("codeList", codeList);
	    
	    	   	    
	    return mav;
	}
	
	
		
	
	public ModelAndView getNoticeNationView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		//logger.info("getNewDevelopView ");

		
		int nn_seq = Integer.parseInt(request.getParameter("nn_seq"));
			
				
		    
	    //modelandview
	    List<NoticeInfo> boardList = noticeInfoDao.getNoticeNationView(nn_seq);
	    
	    
	    
	    
	    ModelAndView mav = new ModelAndView("notice/view");
	    mav.addObject("boardList", boardList);
	    	    
	    	   	    
	    return mav;
	}
	
	public ModelAndView getNoticeWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//logger.info("getNewDevelopWrite 호출합니다.");
		
		
		
		int game_seq = Integer.parseInt(request.getParameter("game_seq"));
		int n_seq = (request.getParameter("n_seq")!=null)? Integer.parseInt(request.getParameter("n_seq")) : 0; 
		String search_mode = (request.getParameter("search_mode")!=null)? request.getParameter("search_mode") : "";
		String search_str = (request.getParameter("search_str")!=null)? request.getParameter("search_str") : "";
		int go_page = (request.getParameter("go_page")!=null)? Integer.parseInt(request.getParameter("go_page")) : 1;
		String kind_code = (request.getParameter("kind_code")!=null)? request.getParameter("kind_code") : "";
		String equip_code = (request.getParameter("equip_code")!=null)? request.getParameter("equip_code") : "";
		
		
		List<Common> codeList = commonDao.getCode("NKC");
		    
	    //modelandview
	    List<NoticeInfo> boardList = noticeInfoDao.getNoticeNationList(n_seq);
	    
	    //modelandview
	    List<NoticeInfo> nviewList = noticeInfoDao.getNoticeView(n_seq);
	    
	    
	    request.setAttribute("game_seq", game_seq);
	    request.setAttribute("n_seq", n_seq);
	    request.setAttribute("search_mode", search_mode);
	    request.setAttribute("search_str", search_str);	    
	    request.setAttribute("go_page", go_page);
	    request.setAttribute("equip_code", equip_code);
	    request.setAttribute("kind_code", kind_code);
	        
	    
	    //view finder에게 보낸다.
	    ModelAndView mav = new ModelAndView("notice/write");
	    mav.addObject("boardList", boardList);
	    mav.addObject("nviewList", nviewList);	    
	    mav.addObject("codeList", codeList);
	    
	    	    
	    return mav;
	}
	
	public ModelAndView insNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		request.setCharacterEncoding("UTF-8");
		
		int game_seq = Integer.parseInt(request.getParameter("game_seq"));
		int n_seq = (request.getParameter("n_seq")!=null)? Integer.parseInt(request.getParameter("n_seq")) : 0; 
		String search_mode = (request.getParameter("search_mode")!=null)? request.getParameter("search_mode") : "";
		String search_str = (request.getParameter("search_str")!=null)? request.getParameter("search_str") : "";
		int go_page = Integer.parseInt(request.getParameter("go_page"));
		
		
		NoticeInfo nd = new NoticeInfo();

		/* board 객체 Binding */
		bind(request, nd);
		nd.setN_seq(n_seq);
				
		if(n_seq!=0){
			int check_cnt=noticeInfoDao.checkNoticeNationCount(nd.getGame_seq(), nd.getN_seq(), nd.getNation_code());
						
			if(check_cnt>0){
				ModelAndView errormav = new ModelAndView("error");
				errormav.addObject("msg" ,"이미 등록된 언어 입니다. 다른언어를 선택해주세요");
				return errormav; 
			}
		}
		
		
		int result=noticeInfoDao.insNotice(nd);
		
		int tmp_seq=noticeInfoDao.getGNseq();
		
		
		
		//System.out.println(search_mode+"//"+search_str);
		
		request.setAttribute("game_seq", game_seq);
		request.setAttribute("n_seq", tmp_seq);
		request.setAttribute("search_mode", search_mode);
		request.setAttribute("search_str", search_str);	    
		request.setAttribute("go_page", go_page);
		
		
		ModelAndView mav = new ModelAndView("notice/write_ok");
		mav.addObject("insertResult" ,result );
		
		
		
		return mav;
	}
	
	public ModelAndView getNoticeModify(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//logger.info("getNewDevelopWrite 호출합니다.");
		
		
		
		int nn_seq = Integer.parseInt(request.getParameter("nn_seq"));
				
		 //modelandview
	    List<NoticeInfo> boardList = noticeInfoDao.getNoticeNationView(nn_seq);
	   	    	    
	    
	    request.setAttribute("nn_seq", nn_seq);
	       
	    
	    //view finder에게 보낸다.
	    ModelAndView mav = new ModelAndView("notice/modify");
	    mav.addObject("boardList", boardList);	    
	    
	    	    
	    return mav;
	}
	
	public ModelAndView uptNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		request.setCharacterEncoding("UTF-8");

		
						
		
		NoticeInfo nd = new NoticeInfo();

		/* board 객체 Binding */
		bind(request, nd);
		
				
		int result=noticeInfoDao.uptNotice(nd);
		
		
		//System.out.println(search_mode+"//"+search_str);
		
		request.setAttribute("nn_seq", nd.getNn_seq());
				
		
		ModelAndView mav = new ModelAndView("notice/modify_ok");
		mav.addObject("insertResult" ,result );
		
		
		
		return mav;
	}
	
	
	public ModelAndView delNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		request.setCharacterEncoding("UTF-8");

		int nn_seq=Integer.parseInt(request.getParameter("nn_seq"));		
				
		int result=noticeInfoDao.delNotice(nn_seq);
		
						
		
		ModelAndView mav = new ModelAndView("notice/del_ok");
		mav.addObject("insertResult" ,result );
		
			
		return mav;
	}
	
	
	public ModelAndView mainDelNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		request.setCharacterEncoding("UTF-8");

		int n_seq=Integer.parseInt(request.getParameter("n_seq"));		
				
		int result=noticeInfoDao.delMainNotice(n_seq);
		
						
		
		ModelAndView mav = new ModelAndView("notice/listdel_ok");
		mav.addObject("insertResult" ,result );
		
			
		return mav;
	}
	
	
	public ModelAndView uptNoticeView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		request.setCharacterEncoding("UTF-8");

		NoticeInfo nd = new NoticeInfo();

		int n_seq=Integer.parseInt(request.getParameter("n_seq"));
		String view_yn=request.getParameter("view_yn");
				
		int result=noticeInfoDao.uptNoticeView(n_seq, view_yn);
		
						
		
		ModelAndView mav = new ModelAndView("notice/view_yn_ok");
		mav.addObject("insertResult" ,result );
		
		
		
		return mav;
	}
}
