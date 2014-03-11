package nextep.testlogin;

import org.springframework.validation.BindException;
import java.util.Iterator;
import java.util.List;


public class Authenticator {
	
	/*회원인증을 위해 개발자가 정의한 클래스*/
	private LoginDao loginDao;
 
	/*DI용 메소드*/
	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}
	
	public void authenticate(String admin_id, String admin_pwd, BindException errors)throws Exception{
		
		
		System.out.println("authenticate()="+admin_id+"/"+admin_pwd);
		
		  
		try{
			List<Login> boardList = loginDao.getLoginAuth(admin_id, admin_pwd);
			Iterator<Login> ir=boardList.iterator();
			
		    if(!ir.hasNext()) {
		    	System.err.println("회원인증실패");
		    	/* ObjectError 추가 
		    	 * ObjectError를 추가하려면 errors.reject()를 이용하고,
		    	 * FieldError를 추가하려면 errors.rejectValue()를 이용한다*/
		    	
		    	
		    	errors.reject("loginFail", new Object[]{"로그인 실패"}, "ID, Password가 일치하지 않습니다");
		    	throw new Exception("회원인증 실패");
		    }
		    
		    System.out.println("Authenticate:회원인증성공");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
		   
		}
	}

}
