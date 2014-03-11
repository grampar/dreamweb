package nextep.noticeinfo;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface NoticeInfoDao {
	public List<NoticeInfo> getGameCodeList() throws DataAccessException;
	
	public int getNoticeCount(int game_seq, String search_mode, String search_str, String equip_code, String kind_code) throws DataAccessException;
	
	public List<NoticeInfo> getNoticeList(int game_seq, int start_num, int end_num, int record_scale, int go_page, String search_mode, String search_str, 
			String equip_code, String kind_code) 
	throws DataAccessException;
	
	public List<NoticeInfo> getNoticeView(int n_seq) throws DataAccessException;
	
	public List<NoticeInfo> getNoticeNationList(int n_seq) throws DataAccessException;
	
	public List<NoticeInfo> getNoticeNationView(int nn_seq) throws DataAccessException;
	
	public int checkNoticeNationCount(int game_seq, int n_seq, String nation_code) throws DataAccessException;
	
	public int getGNseq();
	
	public int insNotice(NoticeInfo nd) throws DataAccessException, Exception;
	
	public int uptNotice(NoticeInfo nd) throws DataAccessException, Exception;
	
	public int delMainNotice(int n_seq) throws DataAccessException, Exception;
	
	public int delNotice(int nn_seq) throws DataAccessException, Exception;
	
	public int uptNoticeView(int n_seq, String view_yn) throws DataAccessException, Exception;
}
