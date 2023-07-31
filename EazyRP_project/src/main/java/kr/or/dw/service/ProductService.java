package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.BsheetVO;
import kr.or.dw.vo.BuyDetailVO;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.DraftVO;
import kr.or.dw.vo.O_DetailVO;
import kr.or.dw.vo.OrderVO;
import kr.or.dw.vo.Pro_whVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.SiVO;
import kr.or.dw.vo.WareHouseVO;


public interface ProductService {

	Map<String, Object> selectProductList(SearchCriteria cri) throws SQLException;

	Map<String, Object> getB_sheet(Map<String, Object> dataMap) throws SQLException;

	BsheetVO getSheet(String sheet_no) throws SQLException;

	List<BuyDetailVO> getBuyDetail(String sheet_no) throws SQLException;

	List<CompanyVO> getCompanyList(SearchCriteria cri) throws SQLException;

	int insertProductBuy(BsheetVO sheet) throws SQLException;

	void insertProductDetail(List<BuyDetailVO> detail) throws SQLException;

	Map<String, Object> allOrderList(Map<String, Object> dataMap) throws SQLException;

	List<O_DetailVO> getOrderDetail(String o_no) throws SQLException;

	OrderVO selectOrder(String o_no) throws SQLException;

	List<DraftVO> getOrderDraft(String c_no) throws SQLException;

	String getFileName(String dr_no) throws SQLException;

	List<ProductVO> getContents(List<String> name, String c_no) throws SQLException;

	String getC_no(String c_name) throws SQLException;

	List<Pro_whVO> getWhList(String pr_name) throws SQLException;

	int orderRegist(OrderVO order) throws SQLException;

	void insertOrderDetail(List<O_DetailVO> detail) throws SQLException;

	void orderCancel(int o_no, String dr_no) throws SQLException;
	
}
