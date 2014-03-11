package nextep.testlogin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;


public class LoginDao extends SqlMapClientDaoSupport {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	
	public List<Login> getLoginAuth(String admin_id, String admin_pwd) throws DataAccessException {
		// TODO Auto-generated method stub
		
		//logger.info(" Dao - getPublishGameList ");	

		String sql_search="";
		
		Login lo=new Login();
		
		lo.setAdmin_id("admin_id");
		lo.setAdmin_pwd("admin_pwd");
				
		List<Login> boardList=new ArrayList<Login>();
		
		boardList.add(lo);
			
		
		
		return boardList;		
	}
	
	
	
}
