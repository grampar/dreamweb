package nextep.util;

public class Today 
{
	
	
	
	
	protected String year = null;		// 연도(4자리)
	protected String month = null;	// 월(2자리)
	protected String day = null;		// 일(2자리)	
	protected String hour = null;		// 시(2자리)
	protected String minute = null;	// 분(2자리)
	protected String second = null;	// 초(2자리)
	
	protected String currentTime = null;	// 현재시간(14자리)
		
	public Today()
	{
          // 현재시간을 구할 수 있는 객체 생성
		java.util.Calendar calendar = java.util.Calendar.getInstance();
		StringBuffer buffer = new StringBuffer();
		
		year = CommonUtil.toString( calendar.get(java.util.Calendar.YEAR) , 4 );
		month = CommonUtil.toString( calendar.get(java.util.Calendar.MONTH) + 1 , 2 );
		day = CommonUtil.toString( calendar.get(java.util.Calendar.DATE) , 2 );
		
		hour = CommonUtil.toString( calendar.get(java.util.Calendar.HOUR_OF_DAY) , 2 );
		minute = CommonUtil.toString( calendar.get(java.util.Calendar.MINUTE) , 2 );
		second = CommonUtil.toString( calendar.get(java.util.Calendar.SECOND) , 2 );
		
		buffer.append( year );          // 연도(4자리)
		buffer.append( month );         // 월(2자리) 
		buffer.append( day );           // 일(2자리)
		buffer.append( hour );          // 시(2자리)
		buffer.append( minute );        // 분(2자리)
		buffer.append( second );        // 초(2자리)
		
		currentTime = buffer.toString();	// 현재시간(14자리)		
	}
	
	// 연도 설정 및 반환
	public void setYear( String year )
	{
		int tempYear = Integer.parseInt(year);
		int temp = 0;
		
		try{
			if( tempYear < 2000 )
			{
				temp = 2000 + tempYear;
				this.year = String.valueOf(temp);
			}
			else
				this.year = year;
		}
		catch( Exception e)
		{
		}	
	}
	public String getYear()
	{
		return year;
	}
	
	public int getYearInt()
	{
		return Integer.parseInt( year );
	}
	
	// 월 설정 및 반환
	public void setMonth( String month )
	{
		this.month = month;
	}
	public String getMonth()
	{
		return month;
	}
	public int getMonthInt()
	{
		return Integer.parseInt( month );
	}
	
	// 일 설정 및 반환
	public void setDay( String day )
	{
		this.day = day;
	}
	public String getDay()
	{
		return day;
	}
	public int getDayInt()
	{
		return Integer.parseInt(day);
	}
	
	// 시 설정 및 반환
	public void setHour( String hour )
	{
		this.hour = hour;
	}
	public String getHour()
	{
		return hour;
	}
	
	// 분 설정 및 반환
	public void setMinute( String minute )
	{
		this.minute = minute;
	}
	public String getMinute()
	{
		return minute;
	}
	
	// 초 설정 및 반환
	public void setSecond( String second )
	{
		this.second = second;
	}
	public String getSecond()
	{
		return second;
	}
	
	// 현재시간 반환
	public String getCurrentTime()
	{
		return currentTime;
	}
}