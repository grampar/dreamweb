<%@ page pageEncoding="UTF-8"%>
<script>
function CheckHtmlEditor(textobj){	
	if(document.getElementById("html_view").checked==true){
		viewMode("Editor");
	}else{
		viewMode("Html");
	}
}
</script>
<table border="0" cellpadding="0" cellspacing="2" bgcolor="#F3F3F3">
  <tr>
	<td width="81"><select name="selectfontname" onChange="FontMode('fontName',this.value)" style="width:80px">
		<option value="굴림">굴림</option>
		<option value="궁서">궁서</option>
		<option value="돋움">돋움</option>
		<option value="바탕">바탕</option>
		<option value="Arial">Arial</option>
		<option value="Arial Black">Arial Black</option>
		<option value="Courier New">Courier New</option>
		<option value="Impact">Impact</option>
		<option value="Verdana">Verdana</option>
	</select></td>
	<td>&nbsp;</td>
	<td><select name="selectfontsize" style="width:48" onChange="FontMode('FontSize',this.value)">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
	</select></td>
	<td>&nbsp;</td>
	<td align="center" width="12"><img src="/image/img_bar.gif" width="1" height="12" border="0"></td>
	<td><a href="javascript:yExec('Bold');" class="BtnImg2" onFocus="blur();">B</a></td>
	<td width="12"></td>
	<td><a href="javascript:yExec('Italic');" class="BtnImg2" onFocus="blur();">I</a></td>
	<td width="12"></td>
	<td><a href="javascript:yExec('Underline');" class="BtnImg2" onFocus="blur();">U</a></td>
	<td width="12"></td>
	<td><a onClick="showBox('forecolor',event.clientX+document.body.scrollLeft,event.clientY+document.body.scrollTop);" class="BtnImg2" onFocus="blur();" style="cursor:hand">
	font</a></td>
	<td> | </td>
	<td ><a href="javascript:yExec('InsertOrderedList');" class="BtnImg2" onFocus="blur();">order</a></td>
	<td ></td>
	<td><a href="javascript:yExec('InsertUnorderedList');" class="BtnImg2" onFocus="blur();">undo</a></td>
	<td></td>
	<td><a href="javascript:yExec('JustifyLeft');" class="BtnImg2" onFocus="blur();">left</a></td>
	<td></td>
	<td><a href="javascript:yExec('JustifyCenter');" class="BtnImg2" onFocus="blur();">center</a></td>
	<td></td>
	<td><a href="javascript:yExec('JustifyRight');" class="BtnImg2" onFocus="blur();">right</a></td>
	<td></td>
	<td><a href="javascript:yExec('Outdent');" class="BtnImg2" onFocus="blur();">outdent</a></td>
	<td></td>
	<td><a href="javascript:yExec('Indent');" class="BtnImg2" onFocus="blur();">indend</a></td>
	<td></td>
	<td><a href="javascript:yExec('CreateLink');" class="BtnImg2" onFocus="blur();">link</a></td>
	<td>&nbsp;</td>
	<td><a href="javascript:img_upload();" class="BtnImg2" onFocus="blur();">imgupload</a></td>
	<td>&nbsp;</td>
	<td><input type=checkbox id="html_view" onclick="CheckHtmlEditor()" checked>html</td>
	<td>&nbsp;</td>
	<td></td>
  </tr>
</table>