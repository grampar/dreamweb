package nextep.testlogin;


import org.springframework.validation.Validator;
import org.springframework.validation.Errors;



public class LoginCommandValidator implements Validator {
	
	
	private LoginDao loginDao;
 
	/*DI용 메소드*/
	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}
	
	public boolean supports(Class arg0) {
		
		if(Login.class.isAssignableFrom(arg0)) return true;
		
		return false;
	}
	 
	 /* SimpleFormController의 경우에는 validate()메소드에서 검증에 실패하여 
	  * 개발자가 errors 에 오류를 추가하면 onSubmit()를 실행하지 않고
	  * showForm(), referenceData()를 거쳐 formView를 화면에 출력한다.
	  * showForm()이 실행되면서 referenceData()를 호출하여 formView에 전달할 데이터를 준비한다.
	  * referenceData()는 Map객체를 showForm()에 리턴하여 formView에서 사용되도록 한다.
	  * (non-Javadoc)
	  * @see org.springframework.validation.Validator#validate(java.lang.Object, org.springframework.validation.Errors)
	  */
	 
	public void validate(Object arg0, Errors errors) {
		 System.out.println("validate()");
		 Login command = (Login) arg0;
		 String admin_id = command.getAdmin_id();
	 
		 if(admin_id==null || admin_id.equals("")) {
			 /* FieldError 추가 
			  * ObjectError를 추가하려면 errors.reject()를 이용하고,
			  * FieldError를 추가하려면 errors.rejectValue()를 이용한다*/
			 errors.rejectValue("id", "IDrequired", "아이디를 입력해 주세요");
			 System.out.println("id 검증실패");
		 }
		 
		 String pwd = command.getAdmin_pwd();
		 
		 if(pwd==null || pwd.equals("")) {
			/* FieldError 추가 */
			errors.rejectValue("pwd", "PWDrequired", "암호를 입력해 주세요");
			System.out.println("pwd 검증실패");
		 }
	 }

	

}



