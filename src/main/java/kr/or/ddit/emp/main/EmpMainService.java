package kr.or.ddit.emp.main;

import java.util.List;

import kr.or.ddit.vo.AtrzDocVO;
import kr.or.ddit.vo.DclzVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ScheduleVO;
import kr.or.ddit.vo.SmsVO;

public interface EmpMainService {

	public List<SmsVO> selectMyChat(SmsVO smsVO);

	public EmpVO detailEmp(String empId);

	// 일정 가져오기 전체일정 and 개인 일정
	public List<ScheduleVO> selectAllSchedule(String empId);

	//일정 정보 가져오기
	public ScheduleVO detailSchedule(String scheNo);

	// 일정 등록하기
	public int registSchedule(ScheduleVO scheduleVO);

	// 일정 수정하기
	public int updateSchedule(ScheduleVO scheduleVO);

	// 일정 삭제하기
	public int deleteSchedule(ScheduleVO scheduleVO);

	// 출근 시간 등록
	public int registerDclz(DclzVO dclzVO);

	// 특정 직원 퇴근 시간 업데이트
	public int updateLvffcTm(DclzVO dclzVO);

	// 결재문서 목록
	public List<AtrzDocVO> mainAtrzList(String empId);
}
