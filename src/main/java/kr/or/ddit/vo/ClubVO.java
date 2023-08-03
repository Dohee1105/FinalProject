package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ClubVO {

	private String clbId;
	private String clbClCd;
	private String frstWrterId;
	private String fsrtWritingTm;
	private String clbNm;
	private int clbAge;
	private String clbIntrcn;
	private String clbImg;
	private int clbTotNmpr;
	private int clbNowNmpr;
	private String delYn;
	private String confmYn;
	private String lastUpdusrId;
	private String lastUpdtTm;
	private String clbClNm;
	private MultipartFile picture;
	// 소모임 가입 날짜를 위한 필드
	private String sbscrbYmd;
	// 분류별 소모임 개수, 회원 수를 위한 필드
	private String cnt;
	// 각 소모임별 남, 녀 회원 수를 위한 필드
	private String cntMale;
	private String cntFeMale;
}
