package nextep.testlogin;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;


import org.springframework.validation.Errors;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;




/* SimpleFormController클래스는 속성으로 successView, formView를 가지고 있기 때문에
 * 폼데이터 검증에 성공하면 successView로 등록된 JSP를 이용하여 성공 메시지출력할 수 있고, 
 * 검증에 실패하면 formView로 등록된  JSP를 출력하여 다시 폼을 보여 줄 수 있다.
 * 폼 검증에 성공할 시에는 onSubmit()에서 정상적으로 ModelAndView객체를 리턴해 주면 되고,
 * 폼 검증에 실패시에는 onSubmit()에서 showForm()을 호출하여 리턴된 ModelAndView객체(formView가 설정됨)
 * 를 다시 리턴하면 폼이 다시 출력된다.
 * showForm()메소드는 referenceData()를 호출하여 폼을 구성하는 콤보박스등에서 사용될 리스트를 준비하는 
 * 용도로 자주 사용된다.
*/
public class LoginFormController extends SimpleFormController {
	 
	/*회원인증을 위해 개발자가 정의한 클래스*/
	private Authenticator authenticator;
	 
	 /*DI용 메소드*/
	public void setAuthenticator(Authenticator authenticator) {
		this.authenticator = authenticator;
	}

	public LoginFormController(){		 
		 setCommandClass(Login.class);
		 setCommandName("login");		 
	}
	 
	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		
		if(!this.isFormSubmission(request)){ // GET방식일 경우...
			System.out.println("formBackingObject()-GET");
			Login cmd = new Login();
			cmd.setAdmin_id("6자이상 영문");
			cmd.setAdmin_pwd("영문, 숫자 혼용 6자이상");
			return cmd;
		}else{ // POST방식일 경우
			System.out.println("formBackingObject()-POST");
			return super.formBackingObject(request);
		}
	}

 
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors)
	throws Exception {
 
		System.out.println("onSubmit()");
		Login lo = (Login) command;
		try{
			/* DB와 연동하여 회원인증을 실행하고 인증에 실패하면 아래의 메소드는 Exception을 발생하도록 되어있다*/
			 
			authenticator.authenticate(lo.getAdmin_id(), lo.getAdmin_pwd(), errors);
   
			ModelAndView mav = new ModelAndView();
			mav.setViewName(getSuccessView());
			mav.addAllObjects(errors.getModel());
			return mav; 
			// 회원인증에 성공하면 successView가 화면에 출력된다
			/*위에서 리턴한 데이터는 successView에서 접근할 수가 있다.
			* successView에서 커맨드객체에 접근하려면 설정파일에 등록한 "commandName"속성의 값을 이용하면 된다.
			* 즉, request.getAttribute("loginCommand"), ${loginCommand.id}등을 사용하면 된다.
			*/
		}catch(Exception e){
			System.out.println("catch()");
		}
		return showForm(request, response, errors);//회원인증에 실패시 formView가 화면에 출력된다.
	}
	/*
	* (non-Javadoc)
	* @see org.springframework.web.servlet.mvc.SimpleFormController#referenceData(javax.servlet.http.HttpServletRequest)
	* showForm() 메소드는 referenceData()를 호출해서 폼 페이지에서 보여주고자 하는 참조 데이터(주로 셀렉트박스, 체크박스 같은 유형)를 ModelAndView에 저장한다.
	* formView에서는 Model 데이터를 바탕으로 폼에 필요한 데이터를 채워서 표시한다.
	*/
	
	/*
	@Override
	protected Map referenceData(HttpServletRequest request, Object command, Errors errors) throws Exception {
		
		System.out.println("referenceData()");
		
		List<String> course = new ArrayList<String>();
		course.add("Java Developer");
		course.add("Struts Programmer");
		course.add("Spring Professional");
		Map map = new HashMap();
		map.put("courses", course);
	  
		/* ObjectError, FieldError의 발생을 확인하고 Map에 추가하여 뷰에서 출력될 수 있도록 한다 
		List elist = errors.getAllErrors();
		System.out.println("에러수:"+elist.size());
		for(int i=0;i<elist.size();i++){
			String code = null;
			String message = null;
			if(elist.get(i) instanceof ObjectError){
				ObjectError oe = (ObjectError) elist.get(i);
				code = oe.getCode();
				message = oe.getDefaultMessage();
			}else if(elist.get(i) instanceof FieldError){
				FieldError fe = (FieldError) elist.get(i);
				code = fe.getCode();
				message = fe.getDefaultMessage();
			}
			System.out.println(code+":"+message);
			map.put(code, message);
		}
		return map;
	}
	*/
	
	/*
	  * (non-Javadoc)
	  * @see org.springframework.web.servlet.mvc.AbstractFormController#formBackingObject(javax.servlet.http.HttpServletRequest)
	  * formBackingObject()는 GET방식(폼 출력요청)이나 POST방식(폼 전송)을 가리지 않고 항상 실행되며,
	  * 커맨드객체를 생성하여 뷰에서 사용될 수 있도록 한다. 그러므로 개발자가 이 메소드를 오버라이드하여
	  * GET방식 요청일 경우에는  폼에서 디폴트로 채워져야 하는 필드의 기본 데이터를 준비하는 용도로 사용하면 되고,
	  * POST방식(폼을 전송한 경우)일 경우에는 커맨드클래스의 객체를 생성하여 리턴해주면  된다.
	  * 이 메소드에서 리턴된 데이터를 뷰에서 사용하려면 설정파일에 등록한 "commandName" 속성의 값을 key로 사용하면 된다.
	  * 즉, request.getAttribute("loginCommand")라고 하거나, ${loginCommand.id}등을 사용하면 된다.
	 */
	
	



}



