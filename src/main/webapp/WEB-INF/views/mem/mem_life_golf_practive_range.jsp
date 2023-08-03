<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<style>
  .seat {
    display: inline-block;
    width: 70px;
    height: 70px;
    margin: 5px;
    text-align: center;
    font-size: 18px;
    line-height: 70px;
    border: 2px solid #ccc;
    border-radius: 10px; /* 둥근 모서리를 원하는 값으로 설정 */
    cursor: pointer;
  }

  /* 미예약 좌석의 스타일 */
  .seat:not(.reserved) {
    background-color: white;
  }

  /* 예약된 좌석의 스타일 */
  .seat.reserved {
    background-color: rgb(6, 78, 59); /* primary 색상으로 변경 */
    color: white;
  }
  /* 왼쪽, 오른쪽 영역 스타일 */
  .left-area,
  .right-area {
    float: left;
    width: 300px;
  }

  /* 오른쪽 영역 스타일 */
  .right-area {
    margin-left: 5px;
  }

  /* 줄 간격 조정을 위해 추가한 스타일 */
  .row {
    margin-bottom: 5px;
  }


  .seat-container {
      display: flex;
  }

  .seat {
      /* 기타 스타일은 여기에 두세요. */
      display: flex;
      align-items: center;
      justify-content: center;
      width: 50px;
      height: 50px;
  }

  .reservModal{
  display: none;
  }

</style>

<!-- BEGIN: Menu -->
<div class="col-span-12 lg:col-span-3 2xl:col-span-2">
	<div class="intro-y box bg-primary p-5 mt-0 text-lg" style="height: 100%;">
		<nav class="side-nav">
			<ul>
				<li><a href="/mem/life/library" class="side-menu">
						<div class="side-menu__icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" icon-name="home" data-lucide="home" class="lucide lucide-home block mx-auto"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
						</div>
						<div class="side-menu__title">도서관</div>
				</a></li>
				<li><a href="/mem/life/glfpr" class="side-menu">
						<div class="side-menu__icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								icon-name="box" data-lucide="box" class="lucide lucide-box">
								<path
									d="M21 16V8a2 2 0 00-1-1.73l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.73l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"></path>
								<polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
								<line x1="12" y1="22.08" x2="12" y2="12"></line></svg>
						</div>
						<div class="side-menu__title">스크린골프장</div>
				</a></li>
				<li><a href="/mem/life/gym" class="side-menu">
						<div class="side-menu__icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								icon-name="box" data-lucide="box" class="lucide lucide-box">
								<path
									d="M21 16V8a2 2 0 00-1-1.73l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.73l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"></path>
								<polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
								<line x1="12" y1="22.08" x2="12" y2="12"></line></svg>
						</div>
						<div class="side-menu__title">헬스장</div>
				</a></li>
				<li><a href="/mem/life/pool" class="side-menu">
						<div class="side-menu__icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								icon-name="box" data-lucide="box" class="lucide lucide-box">
								<path
									d="M21 16V8a2 2 0 00-1-1.73l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.73l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"></path>
								<polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
								<line x1="12" y1="22.08" x2="12" y2="12"></line></svg>
						</div>
						<div class="side-menu__title">수영장</div>
				</a></li>
				<li><a href="/mem/life/readingroom" class="side-menu">
						<div class="side-menu__icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								icon-name="box" data-lucide="box" class="lucide lucide-box">
								<path
									d="M21 16V8a2 2 0 00-1-1.73l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.73l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"></path>
								<polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
								<line x1="12" y1="22.08" x2="12" y2="12"></line></svg>
						</div>
						<div class="side-menu__title">독서실</div>
				</a></li>
			</ul>
		</nav>
	</div>
</div>
<!-- END: Menu -->
<!-- BEGIN: Body -->
<div class="bdy col-span-12 lg:col-span-9 2xl:col-span-10">

	<h5 class="text-lg font-medium leading-none mt-0 mr-auto">생활편의서비스 &gt; 스크린 골프장</h5>
	<!-- BEGIN: 시설 소개카드 -->
	<div class="intro-y box mt-3" style="width: 980px;  float: center;">
		<div class="flex flex-col sm:flex-row items-center p-3 border-b border-slate-200/60">
		    <h3 class="font-large text-base ml-3 flex font-bold text-lg">시설 소개&nbsp;&nbsp;</h3>
		</div>
		<div id="center-mode-slider" class="p-3">
		    <div class="mx-8">
		        <div class="center-mode">
		            <div id="img_1" class="recom h-60 px-2">
		                <div class="h-full bg-primary rounded-md">
		                    <div class="w-40 h-full image-fit rounded-md" style="width: 100%; height: 100%;">
		                        <img id="img1" alt="img1" data-action="zoom" class="w-full h-full rounded-md" src="/resources/images/life/golf.jpg">
		                    </div>
		                </div>
		            </div>
		            <div id="img_2" class="recom h-60 px-2">
		                <div class="h-full bg-primary rounded-md">
		                    <div class="w-40 h-full image-fit rounded-md" style="width: 100%; height: 100%;">
		                        <img id="img2" alt="img2" data-action="zoom" class="w-full h-full rounded-md" src="/resources/images/life/golf3.jpg">
		                    </div>
		                </div>
		            </div>
		            <div id="img_3" class="recom h-60 px-2">
		                <div class="h-full bg-primary rounded-md">
		                    <div class="w-40 h-full image-fit rounded-md" style="width: 100%; height: 100%;">
		                        <img id="img3" alt="img3" data-action="zoom" class="w-full h-full rounded-md" src="/resources/images/life/golf2.jpg">
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
			<div>
		</div>
	</div>
	<!-- END: 시설소개 카드 끝 -->
	<div class="alert alert-dismissible show box bg-primary text-white flex items-center mt-5" role="alert">
	    <span style="font-size: 17px; margin-left: 350px;" >
	    	&nbsp;실시간 이용인원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	<span style="font-weight: bold;">6</span>명
	    </span>
	</div>
	<!-- 시설 유의사항 -->
	<div class="intro-y box" style="width: 980px; height: 370px; margin-top: 20px;">
	    <div class="" style="float: left; width:850px;">
	        <input class="font-large text-base ml-3 mt-3 pt-3 pl-3 flex font-bold text-lg" style="font-size: 20px;" value="안내사항" readonly />
	        <textarea class="borderless" style="border: none; font-size: 20px; line-height: 1.5; width: 780px; height: 300px; margin-right:10px;" readonly>
           ◆ 운영시간
              - 오전 12시 ~ 오후 20시
              - 공휴일 및 일요일 휴무

           ◆ 유의사항
              - 회원등록 및 강습은 카운터에 문의바랍니다.
              - 시설이용 예약은 아파트 홈페이지 마이페이지에서도 가능합니다.
              - 결제 금액은 세대 관리비에 부과되며, 홈페이지 마이페이지 세부내역에서 조회가능합니다.
	        </textarea>
	    </div>
	    <!-- 시설 유의사항 끝 -->
	</div>
	<!-- END: Body -->
	</div>

	<!-- 좌석창 모달에 띄우기 -->
	<div class="text-center">
		<!-- BEGIN: Large Modal Toggle -->
		<a href="javascript:;" data-tw-toggle="modal" data-tw-target="#large-modal-size-preview" class="btn btn-primary mr-1 mb-2 mt-3">시설 예약하기</a>
		<!-- END: Large Modal Toggle -->
	</div>
	 <!-- BEGIN: Large Modal Content -->
	<div id="large-modal-size-preview" class="modal" tabindex="-1" aria-hidden="true">
	 	<div class="modal-dialog modal-lg">
			<div class="modal-content" style="width:800px; height:800px; padding:25px;">
				<div class="flex flex-col sm:flex-row items-center p-3 border-b border-slate-200/60">
					<h2 class="font-large text-base ml-3 flex font-bold text-lg">스크린골프장 좌석예약</h2>
				</div>
				<div class="row mt-5" style="margin-left:40px; height  margin-top:50px;">
					<div class="seat-container">
					    <c:forEach var="selectRoom" items="${selectRoom}" varStatus="stat">
			                <span class="text-xs px-1 mr-1 seat" id="room${stat.index + 1}" onclick="reservModal(${selectRoom.roomNo})">${stat.index + 1}</span>
					    </c:forEach>
					</div>
				 <table class="table mt-5">
			         <thead id="theadbody" class="table-light">
			             <tr>
			                 <th class="whitespace-nowrap">이용가능시간</th>
			                 <th class="whitespace-nowrap">예약자</th>
			                 <th class="whitespace-nowrap" style="margin-left: 20px;">예약상태</th>
			             </tr>
			         </thead>
			         <tbody id= "tbody">
			             <tr>
			                 <td>12:00 ~ 13:00</td>
			                 <td id="tdName"></td>
			                 <td id="tdButton1"></td>
			             </tr>
			             <tr>
			                 <td>13:00 ~ 14:00</td>
			                 <td id="tdName2"></td>
			                 <td id="tdButton2"></td>
			             </tr>
			             <tr>
			                 <td>13:00 ~ 14:00</td>
			                 <td id="tdName3"></td>
			                 <td id="tdButton3"></td>
			             </tr>
			             <tr>
			                 <td>14:00 ~ 15:00</td>
			                 <td id="tdName4"></td>
			                 <td id="tdButton4"></td>
			             </tr>
			             <tr>
			                 <td>15:00 ~ 16:00</td>
			                 <td id="tdName5"></td>
			                 <td id="tdButton5"></td>
			             </tr>
			             <tr>
			                 <td>16:00 ~ 17:00</td>
			                 <td id="tdName6"></td>
			                 <td id="tdButton6"></td>
			             </tr>
			             <tr>
			                 <td>17:00 ~ 18:00</td>
			                 <td id="tdName7"></td>
			                 <td id="tdButton7"></td>
			             </tr>
			             <tr>
			                 <td>18:00 ~ 19:00</td>
			                 <td id="tdName8"></td>
			                 <td id="tdButton8"></td>
			             </tr>
			             <tr>
			                 <td>19:00 ~ 20:00</td>
			                 <td id="tdName9"></td>
			                 <td id="tdButton9"></td>
			             </tr>
			         </tbody>
			     </table>
				</div>
			</div>
		</div>
	</div>
</div>

<sec:authentication property="principal.userVO.memberVO" var="memVO" />
<input type="hidden" name="memId" value="${memVO.memId}">
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#main_menu").html("생활편의서비스");
	$("#sub_menu").html("스크린골프장");
	jQuery("#room1").click();
	var title = $("#sub_menu").text();
	var arr_menu = $(".side-menu__title");
	var cur_menu = null;
	for (var i = 0; i < arr_menu.length; i++) {
		if (arr_menu[i].innerText == title) {
			cur_menu = arr_menu[i];
		}
	}
	$(cur_menu).parent().addClass("side-menu--active");

	$(".side-nav > ul > li > .side-menu").on("click", function() {
		// 좌측 메뉴 선택 시 효과 적용
		$(".side-menu").removeClass("side-menu--active");
		$(this).addClass("side-menu--active");

		// 메뉴 경로 표시 (좌측 메뉴)
		var sub = $(this).find(".side-menu__title").text();
		console.log(sub.trim());
		$("#sub_menu").html(sub.trim());
	});
});


function reservModal(roomNo) {
	$(".seat").css("background","white");
	$("#room"+roomNo).css("background-color","#064e3b");
	if(roomNo == 1){


		tdName.innerHTML = 'difjwls';
		tdName2.innerHTML = '';
		tdName3.innerHTML = 'asjek2';
		tdName4.innerHTML = 'fhrfd';
		tdName5.innerHTML = '';
		tdName6.innerHTML = 'gtjygf';
		tdName7.innerHTML = '';
		tdName8.innerHTML = 'sdfg43';
		tdName9.innerHTML = '';

		tdButton1.innerHTML = '<button class=\'btn btn-rounded w-20\'>예약불가</button>';
		tdButton3.innerHTML = '<button class=\'btn btn-rounded w-20\'>예약불가</button>';
		tdButton4.innerHTML = '<button class=\'btn btn-rounded w-20\'>예약불가</button>';
		tdButton6.innerHTML = '<button class=\'btn btn-rounded w-20\'>예약불가</button>';
		tdButton8.innerHTML = '<button class=\'btn btn-rounded w-20\'>예약불가</button>';
		tdButton2.innerHTML = '<button class=\'btn btn-rounded-primary  w-20\'>예약가능</button>';
		tdButton5.innerHTML = '<button class=\'btn btn-rounded-primary  w-20\'>예약가능</button>';
		tdButton7.innerHTML = '<button class=\'btn btn-rounded-primary  w-20\'>예약가능</button>';
		tdButton9.innerHTML = '<button class=\'btn btn-rounded-primary  w-20\'>예약가능</button>';
	  function onButtonClick() {
// 		  prompt('입력받기', '메시지를 입력해주세요');
		    if(confirm("예약 하시겠습니까?")){

		    	alert("13:00 ~ 14:00 예약되었습니다.");
		    	tdName2.innerHTML = "${memVO.memId}";
		    	tdButton2.innerHTML = '<button class=\'btn btn-rounded-pending w-20\'>취소</button>';
		    }
		  }
		  tdButton2.querySelector('button').onclick = onButtonClick;
	}

	if(roomNo == 2){
		tdName.innerHTML = 'deiwu';
		tdName2.innerHTML = 'dfoejks';
		tdName3.innerHTML = 'agijek';
		tdName4.innerHTML = 'asmdow';
		tdName5.innerHTML = 'aasoel';
		tdName6.innerHTML = 'dnigrsl';
		tdName7.innerHTML = '';
		tdName8.innerHTML = 'qkdjfir';
		tdName9.innerHTML = '';

		tdButton1.innerHTML = '<button class=\'btn btn-rounded w-20\'>예약불가</button>';
		tdButton2.innerHTML = '<button class=\'btn btn-rounded w-20\'>예약불가</button>'
		tdButton3.innerHTML = '<button class=\'btn btn-rounded w-20\'>예약불가</button>';
		tdButton4.innerHTML = '<button class=\'btn btn-rounded w-20\'>예약불가</button>';
		tdButton5.innerHTML = '<button class=\'btn btn-rounded w-20\'>예약불가</button>';
		tdButton6.innerHTML = '<button class=\'btn btn-rounded w-20\'>예약불가</button>';
		tdButton7.innerHTML = '<button class=\'btn btn-rounded-primary  w-20\'>예약가능</button>';
		tdButton8.innerHTML = '<button class=\'btn btn-rounded w-20\'>예약불가</button>';
		tdButton9.innerHTML = '<button class=\'btn btn-rounded-primary  w-20\'>예약가능</button>';
	}
}



</script>


