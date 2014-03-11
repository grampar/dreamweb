//바이트 수를 체크할때때...
function cal_byte(check_len,ele1,ele2) 
{
       var tmpStr;
       var temp=0;
       var onechar;
       var tcount;
       tcount = 0;
       var aquery=ele1.value;
       tmpStr = new String(aquery);
       temp = tmpStr.length;

       for (k=0;k<temp;k++)
       {
            onechar = tmpStr.charAt(k);
			if (escape(onechar).length > 4) {
                 tcount += 2;
            }
            else if (onechar!='\r') {
                 tcount++;
            }
       }
       
       ele2.value = tcount; 
       
       if(tcount>check_len) {
            reserve = tcount-check_len;			
			alert("내용은 "+check_len+" 바이트 이상은 쓰실수 없습니다.\r\n 쓰신 내용은 "+reserve+"바이트가 초과되었습니다.\r\n 초과된 부분은 자동으로 삭제됩니다.");
			ele2.value=tcount-reserve;
			cutText(check_len,ele1,ele2);		
            return;
       } 

}

function cal_byte_span(check_len,ele1,ele2) 
{
       var tmpStr;
       var temp=0;
       var onechar;
       var tcount;
       tcount = 0;
       var aquery=ele1.value;
       tmpStr = new String(aquery);
       temp = tmpStr.length;

       for (k=0;k<temp;k++)
       {
            onechar = tmpStr.charAt(k);
			if (escape(onechar).length > 4) {
                 tcount += 2;
            }
            else if (onechar!='\r') {
                 tcount++;
            }
       }
       
       ele2.innerHTML = tcount; 
       
       if(tcount>check_len) {
            reserve = tcount-check_len;			
			alert("내용은 "+check_len+" 바이트 이상은 쓰실수 없습니다.\r\n 쓰신 내용은 "+reserve+"바이트가 초과되었습니다.\r\n 초과된 부분은 자동으로 삭제됩니다.");
			ele2.innerHTML=tcount-reserve;
			cutText(check_len,ele1,ele2);		
            return;
       } 

}


function cutText(check_len,ele1,ele2)
{
       nets_check(check_len,ele1); 
}

function nets_check(check_len,ele1,ele2)
{
       var tmpStr;
       var temp=0;
       var onechar;
       var tcount;
       tcount = 0;
       var aquery=ele1.value
       tmpStr = new String(aquery);
       temp = tmpStr.length;

       for(k=0;k<temp;k++)
       {
            onechar = tmpStr.charAt(k);
            
            if(escape(onechar).length > 4) {
                 tcount += 2;
            }
            else if(onechar!='\r') {
                 tcount++;
            }
            if(tcount>check_len) {
				 tmpStr = tmpStr.substring(0,k); 
                 break;
            }
       }
	   
       ele1.value = tmpStr;	  
}




//#######################################
//바이트 수를 체크하지 않을때...
//######################################
function check_byte(check_len,ele1){

   var tmpStr;
   var temp=0;
   var onechar;
   var tcount;
   tcount = 0;
   var aquery=ele1.value;
   tmpStr = new String(aquery);
   temp = tmpStr.length;

   for (k=0;k<temp;k++)
   {
		onechar = tmpStr.charAt(k);
		if (escape(onechar).length > 4) {
			 tcount += 2;
		}
		else if (onechar!='\r') {
			 tcount++;
		}
   }
         
   if(tcount>check_len) {
		reserve = tcount-check_len;
		alert("내용은  " + check_len +"byte까지만 입력 가능합니다.\r\n 초과된 부분은 자동으로 삭제됩니다.");
		if(cut_byte(check_len,ele1)) return false;		

   } 

}

//바이트 수를 체크하지 않을때...
function cut_byte(check_len,ele1)
{		
       var tmpStr;
       var temp=0;
       var onechar;
       var tcount;
       tcount = 0;
       var aquery=ele1.value
       tmpStr = new String(aquery);
       temp = tmpStr.length;

       for(k=0;k<temp;k++)
       {
            onechar = tmpStr.charAt(k);
            
            if(escape(onechar).length > 4) {
                 tcount += 2;
            }
            else if(onechar!='\r') {
                 tcount++;
            }
			if(tcount>check_len) {				
				 tmpStr = tmpStr.substring(0,k); 
                 break;
            }
       }
	   
       ele1.value = tmpStr;

}


//#######################################
//
//######################################
function non_alert_byte_check(check_len,ele1){
	
   var tmpStr;
   var temp=0;
   var onechar;
   var tcount;
   tcount = 0;
   var aquery=ele1.value;
   tmpStr = new String(aquery);
   temp = tmpStr.length;

   for (k=0;k<temp;k++)
   {
		onechar = tmpStr.charAt(k);
		if (escape(onechar).length > 4) {
			 tcount += 2;
		}
		else if (onechar!='\r') {
			 tcount++;
		}
   }
         
   if(tcount>check_len) {
		reserve = tcount-check_len;
		cut_byte(check_len,ele1);		
		return false;
   } 

   return true;
}

function non_write_byte_check(check_len,ele1){
	
   var tmpStr;
   var temp=0;
   var onechar;
   var tcount;
   tcount = 0;
   var aquery=ele1.value;
   tmpStr = new String(aquery);
   temp = tmpStr.length;

   for (k=0;k<temp;k++)
   {
		onechar = tmpStr.charAt(k);
		if (escape(onechar).length > 4) {
			 tcount += 2;
		}else if (onechar!='\r') {
			 tcount++;
		}
   }   
   if(tcount>check_len) {		
		ele1.blur();
		ele1.focus();
		cut_byte(check_len,ele1);		
	}    

}
function non_tag_byte_check(check_len,ele1){
	
   var tmpStr;
   var temp=0;
   var onechar;
   var tcount;
   tcount = 0;
   var aquery=ele1.value;
   tmpStr = new String(aquery);
   temp = tmpStr.length;

   for (k=0;k<temp;k++)
   {
		onechar = tmpStr.charAt(k);
		if(onechar!=","){
			if (escape(onechar).length > 4) {
				 tcount += 2;
			}else if (onechar!='\r') {
				 tcount++;
			}
		}
   }   
   if(tcount>check_len) {
		alert(check_len+"byte를 넘길수 없습니다");
		cut_byte(check_len,ele1);		
	}    

}

function non_alert_byte_check2(check_len, val){
	
   var tmpStr;
   var temp=0;
   var onechar;
   var tcount;
   tcount = 0;
   var aquery=val;
   tmpStr = new String(aquery);
   temp = tmpStr.length;

   for (k=0;k<temp;k++)
   {
		onechar = tmpStr.charAt(k);
		if (escape(onechar).length > 4)tcount += 2;
		else if (onechar!='\r') tcount++;
   }
         
   if(tcount>check_len) {	
		return false;
   } 

   return true;
}
