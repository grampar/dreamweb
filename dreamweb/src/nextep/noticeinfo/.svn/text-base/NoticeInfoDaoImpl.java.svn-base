package nextep.noticeinfo;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapClient;

public class NoticeInfoDaoImpl extends SqlMapClientDaoSupport implements NoticeInfoDao {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	public List<NoticeInfo> getGameCodeList() throws DataAccessException {
		// TODO Auto-generated method stub
		
		//logger.info(" Dao - getPublishGameList ");	

				
		List<NoticeInfo> boardList=null;		
		
		boardList =  (List<NoticeInfo>) getSqlMapClientTemplate().queryForList("getGameCode");
				
		
		
		return boardList;		
	}
	
	public int getNoticeCount(int game_seq, String search_mode, String search_str, String equip_code, String kind_code) throws DataAccessException {
		// TODO Auto-generated method stub
		
		//logger.info(" Dao - getNoticeCount 시작");				
			
		String sql_search="";
		
		int total_record=0;
		
		NoticeInfo nd=new NoticeInfo();	
		nd.setGame_seq(game_seq);
		nd.setSearch_mode(search_mode);
		nd.setSearch_str(search_str);
		nd.setEquip_code(equip_code);
		nd.setKind_code(kind_code);
		
				
		total_record=(Integer) getSqlMapClientTemplate().queryForObject("getNoticeCount", nd);
								
		return total_record;
	}

	
	public List<NoticeInfo> getNoticeList(int game_seq, int start_num, int end_num, int record_scale, int go_page, String search_mode, String search_str, 
			String equip_code, String kind_code) throws DataAccessException {
		// TODO Auto-generated method stub
		
		//logger.info(" Dao - getPublishGameList ");	

		String sql_search="";
		
				
		NoticeInfo nd=new NoticeInfo();
		nd.setGame_seq(game_seq);
		nd.setStart_num(start_num);		
		nd.setEnd_num(end_num);
		nd.setSearch_mode(search_mode);
		nd.setSearch_str(search_str);
		nd.setEquip_code(equip_code);
		nd.setKind_code(kind_code);
		
		
		List<NoticeInfo> boardList=null;
		
		
		boardList =  (List<NoticeInfo>) getSqlMapClientTemplate().queryForList("getNoticeList", nd);
				
		
		
		return boardList;		
	}
	
	public List<NoticeInfo> getNoticeView(int n_seq) throws DataAccessException {
		// TODO Auto-generated method stub
		
		//logger.info(" Dao - getPublishGameList ");	

		String sql_search="";
		
		
		List<NoticeInfo> boardList=null;
		
		
		boardList =  (List<NoticeInfo>) getSqlMapClientTemplate().queryForList("getNoticeView", n_seq);
				
		
		
		return boardList;		
	}
	
	
	public List<NoticeInfo> getNoticeNationList(int n_seq) throws DataAccessException {
		// TODO Auto-generated method stub
		
		//logger.info(" Dao - getPublishGameList ");	

		String sql_search="";
		
		
		List<NoticeInfo> boardList=null;
		
		System.out.println(n_seq);
		
		boardList =  (List<NoticeInfo>) getSqlMapClientTemplate().queryForList("getNoticeNationList", n_seq);
				
		
		
		return boardList;		
	}
	

	public List<NoticeInfo> getNoticeNationView(int nn_seq) throws DataAccessException {
		// TODO Auto-generated method stub
		
				
		List<NoticeInfo> boardList =  (List<NoticeInfo>) getSqlMapClientTemplate().queryForList("getNoticeNationView", nn_seq);
		
		
		return boardList;
	}
	
	
	public int checkNoticeNationCount(int game_seq, int n_seq, String nation_code) throws DataAccessException {
		// TODO Auto-generated method stub
		
		//logger.info(" Dao - getNoticeCount 시작");				
			
		String sql_search="";
		
		int check_cnt=0;
		
		NoticeInfo nd=new NoticeInfo();	
		nd.setGame_seq(game_seq);
		nd.setN_seq(n_seq);
		nd.setNation_code(nation_code);
				
				
		check_cnt=(Integer) getSqlMapClientTemplate().queryForObject("checkNoticeNationCount", nd);
								
		return check_cnt;
	}
	
	
	private int global_n_seq;
	public int getGNseq(){
		return this.global_n_seq;
	}
	
	public int insNotice(NoticeInfo nd) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient();
 
		

		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit
             
						
		try{
			sqlMapClient.startBatch();
			
			int n_seq=0;
			//처음 입력이라면....
			if(nd.getN_seq()==0){
				nd.setMain_title(nd.getTitle());
				
				n_seq=(Integer) sqlMapClient.queryForObject("getNseq", nd);			
			
				nd.setN_seq(n_seq);				
			
				sqlMapClient.insert("insertNotice", nd);
			}else{
				n_seq=nd.getN_seq();
			}
			
			this.global_n_seq=n_seq;
									
			// notic_nation 입력
			nd.setN_seq(n_seq);						
			sqlMapClient.insert("insertNoticeNation", nd);
				
				
			
						
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
		
	public int uptNotice(NoticeInfo nd) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient();
		

		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit
             
						
		try{
			sqlMapClient.startBatch();
			
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("title", nd.getTitle());
			map.put("cmnt", nd.getCmnt());
			map.put("nn_seq", nd.getNn_seq());
			
			System.out.println("nn_seq:"+map.get("nn_seq"));
						
			sqlMapClient.update("uptNoticeNation", map);			
			
				
						
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
	
	public int delMainNotice(int n_seq) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient();
		

		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit
             
						
		try{
			sqlMapClient.startBatch();
			
						
			sqlMapClient.delete("delMainNotice", n_seq);
			
			sqlMapClient.delete("delMainNoticeNation", n_seq);			
							
						
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
	
	
	public int delNotice(int nn_seq) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient();
		

		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit
             
						
		try{
			sqlMapClient.startBatch();
			
						
									
			sqlMapClient.delete("delNoticeNation", nn_seq);			
							
						
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
	
	public int uptNoticeView(int n_seq, String view_yn) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient();
		

		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit
             
						
		try{
			sqlMapClient.startBatch();
			
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("view_yn", view_yn);
			map.put("n_seq", n_seq);
												
			sqlMapClient.update("uptNoticeView", map);			
							
						
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
