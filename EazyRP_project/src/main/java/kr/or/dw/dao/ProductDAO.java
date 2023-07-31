package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.BsheetVO;
import kr.or.dw.vo.BuyDetailVO;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.DraftVO;
import kr.or.dw.vo.NoteVO;
import kr.or.dw.vo.O_DetailVO;
import kr.or.dw.vo.OrderVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.SiVO;

@Mapper
public interface ProductDAO {

	List<ProductVO> selectSearchProductList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	int selectSearchProductListCount(SearchCriteria cri) throws SQLException;

	List<BsheetVO> getB_sheet(Map<String, Object> dataMap2, RowBounds rowBounds) throws SQLException;

	int selectSearchNoteListCount(Map<String, Object> dataMap2) throws SQLException;

	List<BuyDetailVO> getBuyDetail(String sheet_no) throws SQLException;

	BsheetVO getSheet(String sheet_no) throws SQLException;

	List<CompanyVO> getCompanyList(SearchCriteria cri) throws SQLException;

	void insertProductBuy(BsheetVO sheet) throws SQLException;

	int insertSheetNo() throws SQLException;

	void insertProductDetail(BuyDetailVO vo) throws SQLException;

	List<String> getSheet_no(String pr_no1, List<String> pr_no) throws SQLException;

	List<String> getPr_no(SearchCriteria cri) throws SQLException;

	OrderVO insertOrderList(String sheet, String c_no) throws SQLException;

	List<OrderVO> allOrderList(Map<String, Object> dataMap, RowBounds rowBounds) throws SQLException;

	int orderCount(Map<String, Object> dataMap) throws SQLException;

	List<O_DetailVO> getOrderDetail(String o_no) throws SQLException;

	OrderVO selectOrder(String o_no) throws SQLException;

	List<DraftVO> getOrderDraft(String c_no) throws SQLException;

	String getFileName(String dr_no) throws SQLException;


	
}
