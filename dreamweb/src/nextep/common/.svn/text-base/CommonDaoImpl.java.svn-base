package nextep.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class CommonDaoImpl extends SqlMapClientDaoSupport implements CommonDao {
	protected final Log logger = LogFactory.getLog(getClass());
		
	
	public List<Common> getCode(String grp_code) throws DataAccessException {			
		
		Common c=new Common();
		c.setGrp_code(grp_code);
		
		List<Common> boardList = (List<Common>) getSqlMapClientTemplate().queryForList("getCode", c);		
		return boardList;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Common> getNation(String gubun) throws DataAccessException {
		
		ArrayList<String> idxList=null;
		List<Common> boardList=null;
		
		if(gubun.equals("4")){
					
			String arylist="KR, US, JP,CN";
			
			HashMap<String, Object> idxMap = new HashMap<String, Object>() ;
			idxMap.put("nationcodeAry", arylist);
			
			
			boardList = getSqlMapClientTemplate().queryForList("getNation", idxMap);
		}else{
			String arylist="";		
			
			HashMap<String, Object> idxMap = new HashMap<String, Object>() ;
			idxMap.put("nationcodeAry", arylist);
			
			boardList = getSqlMapClientTemplate().queryForList("getNation", idxMap);
		}
		
		return boardList;
	}


	@Override
	public List<Common> getCP(String cp_no) throws DataAccessException {
		// TODO Auto-generated method stub
		Common c=new Common();
		c.setCp_no(cp_no);
		
		List<Common> boardList = (List<Common>) getSqlMapClientTemplate().queryForList("getCP", c);
		
		return boardList;
	}
}
