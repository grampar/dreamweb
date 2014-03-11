package nextep.userxl;

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

public class UserxlDaoImpl extends SqlMapClientDaoSupport implements UserxlDao {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	
	@Override
	public int getUserxlCount(String search_str) throws DataAccessException {
		// TODO Auto-generated method stub
						
			
		String sql_search="";
		
		int total_record=0;
		
		Userxl nd=new Userxl();	
		nd.setLogin_id(search_str);
				
		total_record=(Integer) getSqlMapClientTemplate().queryForObject("getUserxlCount", nd);
								
		return total_record;
	}

	@Override
	public List<Userxl> getUserxlList(int start_num, int end_num, int record_scale, int go_page, String search_str) throws DataAccessException {
		// TODO Auto-generated method stub
		
		
		String sql_search="";
		
		/*
		 100	CP등록, 200	CONTACT중, 300	CP사답변
		400	CONTACT보류, 500	CONTACT완료, 600	CONTACT거절 
		 */
		
		
				
		Userxl nd=new Userxl();		
		nd.setStart_num(start_num);		
		nd.setEnd_num(end_num);
		nd.setLogin_id(search_str);
		nd.setSearch_str(search_str);
		
		
		List<Userxl> boardList=null;
		
		
		boardList =  (List<Userxl>) getSqlMapClientTemplate().queryForList("getUserxlList", nd);
				
		
		
		return boardList;		
	}
	
	
	@Override
	public List<Userxl> getUserxlListExecl(String search_str) throws DataAccessException {
		// TODO Auto-generated method stub
		
		
				
		Userxl nd=new Userxl();		
		nd.setLogin_id(search_str);
				
		
		List<Userxl> boardList=null;		
		
		boardList =  (List<Userxl>) getSqlMapClientTemplate().queryForList("getUserxlListExecl", nd);				
		
		
		return boardList;		
	}

	@Override
	public List<Userxl> getUserxlView(String user_no) throws DataAccessException {
		// TODO Auto-generated method stub
		
		List<Userxl> boardList =  (List<Userxl>) getSqlMapClientTemplate().queryForList("getUserxlView", user_no);
		
		
		return boardList;
	}
	
	

}
