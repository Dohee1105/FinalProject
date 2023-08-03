package kr.or.ddit.mem.bid;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.vo.BidBbsVO;
//import kr.or.ddit.vo.ScndhdRecomVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/mem/bid/bidntcbbs")
@Controller
public class BidNtcBbsController {

	@Inject
	BidNtcBbsService bidNtcBbsService;

	// 입찰공고
	@GetMapping("")
	public String bidNoticeBoard() {
		return "mem/mem_bid_notice_board";
	}

	@ResponseBody
    @GetMapping("/postList")
    @CrossOrigin(origins = "*", allowedHeaders = "*", methods = { RequestMethod.GET, RequestMethod.POST,
         RequestMethod.PUT, RequestMethod.DELETE })
	public JSONArray postList() {
		List<BidBbsVO> BidBbsVOList = this.bidNtcBbsService.selectAll();
    	log.info("postList - BidBbsVOList : " + BidBbsVOList);
    	for (BidBbsVO bidBbsVO : BidBbsVOList) {
    		bidBbsVO.setPstId(bidBbsVO.getPstId().substring(3));
    		bidBbsVO.setFrstWrterId("관리자");
		}
    	return (JSONArray) BidBbsVOList;
	}
}
