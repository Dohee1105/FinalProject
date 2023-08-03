package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.ScheduleVO;

public interface ScheduleMapper {
	//일정 가져오기 전체일정 and 개인 일정
	public List<ScheduleVO> selectAllSchedule(String empId);

	//일정 정보 가져오기
	public ScheduleVO detailSchedule(int scheNo);

	//일정 등록하기
	public int registSchedule(ScheduleVO scheduleVO);

	//일정 수정하기
	public int updateSchedule(ScheduleVO scheduleVO);

	//일정 삭제하기
	public int deleteSchedule(ScheduleVO scheduleVO);
}
