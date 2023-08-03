package kr.or.ddit.mem.notice;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.vo.NtcBbsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/mem/ntcbbs")
@Controller
public class NtcBbsController {

	@Inject
	NtcBbsService ntcBbsService;

	// 공지사항
	@GetMapping("")
	public String noticeBoard() {
		log.info("noticeBoard");
		return "mem/mem_notice_board";
	}

	@ResponseBody
	@GetMapping("/postList")
	@CrossOrigin(origins = "*", allowedHeaders = "*", methods = { RequestMethod.GET, RequestMethod.POST,
    	RequestMethod.PUT, RequestMethod.DELETE })
	public JSONArray postList() {
		List<NtcBbsVO> ntcBbsVOList = this.ntcBbsService.selectAll();
    	log.info("postList - ntcBbsVOList : " + ntcBbsVOList);
    	for (NtcBbsVO ntcBbsVO : ntcBbsVOList) {
			ntcBbsVO.setPstId(ntcBbsVO.getPstId().substring(3));
			ntcBbsVO.setFrstWrterId("관리자");
		}
    	return (JSONArray) ntcBbsVOList;
	}
}
