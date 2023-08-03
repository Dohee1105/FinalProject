package kr.or.ddit.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.CmnuseManagectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class PoiFileUtil {


	public static CmnuseManagectVO readExcelFile(MultipartFile multipartFile) {
		CmnuseManagectVO cmnuseManagectVO = new CmnuseManagectVO();
		List<Long> valueList = new ArrayList();
        try (InputStream inputStream = multipartFile.getInputStream()) {
            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet sheet = workbook.getSheetAt(0); // Assuming you are reading the first sheet

            int numRows = sheet.getPhysicalNumberOfRows();

            for (int i = 0; i < numRows; i++) {
                Row row = sheet.getRow(i);
                int numCells = row.getPhysicalNumberOfCells();
                for (int j = 0; j < numCells; j++) {
                    Cell cell = row.getCell(j);
                    Long contents = (long) cell.getNumericCellValue();
                    valueList.add(contents);
                    log.info(contents + "\t");
                }
            }

            workbook.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        cmnuseManagectVO.setManagectTot(valueList.get(0));
		cmnuseManagectVO.setManagectWtr(valueList.get(1));
		cmnuseManagectVO.setManagectElcty(valueList.get(2));
		cmnuseManagectVO.setManagectHeat(valueList.get(3));
		cmnuseManagectVO.setManagectCln(valueList.get(4));
		cmnuseManagectVO.setManagectElvtr(valueList.get(5));
		cmnuseManagectVO.setManagectScrty(valueList.get(6));
		cmnuseManagectVO.setManageOfficeOrpns(valueList.get(7));
		cmnuseManagectVO.setManagectWrrtn(valueList.get(8));
		cmnuseManagectVO.setManagectRepair(valueList.get(9));
		cmnuseManagectVO.setManagectDsnf(valueList.get(10));
		cmnuseManagectVO.setManagectPrkplce(valueList.get(11));
		cmnuseManagectVO.setManagectPblfclt(valueList.get(12));
		cmnuseManagectVO.setManagectGas(valueList.get(13));
		cmnuseManagectVO.setManagectFast(valueList.get(14));
		cmnuseManagectVO.setManagectBuild(valueList.get(15));
		cmnuseManagectVO.setManagectTrash(valueList.get(16));

		return cmnuseManagectVO;
    }
}
