package nextep.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.RandomAccessFile;

public class CommonUtil {
	
	public static void logWrite(String msg,String nowhm){
		//파일로쓴다..
		RandomAccessFile raf=null;
		try{
			
			String line = ""; 
			raf = new RandomAccessFile("/pcallshot/www/reserve.log", "rw");
			raf.seek(raf.length());

			FileOutputStream writer = new FileOutputStream(raf.getFD());
			line = "\r\n" +"["+ nowhm + "]" +"-->" + msg +"\r\n";			
			writer.write(line.getBytes());
			raf.close();		
			
		}catch(Exception e){
			e.printStackTrace();	
		}
	}
	//태그 사용불가.
	public static String replaceCheck( String strArg )
	{	
		String returnValue = null;		
		
		returnValue = strArg.replaceAll( "<","&lt" );		
		returnValue = returnValue.replaceAll( ">","&gt;" );
		returnValue = returnValue.replaceAll( "\n","<br>" );
		returnValue = returnValue.replaceAll( "  ","&nbsp;&nbsp;" );
		
		return returnValue;	
	}

	public static String getByteCut(String str,int sz)
    {  
       if(str.equals("") || str.getBytes().length <= sz)
       {
            return str;
       }

       String a = str;
       int i = 0;
       String imsi = "";
       String rlt = "";
       imsi = a.substring(0,1);

       while(i < sz)
       {
           byte[] ar = imsi.getBytes();

           i += ar.length;

           rlt += imsi;
           a = a.substring(1);
           if(a.length() == 1)
           {
              imsi = a;
           }
           else if(a.length() > 1)
           {
              imsi = a.substring(0,1);
           }
       }
      return rlt+"..";
   }
	
	// 인자로 오는 문자열이 실제 내용이 있는지 검사
	public static boolean isEmpty( String arg )
	{
		if( arg == null )
			return true;
		if( arg.trim().equals("") )
			return true;
		
		return false;
	}
	
	// 인자로 들어오는 문자열을 정수형으로 반환한다. 
	// 실패하는 경우 기본값으로 반환하는 값이다. 
	public static int parseInt( String strArg , int defaultValue )
	{
		int returnValue;
		
		try{
			returnValue = Integer.parseInt( strArg.trim() );
		}
		catch( Exception e )
		{
			returnValue = defaultValue;
		}
		
		return returnValue;
	}
	// 인자로 들어오는 문자열을 long형으로 반환한다. 
	// 실패하는 경우 기본값으로 반환하는 값이다.	
	public static long parseLong( String strArg , long defaultValue )
	{
		long returnValue;
		
		try{
			returnValue = Long.parseLong( strArg.trim() );
		}
		catch( Exception e )
		{
			returnValue = defaultValue;
		}
		
		return returnValue;
	}	
	
	//숫자를 문자열로,
	public static String toString( int intArg , int figure )
	{
		StringBuffer returnValue = new StringBuffer();
		
		if( (intArg < 0 ) || (figure < 2) )
			return null;
			
		String tempStr = String.valueOf( intArg );	// 숫자의 문자열 형태
		int length = tempStr.length();			// 숫자의 원래길이
		
		if( length < figure )				// '0'으로 자리수를 채운다.
		{
			for( int i = length ; i < figure ; i++ )
				returnValue.append( "0" );			
		}
		
		returnValue.append( tempStr );
				
		return returnValue.toString();
	}
		
	//한글
	public static String makeKor(String s)throws java.io.UnsupportedEncodingException
	{	
		String kor="";
		if (s==null) 
			kor=null;
		else
			kor=new String(s.getBytes("ISO-8859-1"),"EUC-KR");
		
		return kor;
   }
   
	//한글깨짐...
	public static String EngToKor ( String eng ) 
 	{
		String encoding = null;
    		try 
			{ 
			encoding  = new String( eng.getBytes(), "KSC5601");
    		} 
    		catch(Exception ex) 
    		{
    			encoding = eng;
    			System.out.println(ex);
    		}
		
    		return encoding;
 	}

	public static String svrUpPath() 
 	{
		String strPath = File.separator+"data"+File.separator;
    	return strPath;
 	}

	public static String replaceNull( String arg )
	{
		if( arg == null )
			arg="";
		
		arg = arg.trim();
		return arg;
	}

	public static String replaceNull2( String arg )
	{
		if( arg == null )
			arg="";
		
		return arg;
	}

	public static String replaceEtc( String arg )
	{
		if( arg != null )
		{
			arg = arg.replaceAll( "'","" );
		}		
		return arg;
	}
	
	

	public static String split_dir(String str){
		
		String temp_str=str;
		String temp_str2=temp_str.substring(0,1);
		String retValue=temp_str2+File.separator;
		for(int i=1;i<=(temp_str.length()-3);i=i+2){
			retValue=retValue+temp_str.substring(i,i+2)+File.separator;
		}

		return retValue;
		
	}
	
	public static String returnURL(String rurl) {
        String rHtml = new String(" ");
        rHtml  = "<script language=javascript>\n " +
                 "document.location.href='" + rurl + "';  \n" +
                 "// --> \n" +
                 "</script> \n";
        return rHtml;
    }
	
	public static String returnURL(String rurl, String alertMessage) {
        String rHtml = new String(" ");
        if ( alertMessage == null || alertMessage.equals("") ) return "";
        rHtml  = "<script language=javascript>\n " +
                 "<!-- \n" +
                 "alert('" + alertMessage.trim() + "'); \n" +
                 "document.location.href='" + rurl + "';  \n" +
                 "// --> \n" +
                 "</script> \n";
        return rHtml;
    }

	public static String returnError() {
        String rHtml = new String(" ");
        rHtml  = "<script language=javascript>\n " +
                 "<!-- \n" +
                 "document.location.href='/error/error.jsp';  \n" +
                 "// --> \n" +
                 "</script> \n";
        return rHtml;
    }

	public static String returnError(int msg) {
        String rHtml = new String(" ");
        rHtml  = "<script language=javascript>\n " +
                 "<!-- \n" +
                 "document.location.href='/error/error.jsp?ERRCODE="+ msg +"';  \n" +
                 "// --> \n" +
                 "</script> \n";
        return rHtml;
    }

	public static String returnError(int msg, int val) {
        String rHtml = new String(" ");
        rHtml  = "<script language=javascript>\n " +
                 "<!-- \n" +
                 "document.location.href='/error/error.jsp?ERRCODE="+ msg +"&RERRCODE="+ val +"';  \n" +
                 "// --> \n" +
                 "</script> \n";
        return rHtml;
    }
    
    public static String returnHistory(String alertMessage) {
        String rHtml = "";
        rHtml = "<script language=javascript> \n " +
                "<!-- \n" +
                " alert('"+alertMessage.trim()+"'); \n" +
                " history.back(); \n" +
                "// --> \n" +
                "</script> \n ";
        return rHtml;
    }
    
    public static String returnClose(String alertMessage) {
        String rHtml = "";
        rHtml = "<script language=javascript> \n " +
                "<!-- \n" +
                " alert('"+alertMessage.trim()+"'); \n" +
                " opener.location.reload(); \n" +
                " window.close(); \n" +
                "// --> \n" +
                "</script> \n ";
        return rHtml;
    }
    
    public static String returnClose2(String alertMessage) {
        String rHtml = "";
        rHtml = "<script language=javascript> \n " +
                "<!-- \n" +
                " alert('"+alertMessage.trim()+"'); \n" +
                " window.close(); \n" +
                "// --> \n" +
                "</script> \n ";
        return rHtml;
    }
    
    public static String getPage(int total_record, int record_scale, int page_scale, int go_page, String search, String gurl){	
		
    	
    	
		String show_page="";		
		int total_page=(int)Math.ceil((double)total_record / (double)record_scale);
		int start_num=(int) ( (go_page-1) /page_scale * page_scale) +1;
		
		int end_num;
		if(start_num==total_page) end_num=total_page;
		else end_num=start_num+page_scale-1;
		
		int end_page=( total_page<(end_num+1) ) ? total_page: end_num+1;
		
		int now_block=(int)Math.ceil((double)go_page/(double)page_scale);
		int end_block=(int)Math.ceil((double)total_page/(double)page_scale);

		show_page = "<table width='400' border='0' align='center' cellpadding='0' cellspacing='0'><tr>";
		show_page += "<td align='center' style='padding:3'>";

		if(start_num == 1) {
			show_page +=" [첫페이지][이전] </td>";			
		} else {
			show_page +="<a href='"+gurl+"?go_page=1"+search+"'>[첫페이지]</a><a href='"+gurl+"?go_page="+(start_num-1)+""+search+"'>[이전]</a></td>";
		}
		
				
		
		for (int i = start_num; i <= end_num && i<=total_page ; i++)	{
			if (i == go_page) {
				show_page +="<td align='center' style='padding:3 5 3 5'><strong>"+i+"</strong></td>";
			}else{
				show_page +="<td align='center' style='padding:3 5 3 5'><a href='"+gurl +"?go_page="+(String.valueOf(i)+search)+"'>"+i+"</a></td>";
			}
		}
		
		
		if(now_block== end_block) {
			show_page +="<td align='center' style='padding:3'> [다음][마지막]</td>";			
		}else{
			show_page +="<td align='center' style='padding:3'><a href='"+gurl+"?go_page="+(end_page) + search +"'>[다음]</a><a href='"+gurl+"?go_page="+String.valueOf(total_page) + search +"'>[마지막]</a></td>";
		}

		show_page +="</tr></table>";
							
		return show_page;
	}
    
}
