package nextep;

import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class SimpleViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String contextPath = request.getContextPath();
		String uri = (String)request.getAttribute("javax.servlet.include.request_uri");
		logger.info("contextPath : " + contextPath);
		logger.info("uri : " + uri);


		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
		
		logger.info("URI : " + uri);
		
		if(logger.isDebugEnabled()) {
			logger.info("URI : " + uri);
			logger.info("ContectPath : " + contextPath);
		}

		int begin = 0;
		if(!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		if(logger.isDebugEnabled()) {
			logger.info("Begin : " + begin);
		}

		int end;
		if(uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if(uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String fileName = uri.substring(begin, end);
		if(fileName.indexOf(".") != -1) {
		        fileName = fileName.substring(0, fileName.lastIndexOf("."));
		}


		// 
		if(fileName.lastIndexOf("/") != -1){
		        fileName = fileName.substring(fileName.lastIndexOf("/"), fileName.length());
		}

		logger.info("fileName.indexOf " + fileName.indexOf("/"));
		logger.info("fileName : " + fileName);

		for(Enumeration en = request.getParameterNames(); en.hasMoreElements();) {
			String attribute  = (String) en.nextElement();
			Object attributeValue = request.getParameter(attribute);
			
			logger.info("set Attribute in Request : " + attribute + " = " + attributeValue);
			
			if(logger.isDebugEnabled()) {
				logger.info("set Attribute in Request : " + attribute + " = " + attributeValue);
			}

			request.setAttribute(attribute, attributeValue);
		}
		
		System.out.println(fileName);
		

		return new ModelAndView(fileName);
	}
}
