package nextep.userxl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.springframework.web.servlet.view.document.AbstractExcelView;


public class UserxlListExeclView extends AbstractExcelView {

	
	
	private String createFileName() {

		 SimpleDateFormat fileFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");

		 return new StringBuilder("UserList").append("-").append(fileFormat.format(new Date())).append(".xls").toString();
	 }

	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook wb,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HSSFSheet sheet = wb.createSheet("user_list");

		int rowIdx = 0;
		
		HSSFCellStyle titleStyle = wb.createCellStyle();
		titleStyle.setFillForegroundColor(HSSFColor.TURQUOISE.index);
		titleStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		titleStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		titleStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		titleStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		titleStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		 


		// 타이틀 설정
		String[] titleList = { "USER_NO", "LOGIN_ID", "USER_NICK", "YYYYMMDD", "HP", "USER_SEX", "reg_date", "equip_code", "code_nm", "nation_nm"};
		HSSFRow titleRow = sheet.createRow(rowIdx++);
		for (int i = 0; i < titleList.length; i++) {
			HSSFCell cell = titleRow.createCell((short)i);
			cell.setCellValue(new HSSFRichTextString(titleList[i]));
			cell.setCellStyle(titleStyle);
		}



		// 엑셀 서식 설정
		/*
		HSSFCellStyle numStyle = wb.createCellStyle();
		numStyle.setDataFormat(wb.createDataFormat().getFormat("#,##0"));
		HSSFCellStyle percentStyle = wb.createCellStyle();
		percentStyle.setDataFormat(wb.createDataFormat().getFormat("0%"));
		 HSSFCellStyle dateStyle = wb.createCellStyle();
		 dateStyle.setDataFormat(wb.createDataFormat().getFormat("yyyy/mm/dd"));
		

		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		 */
		 	
		 // 데이터 추가
		 List<Userxl> list = (List)model.get("Userxl");
		 for (Userxl nd : list) {
			 HSSFRow dataRow = sheet.createRow(rowIdx++);
			 
			 
			 HSSFCell noCell = dataRow.createCell((short) 0);
			 noCell.setCellValue(new HSSFRichTextString(nd.getUser_no() ));
			
			 HSSFCell loginidCell = dataRow.createCell((short)1);
			 loginidCell.setCellValue(new HSSFRichTextString(nd.getLogin_id()));

			 HSSFCell nickCell = dataRow.createCell((short)2);
			 nickCell.setCellValue(new HSSFRichTextString(nd.getUser_nick()));
			 
			 HSSFCell yyyyCell = dataRow.createCell((short)3);
			 yyyyCell.setCellValue(new HSSFRichTextString(nd.getUser_nick()));
			 
			 HSSFCell hpCell = dataRow.createCell((short)4);
			 hpCell.setCellValue(new HSSFRichTextString(nd.getHp()));
			 
			 HSSFCell sexCell = dataRow.createCell((short)5);
			 sexCell.setCellValue(new HSSFRichTextString(nd.getUser_sex()));
			 
			 HSSFCell dateCell = dataRow.createCell((short)6);
			 dateCell.setCellValue(new HSSFRichTextString(nd.getReg_date()));
			 
			 HSSFCell equipCell = dataRow.createCell((short)7);
			 equipCell.setCellValue(new HSSFRichTextString(nd.getEquip_code()));
			 
			 HSSFCell codenmCell = dataRow.createCell((short)8);
			 codenmCell.setCellValue(new HSSFRichTextString(nd.getCode_nm()));
			 
			 HSSFCell nationnmCell = dataRow.createCell((short)9);
			 nationnmCell.setCellValue(new HSSFRichTextString(nd.getNation_nm()));
			 
		 }

		 for (int i = 0; i < titleList.length; i++) {
			 sheet.autoSizeColumn((short)i);
		 }


		 // 파일 다운로드 시작
		 String fileInfo = String.format("attachment; filename=\"" + createFileName() + "\"");
		 response.setHeader("Content-Disposition", fileInfo);
		
	}


	
}
