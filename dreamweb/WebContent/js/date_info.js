function NextepMediaDateInfo(){

	this.now_yyyy=null;
	this.now_mm=null;
	this.cal_name=null;	
	this.c_name=null;
	this.form_obj=null;
	
	
	this.next_month=function(){
		
		if(this.now_mm==12){
			this.now_yyyy=this.now_yyyy+1;
			this.now_mm=1;
			this.calendar(this.now_yyyy, this.now_mm);
		}else{
			this.now_yyyy=this.now_yyyy;
			this.now_mm=this.now_mm+1;
			this.calendar(this.now_yyyy, this.now_mm);
		}
	}

	this.pre_month=function(){	
		
		if(this.now_mm==1){
			this.now_yyyy=this.now_yyyy-1;
			this.now_mm=12;
			this.calendar(this.now_yyyy, this.now_mm);
		}else{
			this.now_yyyy=this.now_yyyy;
			this.now_mm=this.now_mm-1;
			this.calendar(this.now_yyyy, this.now_mm);
		}
	}


	this.setDate=function(val){		
		this.form_obj.value=val;
	}


	this.calendar=function(yyyy, orimm){
		
		this.now_yyyy=yyyy;
		this.now_mm=orimm;

		var mm=orimm-1;               //배열 번호와 맞추기 위해 1을 뺌
		
		var nalsoo=new Array(31,28,31,30,31,30,31,31,30,31,30,31);  //12달의 기본 일수

		// 4년마다 2월은 29일, 100년 째는 28일, 400년 째는 29일임
		if ((kmonth==1)&&(((kyear %4==0)&&(kyear %100 !=0))||(kyear % 400 ==0 ))) 
			nalsoo[1]=29; 
			
		var yoil=new Array("일", "월", "화", "수", "목", "금", "토"); //요일
		
		var kd = new Date(yyyy, mm);               //날짜 객체 선언
		//var kd = new Date();               //날짜 객체 선언
		var kyear = kd.getYear();      //4자리 연도 얻기	
		var kmonth = kd.getMonth();        //달 얻기.0월부터 시작함에 주의
		var kdate = kd.getDate();          //날 얻기
		var kday = kd.getDay();            //0이 일요일, 6이 토요일
		
		
		var fd=kd;                // 이달 1일의 요일을 얻기 위한 객체 선언
		fd.setFullYear(yyyy);
		fd.setMonth(mm);

		var fyear = fd.getYear();      //4자리 연도 얻기
		var fmonth = fd.getMonth();        //달 얻기.0월부터 시작함에 주의
		var fdate = fd.getDate();          //날 얻기
		var fday = fd.getDay();            //0이 일요일 6이 토요일

		
		firstday=fd;                // 달 1일로 설정하기 위한 객체 선언
		firstday.setDate(1);        // 날짜를 1일로 설정
		fday1=firstday.getDay();    // 1일의 요일 얻기
		fmend=nalsoo[fmonth];        //이 달의 날짜 수를 얻음
		
		
				
		str='<table width=220 hegith=300 bgcolor=white border=1>';        // 줄 마감
		str+='<TR align=center ><TD colspan=7 ><a href="javascript:'+this.c_name+'.pre_month()">이전</a>';
		str+='<font size=3 color=9B3E7D><b>';
		str+=fyear+'년 '+(fmonth+1)+'월</b>';
		str+='</font><a href="javascript:'+this.c_name+'.next_month()">다음</a></TD></TR><TR>';

		for (i=0;i<=6;i++){          // 각 요일의 칸을 만들고 요일을 표시
			str+='<TD style="color: black;   font-weight:normal;">'+((i==0)?'<font color=red>':'')+ yoil[i]+ '</TD>';
		}
		
		str+='</TR>';
		str+='<TR align=center>';


		vcol=0;                       // 날짜 표시 칸을 첫 칸으로 설정
		for (i=0;fday1>i;i++){          // 1일 전까지 빈 칸으로 만들기 위한 제어문
			str+='<TD> </TD>'; 
			vcol++;                     // 빈 칸을 만든 후 칸 수 증가시킴
		}
		
		for ( i=1; i<=fmend; i++){   // 1일부터 마지막 날까지 반복
		
			if(kyear==fyear && kmonth==fmonth && kdate==fdate && kday==fday && i==kdate)
				style="color: black; font-weight:bold;";      //오늘이면 today 스타일로 표시
			else if(vcol==0) 
				style="color: crimson; font-weight:normal;"; //일요일이면
			else if(vcol==6) 
				style="color: blue;   font-weight:normal;"; //토요일이면
			else 
				style="color: navy; font-weight:normal;";              //그외 평범한 날이면
			
			tmp_i=(i.toString().length==1)?"0"+i:i;
			//tmp_month=(fmonth.toString().length==1)?"0"+(fmonth+1): (fmonth+1);
			
			
			tmp_month=((fmonth+1).toString().length==1)?"0"+(fmonth+1): (fmonth+1);
			

			str+='<TD style="'+style+'"><a href="javascript:'+this.c_name+'.setDate('+fyear+''+tmp_month+''+tmp_i+')">'+i+'</a></TD>'; 			

			vcol++;            
			if(vcol==7){     //7칸을 만들면 줄 바꾸어 새 줄을 만들고 다시 첫 칸부터 시작
				str+='</TR><TR align=center>';
				vcol=0;
			}
		}                             
		
		for (i=vcol;i<=6;i++){        //마지막 날에서 남은 요일의 빈 칸 만들기
			str+='<TD> </TD>';
		}
		str+='</TR></TABLE>';

		document.getElementById(this.cal_name).innerHTML=str;
	}

}


var date_pre_obj=null;
function view_date(formname){

		
	var vd = new Date();
	now_y=vd.getFullYear();
	now_m=vd.getMonth()+1;

	if(now_m==12){
		now_y=now_y+1
		now_m=0;
	}

	var vd2 = new Date(now_y, now_m);
	date_info1.c_name="date_info1";	
	date_info1.cal_name="calendarDiv";
	date_info1.form_obj=eval("document."+formname).release_date;	
	date_info1.calendar(vd.getFullYear(),vd.getMonth()+1);    
		

	
	if(date_pre_obj!=null){
		date_pre_obj.style.visibility="hidden";
		//date_pre_obj=null;
	}
	
	
	var obj=document.getElementById("calendarDiv");	
	obj.style.left=event.clientX+document.body.scrollLeft;
	obj.style.top=event.clientY+document.body.scrollTop;	
	obj.style.visibility="visible";

	date_pre_obj=obj;
	
}

function hidden_date(){		
	if(date_pre_obj!=null){
		var obj=event.srcElement;	
		if(obj.tagName!="A" && obj.tagName!="INPUT"){						
			date_pre_obj.style.visibility="hidden";			
			//date_pre_obj=null;
			
		}
	}
	
}

document.attachEvent("onclick", hidden_date);

var date_info1=new NextepMediaDateInfo();

