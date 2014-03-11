package nextep.cp;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;


import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.ibatis.sqlmap.client.SqlMapClient;

public class CpDaoImpl extends SqlMapClientDaoSupport implements CpDao {

	@Override
	public int getCpCount(Cp c) throws DataAccessException {
		// TODO Auto-generated method stub
		
		int total_record=(Integer) getSqlMapClientTemplate().queryForObject("getCpCount", c);
		
		return total_record;
	}

	@Override
	public List<Cp> getCpList(Cp c) throws DataAccessException {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Cp> boardList= (List<Cp>) getSqlMapClientTemplate().queryForList("getCpList", c);		
		
		return boardList;		
	}

	@Override
	public List<Cp> getCpView(Cp c) throws DataAccessException {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Cp> boardList= (List<Cp>) getSqlMapClientTemplate().queryForList("getCpView", c.getCp_no());		
		
		return boardList;		
	}

	@Override
	public int insCp(Cp cp) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient(); 
		

		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit
             
						
		try{
			sqlMapClient.startBatch();
			
			String cp_no=(String) getSqlMapClientTemplate().queryForObject("getCpNo");
			cp.setCp_no(cp_no);
			
			sqlMapClient.insert("insCp", cp);
			
						
			sqlMapClient.executeBatch();			 
			sqlMapClient.commitTransaction();                         //Transaction Commit!! 
			sqlMapClient.getCurrentConnection().commit();       //connection Commit!!
		}catch(SQLException e){
			e.printStackTrace();
			retVal=1;
		} finally{
			sqlMapClient.endTransaction();         //트랜잭션 종료
		}	
		
		
		return retVal;
	}

	@Override
	public int uptCp(Cp cp) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient(); 
		

		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit
             
						
		try{
			sqlMapClient.startBatch();
					
					
			sqlMapClient.insert("uptCp", cp);
			
						
			sqlMapClient.executeBatch();			 
			sqlMapClient.commitTransaction();                         //Transaction Commit!! 
			sqlMapClient.getCurrentConnection().commit();       //connection Commit!!
		}catch(SQLException e){
			e.printStackTrace();
			retVal=1;
		} finally{
			sqlMapClient.endTransaction();         //트랜잭션 종료
		}	
		
		
		return retVal;
	}

	@Override
	public int delCp(Cp cp) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient(); 
		

		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit
             
						
		try{
			sqlMapClient.startBatch();
					
					
			sqlMapClient.insert("delCp", cp.getCp_no());
			
						
			sqlMapClient.executeBatch();			 
			sqlMapClient.commitTransaction();                         //Transaction Commit!! 
			sqlMapClient.getCurrentConnection().commit();       //connection Commit!!
		}catch(SQLException e){
			e.printStackTrace();
			retVal=1;
		} finally{
			sqlMapClient.endTransaction();         //트랜잭션 종료
		}	
		
		
		return retVal;
	}

	

	

}
