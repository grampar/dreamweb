var global_trcolor_day="";
var global_trid_day="";

function NextepMediaDateDay(){

	this.now_yyyy=null;
	this.now_mm=null;
	this.now_dd=null;
	this.cal_name=null;	
	this.c_name=null;
	this.start_obj=null;
	this.end_obj=null;
	this.form=null;

	this.mode="";
	this.move_yn="";

	this.pg_seq="";
	this.publish_date="";

	this.yoil=new Array("일", "월", "화", "수", "목", "금", "토"); //요일
	this.pre_trobj=null;

	//alert("aaa");
	
	this.next_month=function(){
		
		this.move_yn="Y";
		
		var tmp_mm=this.now_mm;		
		var nextobj=new Date(this.now_yyyy, this.now_mm, 1);

		nalsoo=new Array(31,28,31,30,31,30,31,31,30,31,30,31);  //12달의 기본 일수

		// 4년마다 2월은 29일, 100년 째는 28일, 400년 째는 29일임
		if ((nextobj.getMonth()==1)&&(((nextobj.getFullYear() %4==0)&&(nextobj.getFullYear() %100 !=0))||(nextobj.getFullYear() % 400 ==0 ))){
			nalsoo[1]=29; 			
		}
		
		this.now_yyyy=nextobj.getFullYear();		
		this.now_mm=nextobj.getMonth()+1;	
		
		
		//선택된 날짜의 날이 마지막날인지 체크한다.
		var lastday=nalsoo[tmp_mm-1];
		var nextlastday=nalsoo[this.now_mm-1];

		if(lastday==this.now_dd){			
			this.now_dd=nextlastday
		}else if(lastday>this.now_dd && nextlastday<=this.now_dd){ //2월달 예외처리
			this.now_dd=nextlastday
		}

		
		global_trid_day="";
		this.calendar(this.now_yyyy, this.now_mm, this.now_dd);
	}

	this.pre_month=function(){			
		this.move_yn="Y";
		
		var tmp_mm=this.now_mm;
		var preobj=new Date(this.now_yyyy, this.now_mm-2, 1);
		
		var nalsoo=new Array(31,28,31,30,31,30,31,31,30,31,30,31);  //12달의 기본 일수
		// 4년마다 2월은 29일, 100년 째는 28일, 400년 째는 29일임
		if ((preobj.getMonth()==1)&&(((preobj.getFullYear() %4==0)&&(preobj.getFullYear() %100 !=0))||(preobj.getFullYear() % 400 ==0 ))){
			nalsoo[1]=29; 			
		}
		
		str=this.now_yyyy+"//"+this.now_mm+"//"+this.now_dd;
		this.now_yyyy=preobj.getFullYear();
		this.now_mm=preobj.getMonth()+1;	
			
			
		//선택된 날짜의 날이 마지막날인지 체크한다.
		var lastday=nalsoo[tmp_mm-1];
		var prelastday=nalsoo[this.now_mm-1];
			
		if(lastday==this.now_dd){			
			this.now_dd=prelastday;
		}else if(lastday>this.now_dd && prelastday<=this.now_dd){ //2월달 예외처리
			this.now_dd=prelastday;
		}
		
		str+="//"+lastday+"//"+this.now_yyyy+"//"+this.now_mm+"//"+this.now_dd+"//"+prelastday;
		//alert(str);
		global_trid_day="";
		this.calendar(this.now_yyyy, this.now_mm, this.now_dd);
	}


	this.setStartDate=function(val){				
		
		this.move_yn="";
		if(day_pre_obj!=null){			
			day_pre_obj.style.visibility="hidden";			
			day_pre_obj=null;							
		}	

		
		if(this.mode=="300" || this.mode=="400") {
			this.start_obj.value=val;
			this.end_obj.value=val;
		} else {
			this.start_obj.value=val;
		}
	}
	

	this.calendar=function(yyyy, orimm, oriday){
		
		if(this.move_yn==""){
			if(this.start_obj.value!=""){ //이미 선택된 날짜가 있다면...
				
				yyyy=parseInt(this.start_obj.value.substr(0, 4));			
				orimm=(this.start_obj.value.substr(4, 1)=="0")? this.start_obj.value.substr(5, 1): this.start_obj.value.substr(4, 2);
				oriday=(this.start_obj.value.substr(6, 1)=="0")? this.start_obj.value.substr(7, 1): this.start_obj.value.substr(6, 2);			
			}
		}

		//var todayObj=new Date();	
		var todayObj=new Date();	
		//var toDayObj = new Date(yyyy, mm-1, oriday); //현재 날짜 얻기
		var to_year = todayObj.getFullYear(); 
		var to_month = todayObj.getMonth(); 
		var to_date = todayObj.getDate(); 
		var to_day = todayObj.getDay();   //0이 일요일, 6이 토요일
						
		
		this.now_yyyy=yyyy;
		this.now_mm=orimm;
		this.now_dd=oriday;

		var mm=orimm;               //배열 번호와 맞추기 위해 1을 뺌
				
		var nalsoo=new Array(31,28,31,30,31,30,31,31,30,31,30,31);  //12달의 기본 일수

		var nowDateObj=new Date(yyyy, mm-1, oriday);                // 이달 1일의 요일을 얻기 위한 객체 선언
		
		var now_year = nowDateObj.getFullYear();      
		var now_month = nowDateObj.getMonth();   
		var now_date = nowDateObj.getDate();   
		var now_day = nowDateObj.getDay();   //0이 일요일 6이 토요일

		// 4년마다 2월은 29일, 100년 째는 28일, 400년 째는 29일임
		if ((now_month==1)&&(((now_year %4==0)&&(now_year %100 !=0))||(now_year % 400 ==0 ))) 
			nalsoo[1]=29; 

		
		var firstObj=nowDateObj;                // 달 1일로 설정하기 위한 객체 선언
		firstObj.setDate(1);        // 날짜를 1일로 설정
		var first_day=firstObj.getDay();    // 1일의 요일 얻기

		
		var last_day=nalsoo[now_month];        //이 달의 날짜 수를 얻음		
		
		if(mm==1){
			pre_year=parseInt(now_year)-1;
			pre_month=12;			
		}else{
			pre_year=now_year;
			pre_month=parseInt(mm)-1;					
			
		}	
		var pre_last_day=nalsoo[pre_month-1];        //이전달의 날짜 수를 얻음
		

		if(mm==12){
			next_year=parseInt(now_year)+1;
			next_month=1;			
		}else{
			next_year=now_year;
			next_month=parseInt(mm)+1;					
		}
		
		str="";
		str+='<div id="close"><a href="javascript:hidden_date()">X</a></div>';		
		str+='<div id="top"><a href="javascript:'+this.c_name+'.pre_month()">이전</a>';
		str+='<span>'+now_year+'.'+(now_month+1)+'</span>';
		str+='<a href="javascript:'+this.c_name+'.next_month()">다음</a>';
		str+='</div>';		
		str+='<div id="day">';
		str+='        <table border="0" cellpadding="0" cellspacing="0">';
		str+='            <tr>';
		str+='                <th class="w1">일</th>';
		str+='                <th>월</th>';
		str+='                <th>화</th>';
		str+='                <th>수</th>';
		str+='                <th>목</th>';
		str+='                <th>금</th>';
		str+='                <th>토</th>';
		str+='            </tr>';
		
		
		tmp_tomonth=((to_month+1).toString().length==1)?"0"+(to_month+1): (to_month+1);
		tmp_todate=((to_date).toString().length==1)?"0"+(to_date): (to_date);


		vcol=0;				
		// 1일전(이전달)까지 빈 칸으로 만들기 위한 제어문
		pre_first_date=pre_last_day-first_day+1;
				

		str+=' <tr>';
		var check_i=0;
		for (i=0;i<first_day;i++){          
			
			
			tmp_pre_date=(pre_first_date.toString().length==1)? "0"+pre_first_date: pre_first_date;
			tmp_pre_month=((pre_month).toString().length==1)? "0"+(pre_month): (pre_month);

			//alert((to_year+''+tmp_tomonth+''+tmp_todate)+"//"+(next_year+''+tmp_next_month+''+tmp_next_i)+"//"+next_month+"//"+next_i);
			if((to_year+''+tmp_tomonth+''+tmp_todate)<=(pre_year+''+tmp_pre_month+''+tmp_pre_date)){
				style="after";      //오늘날짜보다 달력날짜가 크다면..				
								
				if(vcol==0){
					style="sunday"; //일요일이면					
				}
			
			}else{ 				
				if(vcol==0){
					style="sunday"; //일요일이면					
				}else{
					style="";              //그외 평범한 날이면
				}
			}			
			
			link=' onclick="'+this.c_name+'.setStartDate('+pre_year+''+tmp_pre_month+''+tmp_pre_date+')" style="cursor:hand;"  '

			str+='<td id="click_tr'+(check_i+1)+'" '+link+'  class="'+style+'" onmouseover="this.style.backgroundColor=\'#eee\'" onmouseout="this.style.backgroundColor=\'#fff\'">'+pre_first_date+'</td>'; 
			vcol++;                     // 빈 칸을 만든 후 칸 수 증가시킴
			pre_first_date++;
			check_i++;
		}
				
		

		for ( i=1; i<=last_day; i++){   // 1일부터 마지막 날까지 반복
			
			tmp_i=(i.toString().length==1)?"0"+i:i;
			tmp_month=((now_month+1).toString().length==1)?"0"+(now_month+1): (now_month+1);
			
			//document.myform.str.value+=(to_year+''+tmp_tomonth+''+tmp_todate)+"//"+this.start_obj.value+"//"+(yyyy+''+tmp_month+''+tmp_i)+"\n";
			if((to_year+''+tmp_tomonth+''+tmp_todate)==(yyyy+''+tmp_month+''+tmp_i)){
				style="today";      //지정된 날짜와 현재 날짜가 같다면..				
			}else if(this.start_obj.value==(yyyy+''+tmp_month+''+tmp_i)){
				style="hit";      //지정된 날짜와 현재 날짜가 같다면..				
				
			}else if((to_year+''+tmp_tomonth+''+tmp_todate)<(yyyy+''+tmp_month+''+tmp_i)){
				style="after";      //오늘날짜보다 달력날짜가 크다면..				
				if(vcol==0){
					style="sunday"; //일요일이면					
				}			
			}else if(vcol==0){
				style="sunday"; //일요일이면
				
			}else{ 
				style="";              //그외 평범한 날이면
				
			}
			
			link='onclick="'+this.c_name+'.setStartDate('+now_year+''+tmp_month+''+tmp_i+')" style="cursor:hand;"  '
			str+='<td id="click_tr'+(check_i+1)+'" '+link+' class="'+style+'" onmouseover="this.style.backgroundColor=\'#eee\'" onmouseout="this.style.backgroundColor=\'#fff\'">'+i+'</td>'; 			
			
			vcol++;            
			if(vcol==7 && i!=last_day){     //7칸을 만들면 줄 바꾸어 새 줄을 만들고 다시 첫 칸부터 시작
				str+='</tr><tr>';
				vcol=0;
			}else if(vcol==7 && i==last_day){
				str+='</tr>';				
			}

			check_i++;
		}                             
		
		
		
		var next_i=1;
		//마지막 날에서 남은 요일의 빈 칸 만들기
		for (i=vcol;i<=6;i++){        
			

			tmp_next_i=(next_i.toString().length==1)? "0"+next_i: next_i;
			tmp_next_month=((next_month).toString().length==1)? "0"+(next_month): (next_month);
			
			
			if((to_year+''+tmp_tomonth+''+tmp_todate)<(next_year+''+tmp_next_month+''+tmp_next_i)){
				style="after";      //오늘날짜보다 달력날짜가 크다면..				
								
				if(vcol==0){
					style="sunday"; //일요일이면					
				}
			
			}else{ 
				style="";              //그외 평범한 날이면				
			}
			link=' onclick="'+this.c_name+'.setStartDate('+next_year+''+tmp_next_month+''+tmp_next_i+')" style="cursor:hand;"  '


			str+='<td id="click_tr'+(check_i+1)+'" '+link+' class="'+style+'" onmouseover="this.style.backgroundColor=\'#eee\'" onmouseout="this.style.backgroundColor=\'#fff\'">'+next_i+'</td>';
			next_i++;
			vcol++; 
			check_i++;
		}
		
		str+='        </table>';
		str+='    </div>';
		
		//return str;
		document.getElementById(this.cal_name).innerHTML=str;
	}	
}