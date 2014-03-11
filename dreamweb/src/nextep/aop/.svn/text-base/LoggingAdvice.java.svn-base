package nextep.aop;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class LoggingAdvice implements MethodInterceptor {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		// TODO Auto-generated method stub
		String classname=invocation.getThis().getClass().getName();
		String methodName=invocation.getMethod().getName();
		
		
		//logger.info("[log]method: "+classname+"."+methodName+" start");
		
		if(logger.isDebugEnabled()){
			logger.info("[log]method: "+classname+"."+methodName+" start");
		}

		
		
		/*
		Object[] args=invocation.getArguments();
		if((args!=null) && (args.length>0)){
			for(int i=0;i<args.length;i++){
				System.out.println("argument["+i+"]:"+args[i]);
			}
		}
		*/
		
		
		
		//target class method 실행
		Object rtnObj=invocation.proceed();

		
		if(logger.isDebugEnabled()){
			logger.debug("[log]method: "+classname+"."+methodName+" end");
		}
		
		
		return rtnObj;
	}

}
