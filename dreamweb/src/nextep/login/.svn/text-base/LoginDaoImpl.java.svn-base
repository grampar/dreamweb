package nextep.login;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class LoginDaoImpl extends SqlMapClientDaoSupport implements LoginDao {
	protected final Log logger = LogFactory.getLog(getClass());
	
	public List<Login> getAdminInfo(Login l) throws DataAccessException {
		// TODO Auto-generated method stub
		
		//logger.info(" Dao - getPublishGameList ");	

				
		List<Login> boardList=null;		
		
		boardList =  (List<Login>) getSqlMapClientTemplate().queryForList("getLogin", l);
				
		
		
		return boardList;		
	}
}
