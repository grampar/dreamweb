package nextep.game;

import java.util.List;

import nextep.noticeinfo.NoticeInfo;

import org.springframework.dao.DataAccessException;

public interface GameDao {
	
	
	public int getGameCount(Game game) throws DataAccessException;
	
	public List<Game> getGameList(Game game) throws DataAccessException;
	
	public List<Game> getGameView(Game game) throws DataAccessException;
	
	public List<Game> getGameLanList(Game game) throws DataAccessException;
	
	public List<Game> getGameLanView(Game game) throws DataAccessException;
	
	public int checkGameLanCount(Game game) throws DataAccessException;
	
	public int getGameSeq();
	
	public int insGame(Game game) throws DataAccessException, Exception;
	
	public int uptGame(Game game) throws DataAccessException, Exception;
	
	public int insGameLan(Game game) throws DataAccessException, Exception;
	
	public int uptGameLan(Game game) throws DataAccessException, Exception;
			
	public int delGameLan(Game game) throws DataAccessException, Exception;
	
	public List<Game> getGamePriceList(Game game) throws DataAccessException;
	
	public int insGamePrice(Game game) throws DataAccessException, Exception;
	
	public int uptGamePrice(Game game) throws DataAccessException, Exception;
	
	public int uptGamePriceEnd(Game game) throws DataAccessException, Exception;
	
	public List<Game> getGameImgList(Game game) throws DataAccessException;
	
	public int insGameImg(Game game) throws DataAccessException, Exception;
	
	public int delGameImg(Game game) throws DataAccessException, Exception;
	
}
