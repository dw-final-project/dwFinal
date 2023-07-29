package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.WhDAO;
import kr.or.dw.vo.WhVO;

@Service
public class WhServiceImpl implements WhService{
	
	@Autowired WhDAO whDAO;
	
	@Override
	public Map<String, Object> selectWhList(SearchCriteria cri) throws SQLException {
		
		List<WhVO> whList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);	// RowBounds : 쿼리에서 페이징 처리된 결과를 알아서 필요한 만큼 가져온다.
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기
		whList = whDAO.selectSearchWhList(cri, rowBounds);
		
		// 전체 board 갯수
		int totalCount = whDAO.selectSearchWhListCount(cri);
		
		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("whList", whList);
		dataMap.put("pageMaker", pageMaker);
		
		
		// 제품의 이름을 담을 객체를 선언한다.
		// 현재 해당하는 생산입고 게시글에서 창고번호를 조회하고 매퍼에서 가져온 창고명을 넣어준다.
		for(int i = 0; i < whList.size(); i++) {
			String getWh_no = whList.get(i).getWh_no();
			List<String> productName = whDAO.selectProductName(getWh_no); // 해당 pr_no 의 pr_name 값을 가져온다.
			String pr_name = "";
			if (productName.size() == 1) {
				pr_name = productName.get(0);
			} else {
				pr_name = productName.get(0) + " 외 " + (productName.size() - 1) + "건";
			}
			
			whList.get(i).setPr_name(pr_name);
		}

		return dataMap;
	
	}

	@Override
	public void registWh(List<WhVO> whDetailVoList) throws SQLException {
		
		System.out.println("WhServiceImpl -> registWh 진입");
		
		WhVO whVo = null;
		
		whDAO.insertWh(whVo); 	// 게시글을 만들기 위한 다오
		
		String wh_no = whDetailVoList.get(0).getWh_no();
		System.out.println("wh_no : " + wh_no);
		
		for (int i = 0; i < whDetailVoList.size(); i++) {
			whVo.setWh_no(wh_no);
			whDAO.insertWhDetail(whVo); // 상세게시글을 만들기 위한 다오
		}
								
	}

}
