//색상배열
var colortone = new Array(10);
colortone[0] = new Array('#ffffff','#e5e4e4','#d9d8d8','#c0bdbd','#a7a4a4','#8e8a8b','#827e7f','#767173','#5c585a','#000000');
colortone[1] = new Array('#fefcdf','#fef4c4','#feed9b','#fee573','#ffed43','#f6cc0b','#e0b800','#c9a601','#ad8e00','#8c7301');
colortone[2] = new Array('#ffded3','#ffc4b0','#ff9d7d','#ff7a4e','#ff6600','#e95d00','#d15502','#ba4b01','#a44201','#8d3901');
colortone[3] = new Array('#ffd2d0','#ffbab7','#fe9a95','#ff7a73','#ff483f','#fe2419','#f10b00','#d40a00','#940000','#6d201b');
colortone[4] = new Array('#ffdaed','#ffb7dc','#ffa1d1','#ff84c3','#ff57ac','#fd1289','#ec0078','#d6006d','#bb005f','#9b014f');
colortone[5] = new Array('#fcd6fe','#fbbcff','#f9a1fe','#f784fe','#f564fe','#f546ff','#f328ff','#d801e5','#c001cb','#8f0197');
colortone[6] = new Array('#e2f0fe','#c7e2fe','#add5fe','#92c7fe','#6eb5ff','#48a2ff','#2690fe','#0162f4','#013add','#0021b0');
colortone[7] = new Array('#d3fdff','#acfafd','#7cfaff','#4af7fe','#1de6fe','#01deff','#00cdec','#01b6de','#00a0c2','#0084a0');
colortone[8] = new Array('#edffcf','#dffeaa','#d1fd88','#befa5a','#a8f32a','#8fd80a','#79c101','#3fa701','#307f00','#156200');
colortone[9] = new Array('#d4c89f','#daad88','#c49578','#c2877e','#ac8295','#c0a5c4','#969ac2','#92b7d7','#80adaf','#9ca53b');


function WebEdit(editObj, rpath){
	
	this.yEditor=null;
	this.selection    = null;
	this.selection2    = null;
	this.RestoreSelection = null;
	this.SaveSelection  = null;
	this.GetSelection  = null;
	this.divBox=null;
	this.EditObj=editObj;
	this.textareaObj=null;
	this.root_path=rpath;

	this.init=function(frameobj, divobj, txtobj){
		//alert("초기화함수");
		
		this.yEditor=frameobj;
		this.divBox=divobj;
		this.textareaObj=txtobj;
		
		this.yEditor.document.designMode = "On";
		var str = "<style>P {white-space:pre;margin-top:3px;margin-bottom:3px;margin-left:3;margin-right:3;word-break:break-all;}</style>"
		this.yEditor.document.open("text/html");
		this.yEditor.document.write(str);
		this.yEditor.document.close();		
		this.yEditor.document.body.style.fontSize = "9pt";
		this.yEditor.document.body.style.fontFamily = "돋움";
		// 스크롤
		this.yEditor.document.body.style.scrollbarFaceColor='#d9d9d9';
		this.yEditor.document.body.style.scrollbarHighLightColor=' #FFFFFF';
		this.yEditor.document.body.style.scrollbarShadowColor='#ffffff';
		this.yEditor.document.body.style.scrollbar3DlightColor='#d9d9d9';
		this.yEditor.document.body.style.scrollbarDarkshadowColor='#d9d9d9';
		this.yEditor.document.body.style.scrollbarTrackColor='#F2F2F2';
		this.yEditor.document.body.style.scrollbarArrowColor='#ffffff';	


		this.RestoreSelection = this.Space_RestoreSelection;
		this.SaveSelection  = this.Space_SaveSelection;
		this.GetSelection  = this.Space_GetSelection;
		
		
	}

	this.Space_RestoreSelection=function(){
		if (this.selection) {
			this.selection.select();
		}
	}

	this.Space_GetSelection=function() {
		var oSelected = this.selection;
		if (!oSelected) {
			oSelelected = yEditor.document.selection.createRange();
			oSelelected.type = yEditor.document.selection.type;
		}
		return oSelected;
	}

	
	this.Space_SaveSelection=function() {
		this.selection = this.yEditor.document.selection.createRange();
		this.selection.type = this.yEditor.document.selection.type;
	}

	this.yExec=function(cmd , opt){
		this.RestoreSelection();
		this.yEditor.focus();
		if (opt==null){
			this.yEditor.document.execCommand(cmd);
		}else{
			this.yEditor.document.execCommand(cmd,"",opt);
		}
	}

	this.imageinsert=function(val){
		var tmpval = this.yEditor.document.body.innerHTML;	
		var img="<img src='"+val+"'>";
		
		//this.SaveSelection.pasteHTML(img)
		//this.yEditor.document.execCommand(cmd,"",opt);		
		//this.yExec("InsertImage", val)
		//this.yEditor.focus();
		//this.yEditor.document.execCommand("inserthtml","",img);
		
		if(tmpval.trim() == ""){
			this.yEditor.document.body.innerHTML = img +"<br>" ;		
		}else{
			this.yEditor.document.body.innerHTML = tmpval+ '<br>' + img + '<br>';		
		}
		this.hideBox();
			
	}

	this.FontMode=function(fontnm, fontvalue){
		this.yExec(fontnm, fontvalue);
	}

	this.showBox=function(flag, x, y){
		document.getElementById("DivBoxFontChild"+this.EditObj).innerHTML = this.getTable(flag);
		document.getElementById("DivBoxFont"+this.EditObj).style.visibility = "visible";
	}
	
	

	this.hideBox=function(){		
		this.divBox.style.display = "none";
		document.getElementById("DivBoxFont"+this.EditObj).style.visibility="hidden";
	}
	
	this.CheckHtmlEditor=function(obj){
		if(obj.checked==true){
			if(this.EditObj=="wedit"){
				Editor1.style.display="";
				html1.style.display="none";				
			}else{
				Editor2.style.display="";
				html2.style.display="none";				
			}
			this.yEditor.document.body.innerHTML = this.textareaObj.value;
		}else{	
			if(this.EditObj=="wedit"){
				Editor1.style.display="none";
				html1.style.display="";				
			}else{
				Editor2.style.display="none";
				html2.style.display="";				
			}
			this.textareaObj.value= this.yEditor.document.body.innerHTML;
		}
	}

	this.getMenu=function(){
		str="";
		str=str+"<table border=\"1\" cellpadding=\"0\" cellspacing=\"2\" bgcolor=\"#F3F3F3\"><tr><td width=\"81\">";
		str=str+"<select name=\"selectfontname\" onChange=\""+this.EditObj+".FontMode('fontName',this.value)\" style=\"width:80px\">";
		str=str+"<option value=\"굴림\">굴림</option><option value=\"궁서\">궁서</option><option value=\"돋움\">돋움</option><option value=\"바탕\">바탕</option>";
		str=str+"<option value=\"Arial\">Arial</option><option value=\"Arial Black\">Arial Black</option><option value=\"Courier New\">Courier New</option>";
		str=str+"<option value=\"Impact\">Impact</option><option value=\"Verdana\">Verdana</option>";
		str=str+"</select></td>";
		str=str+"<td>&nbsp;</td>";				

		str=str+"<td><select name=\"selectfontsize\" style=\"width:48\" onChange=\""+this.EditObj+".FontMode('FontSize',this.value)\">";
		str=str+"<option value=\"1\">1</option><option value=\"2\">2</option><option value=\"3\">3</option><option value=\"4\">4</option>";
		str=str+"<option value=\"5\">5</option><option value=\"6\">6</option><option value=\"7\">7</option>";
		str=str+"</select>";
		str=str+"</td>";
		str=str+"<td width=2>&nbsp;</td>";		
		str=str+"<td><a href=\"javascript:"+this.EditObj+".yExec('Bold');\" onFocus=\"blur();\">Bold</a></td>";
		str=str+"<td><a href=\"javascript:"+this.EditObj+".yExec('Italic');\" onFocus=\"blur();\">Italic</a></td>";
		str=str+"<td><a href=\"javascript:"+this.EditObj+".yExec('Underline');\" onFocus=\"blur();\">U</a></td>";
		str=str+"<td>&nbsp;</td>";		
		str=str+"<td><a href=\"javascript:"+this.EditObj+".showBox('forecolor');\" onFocus=\"blur();\" style=\"cursor:hand\">font</a></td>";
		str=str+"<td>&nbsp;<div id='DivBoxFont"+this.EditObj+"' style='position:releative;visibility:hidden;'><div id='DivBoxFontChild"+this.EditObj+"' style='position:absolute;'></div></div></td>";		
		str=str+"<td ><a href=\"javascript:"+this.EditObj+".yExec('InsertOrderedList');\" onFocus=\"blur();\">번호</a></td>";
		str=str+"<td><a href=\"javascript:"+this.EditObj+".yExec('InsertUnorderedList');\" onFocus=\"blur();\">점</a></td>";
		str=str+"<td>&nbsp;</td>";		
		str=str+"<td><a href=\"javascript:"+this.EditObj+".yExec('JustifyLeft');\" onFocus=\"blur();\">left</a></td>";
		str=str+"<td><a href=\"javascript:"+this.EditObj+".yExec('JustifyCenter');\" onFocus=\"blur();\">center</a></td>";
		str=str+"<td><a href=\"javascript:"+this.EditObj+".yExec('JustifyRight');\" onFocus=\"blur();\">right</a></td>";
		str=str+"<td>&nbsp;</td>";		
		str=str+"<td><a href=\"javascript:"+this.EditObj+".yExec('Outdent');\" onFocus=\"blur();\">내어쓰기</a></td>";
		str=str+"<td><a href=\"javascript:"+this.EditObj+".yExec('Indent');\" onFocus=\"blur();\">들여쓰기</a></td>";
		str=str+"<td>&nbsp;</td>";		
		str=str+"<td><a href=\"javascript:"+this.EditObj+".yExec('CreateLink');\" onFocus=\"blur();\">link</a></td>";
		str=str+"<td>&nbsp;</td>";		
		str=str+"<td><a onclick=\""+this.EditObj+".img_upload();\" style='cursor:hand'>imgupload</a></td>";
		str=str+"<td>&nbsp;</td>";		
		str=str+"<td><a href=\"javascript:"+this.EditObj+".pre_view();\" onFocus=\"blur();\">preview</a></td>";
		str=str+"<td>&nbsp;</td>";		
		str=str+"<td><input type=checkbox id=\"html_view\" onclick=\""+this.EditObj+".CheckHtmlEditor(this)\" checked>html</td>";
		str=str+"</tr>";
		str=str+"</table>";
		
		return str;
	}

	this.getTable=function(flag){
	
		var str = "";
		str += "<table cellpadding=0 cellspacing=0 border=0 bgcolor=#EEEEEE style='border:solid 1px #666699;cursor:hand;'><tr><td align=center>";
		if(flag=="forecolor" || flag=="bgcolor"){
			str += "<table cellpadding=0 class=menuTable bgcolor=#FFFFFF cellspacing=0 border=0 style='border:solid 1px #666699'>";
			for (var i=0; i<10; i++){
				str += "<tr>";
				for(var j=0; j<10; j++){
					str += "<td onmouseover=this.style.backgroundColor='#444444' onmouseout=this.style.backgroundColor='#FFFFFF'>";
					str += "<table cellpadding=0 cellspacing=1 border=0><tr><td bgcolor='" + colortone[i][j] + "' width=17 height=9 onclick='"+this.EditObj+".yExec(\"" + flag + "\", \"" + colortone[i][j] + "\");'>";
					str+="</td></tr></table></td>";
				}   
				str += "</tr>";
			}
			str+="</table>";
		}
		str+="</tr></table>";

		return str;
	}
	
	this.img_upload=function(){
		str="";		
		str+="<iframe name='web_edit_iframe' id='web_edit_iframe' width=0 height=0 border=0></iframe>";
		str += "<table cellpadding=3 cellspacing=0 border=0 bgcolor=#EEEEEE style='border:solid 1px #666699;cursor:hand;'><tr><td align=center>";
		str += "<form name='img_form' action=\""+this.root_path+"/game/img_file_upload.do\"  method=\"post\"  enctype=\"multipart/form-data\" target='web_edit_iframe' onsubmit='return true;'>";
		
		if(this.EditObj=="wedit") str += "<input type=hidden name=gubun value='wedit'>";
		else str += "<input type=hidden name=gubun value='wedit2'>";
		
		str += "<input type=file name=imgfile><input type=submit value='업로드'>";
		str += "</form>";		
		str+="</td></tr>";				
		str+="</table>";
		
		
		this.divBox.innerHTML = str;
		this.divBox.style.display = "";
		this.divBox.style.left = event.clientX+parseInt(document.body.scrollLeft);
		this.divBox.style.top = event.clientY+parseInt(document.body.scrollTop);
		
	}
	
	this.pre_view=function(){
		var win=window.open("", "_blank", "");
		win.document.body.innerHTML=this.yEditor.document.body.innerHTML;
	}

}



document.write("<div id='DivBox' style='position:absolute;display:none;'></div>");


