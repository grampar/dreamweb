package nextep.gcm;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.android.gcm.server.Constants;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

public class GcmController extends MultiActionController {
	protected final Log logger = LogFactory.getLog(getClass());
	
	
	
	public ModelAndView putMsg(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		String str_msg=request.getParameter("msg");
		
		Sender sender = new Sender("AIzaSyBscei1SOhNun1aEX9f9_NuomwRZ32igik");  //구글 코드에서 발급받은 서버 키
		
		Message msg = new Message.Builder()
			.addData("msg", str_msg)  //데이터 추가
		    //.addData("bbb", "bbb")  //데이터 추가
		    .build();
		
		String regId="APA91bGUOpYIQwGLPbqliCb0jx73jWfpfj7HA7rXFoJyHLKMqYlWQ73RS3BthBri2_YXWoJmZChZwWs0pcM4t4oS5ZBMOGMYlyT0R3_aBIBoAaKf4Lf9rsBR9ctriZ-NTlr-LHiRdtVkbSWSv2lFHm7HPyqG9YKGZg";
		
		//푸시 전송. 파라미터는 푸시 내용, 보낼 단말의 id, 마지막은 잘 모르겠음 
		Result result = sender.send(msg, regId, 1);

		//결과 처리
		if(result.getMessageId() != null) {
			 //푸시 전송 성공
			 System.out.println("success");
			 System.out.println(result.getMessageId());
		}else {
			 String error = result.getErrorCodeName();   //에러 내용 받기

			 //에러 처리
			 if(Constants.ERROR_INTERNAL_SERVER_ERROR.equals(error)) {
				 //구글 푸시 서버 에러
				 System.out.println("aaaa");
			 }else {
				 System.out.println("bbb");
			 }
		         
		}
	    
	    
	    //modelandview
	    ModelAndView mav = new ModelAndView("gcm/result");
	    
	    
	    	   	    
	    return mav;
	}
	
	
	
}
