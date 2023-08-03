package kr.or.ddit.emp.main;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.AtrzDocMapper;
import kr.or.ddit.mapper.DclzMapper;
import kr.or.ddit.mapper.EmpMapper;
import kr.or.ddit.mapper.ScheduleMapper;
import kr.or.ddit.mapper.SmsMapper;
import kr.or.ddit.vo.AtrzDocVO;
import kr.or.ddit.vo.DclzVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ScheduleVO;
import kr.or.ddit.vo.SmsVO;


@Service
public class EmpMainServiceImpl implements EmpMainService{

	@Inject
	EmpMapper empMapper;
	@Inject
	SmsMapper smsMapper;
	@Inject
	ScheduleMapper scheduleMapper;
	@Inject
	DclzMapper dclzMapper;
	@Inject
	AtrzDocMapper atrzDocMapper;

	@Override
	public List<SmsVO> selectMyChat(SmsVO smsVO) {
		return this.smsMapper.selectMyChat(smsVO);
	}

	@Override
	public EmpVO detailEmp(String empId) {
		return this.empMapper.detailEmp(empId);
	}

	@Override
	public List<ScheduleVO> selectAllSchedule(String empId) {
		return this.scheduleMapper.selectAllSchedule(empId);
	}

	@Override
	public int registerDclz(DclzVO dclzVO) {
		return this.dclzMapper.registerDclz(dclzVO);
	}

	@Override
	public int updateLvffcTm(DclzVO dclzVO) {
		return this.dclzMapper.updateLvffcTm(dclzVO);
	}

	@Override
	public List<AtrzDocVO> mainAtrzList(String empId) {
		return this.atrzDocMapper.mainAtrzList(empId);
	}

	@Override
	public int registSchedule(ScheduleVO scheduleVO) {
		return this.scheduleMapper.registSchedule(scheduleVO);
	}

	@Override
	public int updateSchedule(ScheduleVO scheduleVO) {
		return this.scheduleMapper.updateSchedule(scheduleVO);
	}

	@Override
	public int deleteSchedule(ScheduleVO scheduleVO) {
		return this.scheduleMapper.deleteSchedule(scheduleVO);
	}

	@Override
	public ScheduleVO detailSchedule(String scheNo) {
		int no = Integer.parseInt(scheNo);
		return this.scheduleMapper.detailSchedule(no);
	}
}
