package nextep.util;

import java.util.Date;
import java.util.Properties; 
import java.util.StringTokenizer;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class MailSender {
	
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	public MailSender(){
		
	}
	
	public boolean MailSend(String from, String to ,String cc, String title , String content){
		logger.info("MailSend 시작");
		
		boolean retVal=true;
		
		Properties properties = new Properties();
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.host", "211.237.44.60");
		properties.put("mail.smtp.port", "25");
					      
		  
		Session mailSession = Session.getInstance(properties);
		Message message = new MimeMessage(mailSession);
		
		
		
		try {
			
			message.setFrom(new InternetAddress(from)); //보내는 사람 설정
		      
			//InternetAddress[] address = {new InternetAddress(to)}; // 받는 이메일      
			InternetAddress[] address = makerecipients(to); // 받는 이메일
			message.setRecipients(Message.RecipientType.TO, address); //받는 사람설정
			  
			InternetAddress[] ccAddr = makerecipients(cc);  // 참조 메일 
			message.setRecipients(Message.RecipientType.CC, ccAddr);  //받는 사람설정(참조 메일 )
			  
			message.setSubject(title); //제목설정
			message.setSentDate(new Date()); //보내는 날짜 설정
			message.setContent(content,"text/html; charset=EUC-KR"); //내용 설정(MIME 지정-HTML 형식)
			  
			Transport.send(message); //메일 보내기

			
			
		} catch (AddressException e) {
			e.printStackTrace();
			retVal=false;
		} catch (MessagingException e) {
			e.printStackTrace();
			retVal=false;			
		}
		
		return retVal;
	}
	
	public static InternetAddress[] makerecipients(String addrs) throws AddressException{
		StringTokenizer toker;
		String delim = "";   //구분자 
		InternetAddress[] addr = null;
		   
		if(addrs != null){   //참조 주소가 있을때 
			
			if(addrs.indexOf(",") != - 1){   // 참조메일을 , 로 구분했으면...
				delim = ",";
			}else if(addrs.indexOf(";") != -1){  // 참조메일을 ; 로 구분했으면...
				delim = ";";
			}
			    
			toker = new StringTokenizer(addrs ,delim);    // ,나 ;로  이메일주소 구분하여 토크나이져로 분리
			int count  = toker.countTokens();      // 참조 이메일 카운트
			addr = new InternetAddress[count];      
			int i = 0;
			   
			while(toker.hasMoreTokens()){				
				addr[i++] = new InternetAddress(toker.nextToken().trim());
			} //while   
			    
		} //if   
		return addr;
	}  

}
