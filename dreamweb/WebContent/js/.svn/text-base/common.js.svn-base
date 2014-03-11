
var WinAppName=navigator.appName;
var WinAppVersion=navigator.appVersion;


var isEx=WinAppName.indexOf("Microsoft")!=-1?true: false;
var isEx6;
var isEx7;
var isFire=WinAppName.indexOf("Netscape")!=-1?true: false;;

if(isEx){
	isEx6=WinAppVersion.indexOf("MSIE 6.0;")!=-1?true: false;
	isEx7=WinAppVersion.indexOf("MSIE 7.0;")!=-1?true: false;
}

function WinResize(w, h){
	if(isEx6){			
		window.resizeTo(w, h);
	}else if(isEx7){		
		window.resizeTo(w, parseInt(h)+31);
	}else if(isFire){		
		window.resizeTo(w, parseInt(h)+38);
	}else{
		window.resizeTo(w, parseInt(h)+31);
	}
}

String.prototype.trim = function()
{
	return this.replace(/(^\s*)|(\s*$)/g, "");
}



//숫자만입력받는다.
function OnlyNumber()  //영문을 입력받지 않게 하는 방법
{	
	if((event.keyCode<48)||(event.keyCode>57))
	{		
		event.returnValue=false;		
	}		
			
}
function containsChars(input,chars) {
	if (input.value.lastIndexOf(chars) != -1)
		   return true;
	
	return false;
}

//이미지뒤에 확장자 체크한다..
function CheckImageFile(input,str){	
	filename = input.value;
	if (!containsChars(input,".")){
		return false; 
	}

	var ext = filename.split(".");
	if (ext[ext.length-1]== str)
		return true;
	else
		return false;
	
}

//한글만 입력받는다..
function check_hangle(str){	
	var split_str1, split_str2;
	var retValue=true;
	
	for(var j=0;j<str.length;j++){
		split_str2=str.substr(j,1);
		if (escape(split_str2).length <= 4){
			retValue=false;
			break;
		}		
	}	
	return retValue;
}

//숫자만 입력받는다
function check_number(str){
     var tmp_str;	 
	 for(i=0;i<str.length;i++){
		 tmp_str=str.substr(i,1);
		 if(tmp_str<'0' || tmp_str>'9'){
			return false;
			break;
		 }
	 }
	 return true;
}

function email_check(val){
	var tmp_val=val;
	var retValue=true;
	var split_str=tmp_val.split("@");
	if(split_str.length==2){
		var target=/([a-zA-Z0-9]+\.[a-zA-Z0-9]+)$|([a-zA-Z0-9]+\.[a-zA-Z0-9]+\.[a-zA-Z0-9]+)$/gi;		
		if(!target.test(split_str[1])){
			retValue=false;
		}			
	}else{
		retValue=false;
	}

	return retValue;		
}

//특수 문자 체크 ( - _제외)
function specialchar_check(str){
	var tmp_str="!@#$%^&*(){}[]+=|~`?/><,.'\"\\";
	var split_str1,split_str2;
	var retValue=true;
	
	//특수문자체크	
	for(var i=0;i<tmp_str.length;i++){
		split_str1=tmp_str.substr(i,1);
		for(var j=0;j<str.length;j++){
			split_str2=str.substr(j,1);
			if(split_str2==split_str1){
				retValue=false;
				break;
			}
		}
	}	
	return retValue;
}

//특수 문자 체크 ( @ ' 제외)
function specialchar_check2(str){
	var tmp_str="@'";
	var split_str1,split_str2;
	var retValue=true;
	
	//특수문자체크	
	for(var i=0;i<tmp_str.length;i++){
		split_str1=tmp_str.substr(i,1);
		for(var j=0;j<str.length;j++){
			split_str2=str.substr(j,1);
			if(split_str2==split_str1){
				retValue=false;
				break;
			}
		}
	}	
	return retValue;
}

// 영문 소문자 및 숫자만 입력받느다
function check_english(str){
	var tmp_str=" !@#$%^&*(){}[]+=|~`?/><,.'\"\\ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	var split_str1,split_str2;
	var retValue=true;
	//한글체크
	for(var j=0;j<str.length;j++){
		split_str2=str.substr(j,1);
		if(split_str2!="-" || split_str2!="_"){
			if (escape(split_str2).length > 4){
				retValue=false;
				break;
			}
		}
	}
	
	//특수문자체크
	if(retValue){
		for(var i=0;i<tmp_str.length;i++){
			split_str1=tmp_str.substr(i,1);
			for(var j=0;j<str.length;j++){
				split_str2=str.substr(j,1);
				if(split_str2==split_str1){
					retValue=false;
					break;
				}
			}
		}
	}	
	return retValue;
}
//패스워드 체크
function passwd_chk(str, gubun, userid){
	var tmpstr=str;
	if(gubun=="ne"){ //숫자 문자체크		
		//var pattern1 = /([0-9]+)/;
		var pattern2 = /([^0-9a-zA-Z]+)/;
		//if (!pattern1.test(str) || !pattern2.test(str)) {
		if (pattern2.test(str)) {
			return false;
		}

	}else if(gubun=="id"){ //아이디가 비밀번호에 쓰임여부체크		
		if(tmpstr.indexOf(userid)!=-1){
			return false;
		}
	}else if(gubun=="3"){ //연속된 3자리이상 숫자나 문자 체크
		var pattern1 = /(0{3}|1{3}|2{3}|3{3}|4{3}|5{3}|6{3}|7{3}|8{3}|9{3}|a{3}|b{3}|c{3}|d{3}|e{3}|f{3}|g{3}|h{3}|i{3}|j{3}|k{3}|l{3}|m{3}|n{3}|o{3}|p{3}|q{3}|r{3}|s{3}|t{3}|u{3}|v{3}|w{3}|x{3}|y{3}|z{3})/;

		if (pattern1.test(str)) {
			return false;
		}
	}
	return true;
}


//영문및 숫자, 특수문자만 입력받느다(한글제외)
function non_hangul(str){	
	var split_str1,split_str2;
	var retValue=true;
	//한글체크
	for(var j=0;j<str.length;j++){
		split_str2=str.substr(j,1);
		if(split_str2!="-" || split_str2!="_"){
			if (escape(split_str2).length > 4){
				retValue=false;
				break;
			}
		}
	}
	
	return retValue;
}

/************************************************************
checkbox를 선택했는지를 체크한다.
************************************************************/
function check_checkbox(f, tagName){	
	var check_i=0;
	for(i=0;i<f.elements.length;i++){
		if(f.elements[i].name==tagName){
			if(f.elements[i].checked==true){
				check_i++;
			}
		}
	}
	if(check_i==0){
		return false;
	}else{
		return true;
	}
}

/************************************************************
checkbox 전체를 선택한다.
************************************************************/
function all_check(ff, tagName){	
	var check_i=0;
	for(i=0;i<ff.elements.length;i++){
		if(ff.elements[i].name==tagName){
			ff.elements[i].checked=true;
		}
	}
	
}

/************************************************************
checkbox 전체를 해제한다.
************************************************************/
function all_uncheck(f, tagName){	
	var check_i=0;
	for(i=0;i<f.elements.length;i++){
		if(f.elements[i].name==tagName){
			f.elements[i].checked=false;
		}
	}
	
}

//날짜 validation 체크
function chkDate(y, m, d) {
	var er = 0; // 에러 변수
	var daa = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	if (y%1000 != 0 && y%4 == 0) daa[1] = 29; // 윤년
	if (d > daa[m-1] || d < 1) er = 1; // 날짜 체크
	if (m < 1 || m > 12) er = 1; // 월 체크
	if (m%1 != 0 || y%1 != 0 || d%1 != 0) er = 1; // 정수 체크

	if (er == 1) return false;
	else return true;
}


function go_friend(user_no){
	if(user_no==""){
		alert("로그인 해주세요");
		login_open('');
		return;
		
	}
	location.href="/go_friend.asp?TargetUserNum="+user_no;
}
function go_blog(gurl){	
	top.location.href=gurl;
}

function login_open(str){
	var subquery="";
	if(str!=""){
		subquery="?gourl="+str;
	}
	new_win=window.open("/popup/login.asp"+subquery,"login","width=465,height=300");
}

//스크린 변하게 하기
function change_screen(){
	this.add;
	this.item=new Array();
	this.item_cnt=0;
	this.item_count=0;
	this.name;
	this.layer_name;
			
	this.start_item;
	this.pre;
	this.next;
	this.init;
	this.view;

	this.left;
	this.top;

	this.stop="0";		
	this.delaytime;
	

	this.add= function(){
		var text=arguments[0];
		this.item[this.item_count]=text;			
		this.item_count++;
	}

	
	this.pre=function(){
		this.stop="1"			
		if(this.item_cnt>0){
			this.item_cnt=this.item_cnt-1;
			this.view();	
		}else{
			this.item_cnt=this.item.length-1;
			this.view();	
		}
	}
	this.next=function(){			
		this.stop="1"			
		if(this.item.length-2>=this.item_cnt){
			this.item_cnt=this.item_cnt+1;
			this.view();
		}else{
			this.item_cnt=0;
			this.view();
		}
	}
	

	this.init=function(){						
		this.view();
		this.item_cnt++;
	}

	this.start_item=function(){			
		if(this.stop=="0"){
			if(this.item_cnt>this.item.length-1){
				this.item_cnt=0;
			}
			this.view();
			this.item_cnt++;
		}
		
		window.setTimeout(this.name+".start_item()",this.delaytime);
	}

	this.start_crossitem=function(){			
		if(this.stop=="0"){
			if(this.item_cnt>this.item.length-1){
				this.item_cnt=0;
			}
			this.view();
			this.item_cnt++;
		}
		if (this.name=="cs1"){
		cs1.stop=1;
		cs.stop=0;
		window.setTimeout("cs.start_crossitem()",this.delaytime);
		}else if(this.name="cs"){
		cs.stop=1;
		cs1.stop=0;
		window.setTimeout("cs1.start_crossitem()",this.delaytime);
		}
		
	}


	this.view=function(){		
		document.getElementById(this.layer_name).innerHTML=this.item[this.item_cnt];
	}
}

function Activex_View(val){
	document.write(val);
}
//닉네임 아이디 중간 공백제거
//아나
function trimValue(strObject, str){
	var tmpstr=str;
	if(event.keyCode==32){		
		strObject.value = tmpstr.trim();	
	}
	
}

function add_option(value,text){
	var opt = document.createElement("Option");
	opt.text = text;				
	opt.value= value;
	return opt;
}

function del_option(theobject){
	var len=theobject.length;
	for(i=len;i>0;i--){						
		theobject.options[i-1]=null;
	}
}