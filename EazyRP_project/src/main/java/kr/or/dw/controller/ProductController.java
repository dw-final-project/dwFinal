package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aspose.cells.Cell;
import com.aspose.cells.Cells;
import com.aspose.cells.LoadOptions;
import com.aspose.cells.Workbook;
import com.aspose.cells.Worksheet;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.ProductService;
import kr.or.dw.vo.BsheetVO;
import kr.or.dw.vo.BuyDetailVO;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.DraftVO;
import kr.or.dw.vo.O_DetailVO;
import kr.or.dw.vo.OrderVO;

@Controller
@RequestMapping("/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/productBuy")
	public ModelAndView productBuy(ModelAndView mnv, String mcode, HttpSession session, SearchCriteria cri) throws SQLException {
		String url = "/product/productBuy.page";
		String c_no = (String) session.getAttribute("c_no");
		Map<String, Object> dataMap = new HashMap<>();
		Map<String, Object> map = new HashMap<>();
		dataMap.put("c_no", c_no);
		dataMap.put("cri", cri);
		
		map = productService.getB_sheet(dataMap);
		mnv.addObject("searchType", cri.getSearchType());
		mnv.addObject("keyword", cri.getKeyword());
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(map);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/findCompany")
	public ModelAndView findCompany(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		List<CompanyVO> company = productService.getCompanyList(cri);
		
		mnv.addObject("company", company);
		mnv.setViewName("/product/findCompany");
		return mnv;
	}
	
	@RequestMapping("/productBuyRegist")
	public ModelAndView productBuyRegist(ModelAndView mnv, HttpSession session) {

		mnv.addObject("empno", session.getAttribute("emp_no"));
		mnv.addObject("ename", session.getAttribute("e_name"));
		mnv.setViewName("/product/productBuyRegist");
		return mnv;
	}
	
	@RequestMapping("/productBuyRegistFrom")
	public void productBuyRegistFrom(HttpServletResponse res, HttpSession session, BsheetVO sheet, String[] pr_no, String[] pr_name, int[] quantity, int[] amount) throws SQLException, IOException {
		sheet.setBuy_c_no((String)session.getAttribute("c_no"));
		if(pr_name.length > 1) {
			int length = pr_name.length - 1 ;
			sheet.setPr_name(pr_name[0]+" 외 " + length + "건");
		}
		int sheet_no = productService.insertProductBuy(sheet);
		
		List<BuyDetailVO> detail = new ArrayList<BuyDetailVO>();

		
		for(int i = 0; i < pr_no.length; i++) {
			BuyDetailVO vo = new BuyDetailVO();
			vo.setAmount(amount[i]);
			vo.setPr_no(pr_no[i]);
			vo.setQuantity(quantity[i]);
			vo.setSheet_no(sheet_no);
			detail.add(i, vo);
			System.out.println(i + "번째 추가 " + vo);
		}
		productService.insertProductDetail(detail);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('구매 내역 추가가 완료되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
		
	}
	
	@RequestMapping("/buyDetail")
	public ModelAndView buyDetail(ModelAndView mnv, String sheet_no, HttpSession session) throws SQLException {
		String url = "/product/buyDetail";
		
		List<BuyDetailVO> detailVo = productService.getBuyDetail(sheet_no);
		BsheetVO sheetVo = productService.getSheet(sheet_no);
		
		mnv.addObject("sheet", sheetVo);
		mnv.addObject("detail", detailVo);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	
	@RequestMapping("/productOrder")
	public ModelAndView productOrder(ModelAndView mnv, String mcode, SearchCriteria cri, HttpSession session) throws SQLException {
		String url = "/product/productOrder.page";
		System.out.println(cri.getSearchType());
		System.out.println(cri.getKeyword());
		String c_no = (String) session.getAttribute("c_no");
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("cri", cri);
		dataMap.put("c_no", c_no);
		Map<String, Object> map = new HashMap<>();
		map = productService.allOrderList(dataMap);
		
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(map);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/orderDetail")
	public ModelAndView orderDetail(ModelAndView mnv, String o_no) throws SQLException {
		List<O_DetailVO> detail = productService.getOrderDetail(o_no);
		OrderVO order = productService.selectOrder(o_no);
		
		mnv.addObject("order", order);
		mnv.addObject("detail", detail);
		mnv.setViewName("/product/orderDetail");
		return mnv;
	}
	
	@RequestMapping("/orderRegist")
	public ModelAndView orderRegist(ModelAndView mnv, HttpSession session) throws SQLException {
		String c_no = (String) session.getAttribute("c_no");
		List<DraftVO> draft = productService.getOrderDraft(c_no);
		String e_name = (String) session.getAttribute("e_name");
		
		mnv.addObject("e_name", e_name);
		mnv.addObject("draft", draft);
		mnv.setViewName("/product/orderRegist");
		return mnv;
	}
	
	@RequestMapping("/document")
	public ModelAndView document(ModelAndView mnv, String dr_no, HttpSession session) throws SQLException {
		String fileName = productService.getFileName(dr_no);
		
		String uploadPath = session.getServletContext().getRealPath("/resources/documents/"); // 파일 경로
				
		String saveFile = (uploadPath+fileName); // 파일경로 + 파일이름
        List<String> data = new ArrayList<>();
		try {
            // 엑셀 파일 로드
            LoadOptions loadOptions = new LoadOptions();
            Workbook workbook = new Workbook(saveFile, loadOptions);

            // 첫 번째 시트 가져오기
            Worksheet worksheet = workbook.getWorksheets().get(0);

            // 모든 행을 반복하여 데이터를 2차원 List에 저장
            Cells cells = worksheet.getCells();
            int maxRow = cells.getMaxDataRow() + 1;
            int maxColumn = cells.getMaxDataColumn() + 1;
            for (int row = 0; row < maxRow; row++) {
                for (int column = 0; column < maxColumn; column++) {
                    // 각 셀의 데이터를 문자열로 변환하여 2차원 리스트에 추가
                    Cell cell = cells.get(row, column);
                    if(cell.getStringValue().equals("") || cell.getStringValue() == null) {
                    } else {
                    	data.add((String)cell.getStringValue());
                    }
                }
            }
            // 데이터 확인
                for (int i = 0; i < data.size(); i++) {
                    System.out.println(i + "번쨰 = " + data.get(i));
                    System.out.println(i + "번쨰 타입 = "+ data.get(i).getClass());
                }

            // Clean up resources
            workbook.dispose();
        } catch (Exception e) {
            e.printStackTrace();
        }
		Map<String, List<String>> data2 = new HashMap<>();
		List<String> name = new ArrayList<>();
		List<String> quantity = new ArrayList<>();
		int a = 1;
		for(int i = 15; i < data.size(); i++) {
			if(data.get(i).trim().equals("금액 총 합계  :")) {
				break;
			}
			if(i % 2 == 1 && a % 2 == 1) {
				name.add(data.get(i));
				a++;
			} else if (i % 2 == 1 && a % 2 == 0) {
				quantity.add(data.get(i));
				a++;
			}
		}
		data2.put("name", name);
		data2.put("quantity", quantity);
		mnv.addObject("quantity", quantity);
		mnv.addObject("name", name);
		System.out.println(name);
		System.out.println(quantity);
		System.out.println(data2.get("quantity"));
		System.out.println(data2.get("name"));
		mnv.addAllObjects(data2);
		mnv.setViewName("/product/orderRegist");
		return mnv;
	}
	
	
}
