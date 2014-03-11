package nextep.common;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface CommonDao {
	
	public List<Common> getCode(String grp_code) throws DataAccessException;
	public List<Common> getNation(String gubun) throws DataAccessException;
	public List<Common> getCP(String cp_no) throws DataAccessException;
}
