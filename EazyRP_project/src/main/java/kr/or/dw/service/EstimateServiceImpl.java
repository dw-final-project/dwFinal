package kr.or.dw.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.dao.EstimateDAO;
import kr.or.dw.vo.EstimateVO;
import kr.or.dw.vo.ProductVO;

@Service
public class EstimateServiceImpl implements EstimateService {
	
	@Autowired
	private EstimateDAO estimateDAO;
	
	@Override
	public Map<String, Object> selectEstimList() throws SQLException {
		
		List<Map<String, Object>> estimList = estimateDAO.selectEstimList();
//		List<EstimateVO> estimList = new ArrayList<EstimateVO>();
//		Map<String, Integer> pr_size = new HashMap<String, Integer>();
//		Map<String, Integer> sumAmount = new HashMap<String, Integer>();
//		Map<String, String> enameList = new HashMap<String, String>();
//		Map<String, String> cnameList = new HashedMap<String,String>();
//		Map<String, String> prnameList = new HashMap<String,String>();
//		
//		int count = 0;
		
		
//		for(EstimateVO est : estNoList) {
//			String est_no = est.getEst_no();
//			List<EstimateVO> estDetailList = estimateDAO.selectDetail(est_no);
//			EstimateVO estimate = new EstimateVO();
//			estimate.setEst_no(est_no);
//			estimate.setAmount(estDetailList.get(0).getAmount()); 
//			estimate.setC_no(estDetailList.get(0).getC_no());
//			estimate.setEmp_no(estDetailList.get(0).getEmp_no());
//			estimate.setEstdetail_no(estDetailList.get(0).getEstdetail_no());
//			estimate.setFc_no(estDetailList.get(0).getFc_no());
//			estimate.setFiles(estDetailList.get(0).getFiles());
//			estimate.setPr_no(estDetailList.get(0).getPr_no());
//			estimate.setProgress(estDetailList.get(0).getProgress());
//			estimate.setQuantity(estDetailList.get(0).getQuantity());
//			estimate.setRegdate(estDetailList.get(0).getRegdate());
//			estimate.setWh_no(estDetailList.get(0).getWh_no());
//			
//			int amountSum = 0;
//			int prno = estDetailList.size();
//			for(EstimateVO estd : estDetailList) {
//				amountSum += estd.getAmount();
//			}
//			
//			String ename = estimateDAO.selectEname(estimate.getEmp_no());
//			String cname = estimateDAO.selectCname(estimate.getC_no());
//			String prname = estimateDAO.selectPrname(estimate.getPr_no());
//			
//			prnameList.put(est_no, prname);
//			cnameList.put(est_no,cname);
//			enameList.put(est_no, ename);
//			sumAmount.put(est_no, amountSum);
//			pr_size.put(est_no, prno-1);
//			estimList.add(estimate);
//			
//		}
//		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("estimList", estimList);
//		dataMap.put("sumAmount", sumAmount);
//		dataMap.put("pr_size", pr_size);
//		dataMap.put("enameList", enameList);
//		dataMap.put("cnameList", cnameList);
//		dataMap.put("prnameList",prnameList);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> selectDetail(String est_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Map<String, Object> est = (Map<String, Object>) estimateDAO.selectDetail(est_no);
		
		List<Map<String, Object>> estPr = estimateDAO.forEstimList(est_no);
		
		dataMap.put("estPr",estPr);
		dataMap.put("est", est);
		
		return dataMap;
	}

	@Override
	public void estimateInsert(EstimateVO vo) throws SQLException {
		 estimateDAO.insertEstimate(vo);
		
	}


	@Override
	public List<ProductVO> getProduct(Map<String, String> map) throws SQLException {
		
		List<ProductVO> product = null;
		product = estimateDAO.getProduct(map);
		return product;
	}

	@Override
	public List<ProductVO> getProductList() throws SQLException {
		List<ProductVO> product = null;
		product = estimateDAO.getProductList();
		return product;
	}
	
	
	
	
	
}
