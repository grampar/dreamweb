package nextep.userxl;

import java.util.List;

import nextep.develop.NewDevelop;
import nextep.develop.NewDevelopDao;
import nextep.util.Today;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;

public class UserxlServiceImpl implements UserxlService {
	
	protected final Log logger = LogFactory.getLog(getClass());

	private UserxlDao userxlDao;

	public void setUserxlDao(UserxlDao userxlDao){
		this.userxlDao = userxlDao;
	}
	
	@Override
	public int getUserxlCount(String search_str) throws DataAccessException {
		// TODO Auto-generated method stub
		
		
		int total_record = userxlDao.getUserxlCount(search_str);
		
		
		return total_record;
	}

	@Override
	public List<Userxl> getUserxlList(int start_num, int end_num, int record_scale, int go_page, String search_str)
			throws DataAccessException {
		
		
		List<Userxl> boardList = null;
		
		boardList = userxlDao.getUserxlList(start_num, end_num, record_scale, go_page, search_str);
	

		return boardList;
	}
	
	@Override
	public List<Userxl> getUserxlListExecl(String search_str) throws DataAccessException {
		
		
		List<Userxl> boardList = null;
		
		boardList = userxlDao.getUserxlListExecl(search_str);
		

		return boardList;
	}

	@Override
	public List<Userxl> getUserxlView(String user_no)
			throws DataAccessException {
		// TODO Auto-generated method stub
		
		
		List<Userxl> boardList = null;
		
		boardList = userxlDao.getUserxlView(user_no);
		

		return boardList;
	}
	

}
