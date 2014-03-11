package nextep.game;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;


import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapClient;

public class GameDaoImpl extends SqlMapClientDaoSupport implements GameDao {

	@Override
	public int getGameCount(Game game) throws DataAccessException {
		// TODO Auto-generated method stub
		
		
		int total_record=(Integer) getSqlMapClientTemplate().queryForObject("getGameCount", game);
		
		return total_record;
	}

	@Override
	public List<Game> getGameList(Game game) throws DataAccessException {
		// TODO Auto-generated method stub

		
		@SuppressWarnings("unchecked")
		List<Game> boardList= (List<Game>) getSqlMapClientTemplate().queryForList("getGAMEList", game);		
		
		return boardList;		
	}

	@Override
	public List<Game> getGameView(Game game) throws DataAccessException {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("unchecked")
		List<Game> boardList =  (List<Game>) getSqlMapClientTemplate().queryForList("getGameView", game.getGame_seq());
				
		
		return boardList;		
	}

	@Override
	public List<Game> getGameLanList(Game game) throws DataAccessException {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("unchecked")
		List<Game> boardList =  (List<Game>) getSqlMapClientTemplate().queryForList("getGameLanList", game.getGame_seq());
				
		
		return boardList;
	}

	@Override
	public List<Game> getGameLanView(Game game) throws DataAccessException {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("unchecked")
		List<Game> boardList =  (List<Game>) getSqlMapClientTemplate().queryForList("getGameLanView", game.getGl_seq());
		
		return boardList;
	}

	@Override
	public int checkGameLanCount(Game game) throws DataAccessException {
		// TODO Auto-generated method stub
		
		int check_cnt=(Integer) getSqlMapClientTemplate().queryForObject("checkGameLanCount", game);
		
		return check_cnt;
	}

	@Override
	public int getGameSeq() {
		// TODO Auto-generated method stub
		
		int game_seq=(Integer) getSqlMapClientTemplate().queryForObject("getGameSeq");
		
		return game_seq;
	}

	@Override
	public int insGame(Game game) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient(); 
		

		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit
             
						
		try{
			sqlMapClient.startBatch();
			
					
					
			sqlMapClient.insert("insGame", game);
			
			game.setNation_code("KR");
			sqlMapClient.insert("insGameLan", game);
				
			
						
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
	public int uptGame(Game game) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient(); 
		

		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit
             
						
		try{
			sqlMapClient.startBatch();					
			
			
			HashMap<String, String> map=new HashMap<String, String>();
			map.put("release_date", game.getRelease_date());
			map.put("cp_no", game.getCp_no());
			map.put("fee_yn", game.getFee_yn());
			map.put("android_requirement", game.getAndroid_requirement());
			map.put("ios_requirement", game.getIos_requirement());
			map.put("game_size", game.getGame_size());
			map.put("grade_code", game.getGrade_code());
			map.put("genre_code", game.getGenre_code());
			map.put("sale_code", game.getSale_code());
			map.put("game_seq", String.valueOf(game.getGame_seq()));
			map.put("movie_url", game.getMovie_url());
			map.put("recom_yn", game.getRecom_yn());
			
			
			sqlMapClient.insert("uptGame", map);
			
			
				
						
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
	public int insGameLan(Game game) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient(); 
		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit             
						
		try{
			sqlMapClient.startBatch();
			
			
			sqlMapClient.insert("insGameLan", game);			
				
						
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
	
	public int uptGameLan(Game game) throws DataAccessException, Exception{
		
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient(); 
		

		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit
             
						
		try{
			sqlMapClient.startBatch();					
			
				
			
			HashMap<String, String> map=new HashMap<String, String>();
			map.put("game_nm", game.getGame_nm());
			map.put("short_desc", game.getShort_desc());
			map.put("game_desc", game.getGame_desc());
			map.put("game_feather", game.getGame_feather());
			map.put("gl_seq", String.valueOf(game.getGl_seq()));
						
			
			sqlMapClient.insert("uptGameLan", map);
			
			
				
						
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
	public int delGameLan(Game game) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient(); 
		

		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit
             
						
		try{
			sqlMapClient.startBatch();					
						
			
			sqlMapClient.insert("delGameLan", game.getGl_seq());
							
						
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
	public List<Game> getGamePriceList(Game game) throws DataAccessException {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Game> boardList= (List<Game>) getSqlMapClientTemplate().queryForList("getGamePriceList", game.getGame_seq());		
		
		return boardList;		
	}

	@Override
	public int insGamePrice(Game game) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient(); 
		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit             
						
		try{
			sqlMapClient.startBatch();
			
			int price_seq=(Integer) getSqlMapClientTemplate().queryForObject("getPriceSeq", game.getGame_seq());
			
			
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("game_seq", game.getGame_seq());
			map.put("price_seq", price_seq);
			map.put("price", game.getPrice());
			map.put("market_url", game.getMarket_url());
			map.put("market_code", game.getMarket_code());
						
			
			sqlMapClient.insert("insGamePrice", map);			
				
						
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
	public int uptGamePrice(Game game) throws DataAccessException, Exception {
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
			map.put("price", game.getPrice());
			map.put("game_seq", game.getGame_seq());
			map.put("price_seq", game.getPrice_seq());
			map.put("market_url", game.getMarket_url());
			map.put("market_code", game.getMarket_code());
						
			
			sqlMapClient.insert("uptGamePrice", map);			
				
						
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
	public int uptGamePriceEnd(Game game) throws DataAccessException, Exception {
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
			map.put("game_seq", game.getGame_seq());
			map.put("price_seq", game.getPrice_seq());
						
			
			sqlMapClient.insert("uptGamePriceEnd", map);			
				
						
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
	public List<Game> getGameImgList(Game game) throws DataAccessException {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Game> boardList =  (List<Game>) getSqlMapClientTemplate().queryForList("getGameImgList", game.getGame_seq());
		
		return boardList;
	}

	@Override
	public int insGameImg(Game game) throws DataAccessException, Exception {
		// TODO Auto-generated method stub
		int retVal=0;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();		 
		SqlMapClient sqlMapClient = sqlTemplate.getSqlMapClient(); 
		sqlMapClient.startTransaction();//Transaction 시작		
		sqlMapClient.getCurrentConnection().setAutoCommit(false); //여기서 autoCommit설정을 변경해준다.!!!
		sqlMapClient.commitTransaction(); //autoCommit의 설정 Commit             
						
		try{
			sqlMapClient.startBatch();
			
			int img_seq =  (Integer) getSqlMapClientTemplate().queryForObject("getImgSeq", game.getGame_seq());
						
			HashMap<String, Object> map=new HashMap<String, Object>();
			
			map.put("game_seq", game.getGame_seq());
			map.put("img_seq", img_seq);
			map.put("type_code", game.getType_code());
			map.put("file_nm", game.getFile_nm());
						
			
			sqlMapClient.insert("insGameImg", map);			
				
						
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
	public int delGameImg(Game game) throws DataAccessException, Exception {
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
			map.put("game_seq", game.getGame_seq());
			map.put("img_seq", game.getImg_seq());
						
			
			sqlMapClient.insert("delGameImg", map);			
				
						
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
