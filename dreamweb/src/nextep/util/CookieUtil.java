package nextep.util;

public class CookieUtil {
    public static void setCookie(javax.servlet.http.HttpServletResponse response, String name, String value) throws Exception
    {
        value = java.net.URLEncoder.encode(value,"MS949");
        javax.servlet.http.Cookie cookie = new javax.servlet.http.Cookie(name, value);
		cookie.setPath("/");
        //cookie.setMaxAge(60*60*24*3000);
        response.addCookie(cookie);
    }
    
    public static void setCookie(javax.servlet.http.HttpServletResponse response, String name, String value,String uri) throws Exception
    {
        value = java.net.URLEncoder.encode(value,"MS949");
        javax.servlet.http.Cookie cookie = new javax.servlet.http.Cookie(name, value);
        cookie.setPath("/");
		cookie.setPath(uri);
        //cookie.setMaxAge(60*60*24*3000);
        response.addCookie(cookie);
    }
    
    public static String getCookie(javax.servlet.http.HttpServletRequest request, String cookieName) 
    {
        javax.servlet.http.Cookie [] cookies = request.getCookies();
        String value = "";        
		try
		{		
			for(int i=0;i<cookies.length;i++) {
				if(cookieName.equals(cookies[i].getName())) {
					value = java.net.URLDecoder.decode(cookies[i].getValue(),"MS949");
					break;
				}
			}
		}
		catch (Exception e)
		{
			value = "";
		}
        return value;
    }
}