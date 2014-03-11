package nextep.develop;

import java.util.List;

import nextep.develop.NewDevelop;
import nextep.develop.NewDevelopDao;
import nextep.util.Today;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;

public class NewDevelopServiceImpl implements NewDevelopService {
	
	protected final Log logger = LogFactory.getLog(getClass());

	private NewDevelopDao newDevelopDao;

	public void setNewDevelopDao(NewDevelopDao newDevelopDao){
		this.newDevelopDao = newDevelopDao;
	}
	
	@Override
	public int getNewDevelopCount(String search_str) throws DataAccessException {
		// TODO Auto-generated method stub
		
		
		int total_record = newDevelopDao.getNewDevelopCount(search_str);
		
		
		return total_record;
	}

	@Override
	public List<NewDevelop> getNewDevelopList(int start_num, int end_num, int record_scale, int go_page, String search_str)
			throws DataAccessException {
		
		
		List<NewDevelop> boardList = null;
		
		boardList = newDevelopDao.getNewDevelopList(start_num, end_num, record_scale, go_page, search_str);
	

		return boardList;
	}
	
	@Override
	public List<NewDevelop> getNewDevelopListExecl(String search_str) throws DataAccessException {
		
		
		List<NewDevelop> boardList = null;
		
		boardList = newDevelopDao.getNewDevelopListExecl(search_str);
		

		return boardList;
	}

	@Override
	public List<NewDevelop> getNewDevelopView(String user_no)
			throws DataAccessException {
		// TODO Auto-generated method stub
		
		
		List<NewDevelop> boardList = null;
		
		boardList = newDevelopDao.getNewDevelopView(user_no);
		

		return boardList;
	}
	

}
