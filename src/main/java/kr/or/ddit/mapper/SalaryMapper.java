package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.SalaryVO;

public interface SalaryMapper {

	//월별로 급여 데이터 불러오기
	public List<SalaryVO> getSalaryData(String month);

}
