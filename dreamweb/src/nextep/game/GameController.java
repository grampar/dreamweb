package nextep.game;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nextep.common.Common;
import nextep.common.CommonDao;
import nextep.util.CommonUtil;
import nextep.util.Today;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class GameController extends MultiActionController {
	protected final Log logger = LogFactory.getLog(getClass());
	
	private GameDao gameDao;
	private CommonDao commonDao;
	private File uploadDir;
	
	public void setGameDao(GameDao gameDao){
		this.gameDao = gameDao;
	}
	
	public void setCommonDao(CommonDao commonDao){
		this.commonDao = commonDao;
	}
	
	
	public void setUploadDir(File uploadDir){
		this.uploadDir=uploadDir;
	}
	
	public ModelAndView getGameList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		
		
		String search_str = (request.getParameter("search_str")!=null)? request.getParameter("search_str") : "";
		String cp_no = (request.getParameter("cp_no")!=null)? request.getParameter("cp_no") : "";
		int go_page = (request.getParameter("go_page")!=null)? Integer.parseInt(request.getParameter("go_page")) : 1;
				

		int record_scale = 20;
		int page_scale = 10;

		String search = "&search_str="+search_str+"&cp_no=" + cp_no;
		String gurl="";
		
		Game game=new Game();
		game.setSearch_str(search_str);
		game.setCp_no(cp_no);
				
		//total count
	    int total_record = gameDao.getGameCount(game);
	    
	    
		int totalpage = (int)Math.ceil((double)total_record / (double)record_scale);
		if (totalpage>0 && totalpage < go_page) 
			go_page = totalpage;

		int start_num = (go_page - 1) * record_scale + 1;
		int end_num = start_num + record_scale - 1;		
		
		game.setSearch_str(search_str);
		game.setCp_no(cp_no);
		game.setStart_num(start_num);
		game.setEnd_num(end_num);
		
		
	    List<Game> boardList = gameDao.getGameList(game);	    
	    String page_navi=CommonUtil.getPage(total_record, record_scale, page_scale, go_page, search, gurl);
	    
	    List<Common> cpList=commonDao.getCP("");
	    
	    
	    request.setAttribute("search_str", search_str);	    
	    request.setAttribute("go_page", go_page);
	    request.setAttribute("cp_no", cp_no);
	    
	    
	    //modelandview
	    ModelAndView mav = new ModelAndView("game/list");
	    mav.addObject("boardList", boardList);
	    mav.addObject("page_navi", page_navi);
	    mav.addObject("cpList", cpList);
	    
	    
	    	   	    
	    return mav;
	}
	
	
	public ModelAndView getGameWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//logger.info("getNewDevelopWrite 호출합니다.");
		
		
		
		String cp_no="";
		List<Common> cpList = commonDao.getCP(cp_no);
		
		List<Common> genreList = commonDao.getCode("GEC");
		
		List<Common> gradeList = commonDao.getCode("GRC");
		
	
	    
	    //view finder에게 보낸다.
	    ModelAndView mav = new ModelAndView("game/write");
	    mav.addObject("cpList", cpList);
	    mav.addObject("genreList", genreList);	    
	    mav.addObject("gradeList", gradeList);
	    
	    	    
	    return mav;
	}
	
	public ModelAndView insGame(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		Game game= new Game();

		/* board 객체 Binding */
		bind(request, game);
		
		String fee_yn=(String)request.getParameter("fee_yn");
		String recom_yn=(String)request.getParameter("recom_yn");
				
		if(fee_yn==null || fee_yn.equals("")){
			game.setFee_yn("N");
		}
		
		if(recom_yn==null || recom_yn.equals("")){
			game.setRecom_yn("N");
		}
		
		int game_seq=gameDao.getGameSeq();
		game.setGame_seq(game_seq);
		
		
		int result=gameDao.insGame(game);
		
		System.out.println("result:"+result);
		
		ModelAndView mav = new ModelAndView("game/write_ok");
		mav.addObject("insertResult" ,result );
				
		return mav;
	}
	
	
	public ModelAndView insGameLan(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		Game game= new Game();

		/* board 객체 Binding */
		bind(request, game);
		
		int check_cnt=gameDao.checkGameLanCount(game);
		if(check_cnt>0){
			ModelAndView mav1 = new ModelAndView("error_iframe");
			mav1.addObject("msg" ,"이미 등록된 언어입니다.");
			
			return mav1;
		}
		
		
		int result=gameDao.insGameLan(game);
		
		System.out.println("result:"+result);
		
		ModelAndView mav = new ModelAndView("game/modify_ok");
		mav.addObject("insertResult" ,result );
				
		return mav;
	}
	
	public ModelAndView getGameModofy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//logger.info("getNewDevelopWrite 호출합니다.");
		
		
		int game_seq=(request.getParameter("game_seq")==null)? 0: Integer.parseInt(request.getParameter("game_seq"));
		int go_page=(request.getParameter("go_page")==null)? 1: Integer.parseInt(request.getParameter("go_page"));
		String search_str=(request.getParameter("search_str")==null)? "": request.getParameter("search_str");
		String cp_no=(request.getParameter("cp_no")==null)? "": request.getParameter("cp_no");
		
		
		List<Common> cpList = commonDao.getCP("");		
		List<Common> genreList = commonDao.getCode("GEC");		
		List<Common> gradeList = commonDao.getCode("GRC");
		List<Common> saleList = commonDao.getCode("SAC");
		List<Common> marketList = commonDao.getCode("MAC");
				
		Game game=new Game();		
		game.setGame_seq(game_seq);
		
		List<Game> gameView=gameDao.getGameView(game);
		List<Game> gamelanList=gameDao.getGameLanList(game);
		List<Game> gamePriceList=gameDao.getGamePriceList(game);
		
		
		request.setAttribute("search_str", search_str);	    
		request.setAttribute("go_page", go_page);
		request.setAttribute("cp_no", cp_no);
		request.setAttribute("game_seq", game_seq);
	    
	    //view finder에게 보낸다.
	    ModelAndView mav = new ModelAndView("game/modify");
	    mav.addObject("cpList", cpList);
	    mav.addObject("genreList", genreList);	    
	    mav.addObject("gradeList", gradeList);
	    mav.addObject("gamelanList", gamelanList);
	    mav.addObject("gameView", gameView);
	    mav.addObject("saleList", saleList);
	    mav.addObject("gamePriceList", gamePriceList);
	    mav.addObject("marketList", marketList);
	    
	    
	    	    	    
	    return mav;
	}
	
	public ModelAndView uptGame(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		Game game= new Game();

		/* board 객체 Binding */
		bind(request, game);
		
		String fee_yn=(String)request.getParameter("fee_yn");
		String recom_yn=(String)request.getParameter("recom_yn");
				
		if(fee_yn==null || fee_yn.equals("")){
			game.setFee_yn("N");
		}
		
		if(recom_yn==null || recom_yn.equals("")){
			game.setRecom_yn("N");
		}
		
				
		
		int result=gameDao.uptGame(game);
		
		
		ModelAndView mav = new ModelAndView("game/modify_ok");
		mav.addObject("insertResult" ,result );
				
		return mav;
	}
	
	public ModelAndView getGameLan(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//logger.info("getNewDevelopWrite 호출합니다.");
		
		int gl_seq=Integer.parseInt(request.getParameter("gl_seq"));
		
		
		Game game=new Game();
		game.setGl_seq(gl_seq);
		List<Game> gameLanView=gameDao.getGameLanView(game);
		System.out.println(gl_seq);
		
		
		request.setAttribute("gl_seq", gl_seq);	  
	    
	    //view finder에게 보낸다.
	    ModelAndView mav = new ModelAndView("game/modify_lan");
	    mav.addObject("gameLanView", gameLanView);
	    	    
	    	    
	    return mav;
	}
	
	public ModelAndView uptGameLan(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		Game game= new Game();

		/* board 객체 Binding */
		bind(request, game);
						
		
		int result=gameDao.uptGameLan(game);
		
		
		ModelAndView mav = new ModelAndView("game/modify_lan_ok");
		mav.addObject("insertResult" ,result );
				
		return mav;
	}
	
	public ModelAndView delGameLan(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		Game game= new Game();

		/* board 객체 Binding */
		bind(request, game);
		
		
		int result=gameDao.delGameLan(game);
		
		
		ModelAndView mav = new ModelAndView("game/del_lan_ok");
		mav.addObject("insertResult" ,result );
				
		return mav;
	}
		
	
	public ModelAndView insGameImageUpload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		request.setCharacterEncoding("UTF-8");
		
		String resultMessage="";
		
		response.setContentType("text/plain");
		
		if(!(request instanceof MultipartHttpServletRequest)){
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Expected mutipart request");
			return null;
		}
		
		MultipartHttpServletRequest multipartRequest=(MultipartHttpServletRequest) request;
		MultipartFile imgFile=multipartRequest.getFile("imgfile");
		
		String gubun=(String)multipartRequest.getParameter("gubun");
		
		
		
		
		final String imgFileName=imgFile.getOriginalFilename().trim();
		
		System.out.println(uploadDir.getAbsolutePath());
		String filePath=uploadDir.getAbsolutePath()  ;
		
		
		
		//용량체크
		long fileSize=imgFile.getSize();
		if(fileSize>204800000 || fileSize<0){
			resultMessage="2MB 이상의 파일은 업로드 할 수 없습니다.";
		}
		
		System.out.println(fileSize);
		
		
		//확장자 체크
		int pathPoint=imgFileName.lastIndexOf(".");
		String filePoint=imgFileName.substring(pathPoint+1, imgFileName.length());
		String fileType=filePoint.toLowerCase();
		
		if(!fileType.equals("png")){
			resultMessage="png 이미지만 업로드 할실 수 있습니다.";
		}
		
		ModelAndView mv=null;
		if(resultMessage.equals("")){
			Today tday=new Today();
					
			String sub_file_path="game_info"+File.separator+tday.getYear()+File.separator+tday.getMonth()+File.separator+tday.getDay()+File.separator;
			
			File f=new File(filePath+File.separator+sub_file_path);
			if(!f.exists()){
				f.mkdirs();
			}
			UUID uid = new UUID(1,1);
			
			String finalFnm=sub_file_path+uid.randomUUID().toString()+"."+fileType;
			
			
			System.out.println(finalFnm);
			
			imgFile.transferTo(new File(filePath+File.separator+finalFnm));
			
			mv=new ModelAndView("game/file_upload_ok");
			mv.addObject("file_nm", finalFnm.replace("\\", "/"));		
			mv.addObject("gubun", gubun);
			mv.addObject("resultMessage", resultMessage);
		}else{
			mv=new ModelAndView("game/file_upload_ok");
			mv.addObject("file_nm", "");		
			mv.addObject("gubun", gubun);
			mv.addObject("resultMessage", resultMessage);
		}
		
	    	   	    
	    return mv;
	}
	
	public ModelAndView insGamePrice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		Game game= new Game();

		/* board 객체 Binding */
		bind(request, game);
						
		
		int result=gameDao.insGamePrice(game);
		
		
		ModelAndView mav = new ModelAndView("game/modify_ok");
		mav.addObject("insertResult" ,result );
				
		return mav;
	}
	
	public ModelAndView uptGamePrice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		Game game= new Game();

		/* board 객체 Binding */
		bind(request, game);
				
		int result=gameDao.uptGamePrice(game);
		
		
		ModelAndView mav = new ModelAndView("game/modify_ok");
		mav.addObject("insertResult" ,result );
				
		return mav;
	}
	
	public ModelAndView uptGamePriceEnd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		Game game= new Game();

		/* board 객체 Binding */
		bind(request, game);
						
		
		int result=gameDao.uptGamePriceEnd(game);
		
		
		ModelAndView mav = new ModelAndView("game/modify_ok");
		mav.addObject("insertResult" ,result );
				
		return mav;
	}
	
	public ModelAndView getGameImgList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
				
				
		int game_seq = Integer.parseInt(request.getParameter("game_seq"));
						
		Game game=new Game();
		game.setGame_seq(game_seq);
				
		
	    List<Game> boardList = gameDao.getGameImgList(game);	    
	    	    
	    List<Common> typeList = commonDao.getCode("TYC");		
	    
	    	    
	    request.setAttribute("game_seq", game_seq);
	    
	    //modelandview
	    ModelAndView mav = new ModelAndView("game/img_list");
	    mav.addObject("boardList", boardList);
	    mav.addObject("typeList", typeList);
	    	    
	    
	    	   	    
	    return mav;
	}
	
	
	public ModelAndView insGameImgUpload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		request.setCharacterEncoding("UTF-8");
		
		String resultMessage="";
		
		response.setContentType("text/plain");
		
		if(!(request instanceof MultipartHttpServletRequest)){
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Expected mutipart request");
			return null;
		}
		
		MultipartHttpServletRequest multipartRequest=(MultipartHttpServletRequest) request;
		MultipartFile imgFile=multipartRequest.getFile("img_file");
		
		String type_code=(String)multipartRequest.getParameter("type_code");
		int game_seq=Integer.parseInt(multipartRequest.getParameter("game_seq"));
		
		
		final String imgFileName=imgFile.getOriginalFilename().trim();
		
		
		String filePath=uploadDir.getAbsolutePath()  ;
		
		
		
		//용량체크
		long fileSize=imgFile.getSize();
		if(fileSize>20480 || fileSize<0){
			resultMessage="2MB 이상의 파일은 업로드 할 수 없습니다.";
		}
		
		
		//확장자 체크
		int pathPoint=imgFileName.lastIndexOf(".");
		String filePoint=imgFileName.substring(pathPoint+1, imgFileName.length());
		String fileType=filePoint.toLowerCase();
		
		if(!fileType.equals("png")){
			resultMessage="png 이미지만 업로드 할실 수 있습니다.";
		}
		
		
		ModelAndView mv=null;
		
		if(resultMessage.equals("")){
			
			
			
			String sub_file_path="game_img"+File.separator+String.valueOf(game_seq)+File.separator;
			
			File f=new File(filePath+File.separator+sub_file_path);
			if(!f.exists()){
				f.mkdirs();
			}
			Today td=new Today();
			
			String real_file_nm=type_code+"_"+td.getCurrentTime()+"."+fileType;
			
			String finalFnm=sub_file_path+real_file_nm;
						
			imgFile.transferTo(new File(filePath+File.separator+finalFnm));
			
			Game game=new Game();
			
			game.setGame_seq(game_seq);
			game.setType_code(type_code);
			game.setFile_nm(real_file_nm);
			
			System.out.println(real_file_nm+"//"+game_seq);
			
			int result=gameDao.insGameImg(game);
			
			
			mv=new ModelAndView("game/img_write_ok");
			mv.addObject("result", result);
			mv.addObject("resultMessage", resultMessage);
		}else{
			
			System.out.println(resultMessage);
			
			mv=new ModelAndView("game/img_write_ok");
			mv.addObject("result", 1);
			mv.addObject("resultMessage", resultMessage);
		}
			    	   	    
	    return mv;
	}
	
	public ModelAndView delGameImg(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		Game game= new Game();

		/* board 객체 Binding */
		bind(request, game);
						
		
		int result=gameDao.delGameImg(game);
		
		
		ModelAndView mav = new ModelAndView("game/img_del");
		mav.addObject("insertResult" ,result );
				
		return mav;
	}
}
