package nextep.develop;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;



import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class NewDevelopDaoImpl extends SqlMapClientDaoSupport implements NewDevelopDao {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	
	@Override
	public int getNewDevelopCount(String search_str) throws DataAccessException {
		// TODO Auto-generated method stub
						
			
		String sql_search="";
		
		int total_record=0;
		
		NewDevelop nd=new NewDevelop();	
		nd.setLogin_id(search_str);
				
		total_record=(Integer) getSqlMapClientTemplate().queryForObject("getDevCount", nd);
								
		return total_record;
	}

	@Override
	public List<NewDevelop> getNewDevelopList(int start_num, int end_num, int record_scale, int go_page, String search_str) throws DataAccessException {
		// TODO Auto-generated method stub
		
		
		String sql_search="";
		
		/*
		 100	CP등록, 200	CONTACT중, 300	CP사답변
		400	CONTACT보류, 500	CONTACT완료, 600	CONTACT거절 
		 */
		
		
				
		NewDevelop nd=new NewDevelop();		
		nd.setStart_num(start_num);		
		nd.setEnd_num(end_num);
		nd.setLogin_id(search_str);
		nd.setSearch_str(search_str);
		
		
		List<NewDevelop> boardList=null;
		
		
		boardList =  (List<NewDevelop>) getSqlMapClientTemplate().queryForList("getDevList", nd);
				
		
		
		return boardList;		
	}
	
	
	@Override
	public List<NewDevelop> getNewDevelopListExecl(String search_str) throws DataAccessException {
		// TODO Auto-generated method stub
		
		
				
		NewDevelop nd=new NewDevelop();		
		nd.setLogin_id(search_str);
				
		
		List<NewDevelop> boardList=null;		
		
		boardList =  (List<NewDevelop>) getSqlMapClientTemplate().queryForList("getDevListExecl", nd);				
		
		
		return boardList;		
	}

	@Override
	public List<NewDevelop> getNewDevelopView(String user_no) throws DataAccessException {
		// TODO Auto-generated method stub
		
		List<NewDevelop> boardList =  (List<NewDevelop>) getSqlMapClientTemplate().queryForList("getDevView", user_no);
		
		
		return boardList;
	}
	
	

}
