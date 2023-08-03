<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- BEGIN: Menu -->
<div class="col-span-12 lg:col-span-3 2xl:col-span-2">
    <div class="intro-y box bg-primary p-5 mt-0 text-lg" style="height: 100%">
    	<nav class="side-nav">
		    <ul>
		        <li>
		            <a href="/mem/cmnt/neighborbbs" class="side-menu">
		                <div class="side-menu__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" icon-name="home" data-lucide="home" class="lucide lucide-home"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"></path></svg></div>
		                <div class="side-menu__title"> 우리동네 </div>
		            </a>
		        </li>
		        <li>
		            <a href="/mem/cmnt/secondhandbbs" class="side-menu">
		                <div class="side-menu__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" icon-name="box" data-lucide="box" class="lucide lucide-box"><path d="M21 16V8a2 2 0 00-1-1.73l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.73l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg></div>
		                <div class="side-menu__title"> 중고장터 </div>
		            </a>
		        </li>
		        <li>
		            <a href="/mem/cmnt/clubbbs" class="side-menu">
		                <div class="side-menu__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" icon-name="box" data-lucide="box" class="lucide lucide-box"><path d="M21 16V8a2 2 0 00-1-1.73l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.73l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg></div>
		                <div class="side-menu__title"> 소모임 </div>
		            </a>
		        </li>
		        <li>
		            <a href="/mem/cmnt/freebbs" class="side-menu">
		                <div class="side-menu__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" icon-name="box" data-lucide="box" class="lucide lucide-box"><path d="M21 16V8a2 2 0 00-1-1.73l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.73l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg></div>
		                <div class="side-menu__title"> 자유게시판 </div>
		            </a>
		        </li>
		        <li>
		            <a href="/mem/cmnt/cvplbbs" class="side-menu">
		                <div class="side-menu__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" icon-name="box" data-lucide="box" class="lucide lucide-box"><path d="M21 16V8a2 2 0 00-1-1.73l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.73l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg></div>
		                <div class="side-menu__title"> 민원게시판 </div>
		            </a>
		        </li>
		    </ul>
		</nav>
    </div>
</div>
<!-- END: Menu -->
<!-- ////////////// 디테일 body 시작 //////////////-->
<div class="bdy col-span-12 lg:caol-span-9 2xl:col-span-10">
<!-- 입주민 정보 -->
<sec:authentication property="principal.userVO.memberVO" var="memVO" />
<c:set var="memId" value="${memVO.memId}" />
<!-- _csrf 권한 -->

<!-- 신고처리 form 태그 시작 -->
<form id="frm_deClar" action="/mem/cmnt/secondhandbbs/declarpost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<input type="hidden" name="sttemntPstId" value="${detailOne.pstId}" />
	<input type="hidden" name="aplcntId" value="${memId}" />
	<input type="hidden" name="rspndnt" value="${detailOne.frstWrterId}"/>
	<input type="hidden" name="sttemntRsn" id="sttemntRsn" />
	<sec:csrfInput/>
</form>
<!-- 신고처리 form 태그 끝 -->

<form id="frm" method="get" enctype="multipart/form-data">
	<div class="intro-y news p-5 box mt-0">
		<h2 class="intro-y font-medium text-xl sm:text-2xl">
		    ${detailOne.pstSj}&nbsp;
		<!--///////// 중고장터 상품 상태 시작 ////////// -->
		<c:choose>
			<c:when test="${detailOne.ntslStts == '판매중'}">
				<span class="absolute top-0 bg-pending/80 text-white text-sm m-1 px-2 py-1 rounded z-10">${detailOne.ntslStts}</span>
			</c:when>
			<c:when test="${detailOne.ntslStts == '판매완료'}">
				<span class="absolute top-0 bg-green-700 bg-opacity-80 text-white text-sm m-1 px-2 py-1 rounded z-10">${detailOne.ntslStts}</span>
			</c:when>
		</c:choose>
		<!--///////// 중고장터 상품 상태 끝 ////////// -->
		</h2>
		<div class="w-full intro-y flex relative pt-6 items-center pb-3">
		    <!-- 작성자 -->
		    <div class="flex mr-auto">
		        <div class="intro-x mr-1 text-lg font-semibold">작성자 : ${detailOne.frstWrterId}</div>
		    </div>
		    <!-- ---- -->
		    <div class="flex">
			    <!-- ////// frstWrterId 와 memId가 같으면 수정, 삭제 버튼 보여짐 ///////-->
				<c:if test="${detailOne.frstWrterId eq memId}">
					<a href="/mem/cmnt/secondhandbbs" class="btn btn-primary mr-4">목록</a>
				    <a href="/mem/cmnt/secondhandbbs/update?pstId=${detailOne.pstId}" class="btn btn-primary mr-4 text-base">수정</a>
				    <button type="button" id="btnDelete" class="btn btn-outline-primary" value="${detailOne.pstId}">삭제</button>
				</c:if>
				<!-- ////// frstWrterId 와 memId가 같으면 수정, 삭제 버튼  ///////-->
			<!-- 신고하기 시작 -->
			<div class="text-center">
				<c:if test="${detailOne.frstWrterId  ne memId}">
					<a href="/mem/cmnt/secondhandbbs" class="btn btn-primary text-base py-1.5 mr-1">목록</a>
					<a href="javascript:;" data-tw-toggle="modal" data-tw-target="#header-footer-modal-preview" class="btn btn-outline-danger font-bold text-base py-1.5">신고하기</a>
				</c:if>
			</div>
			<div id="header-footer-modal-preview" class="modal" tabindex="-1" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" style="max-width: 600px;"> <!-- BEGIN: Modal Header -->

						<div class="modal-header text-center">
							<h2 class="font-medium text-base mr-auto">신고 사유</h2><a id="autoBtn" class="btn btn-secondary p-1 font-bold h-6 ml-2" style="width: 65px;"> 자동완성</a>
						</div>
						<div class="modal-body grid grid-cols-12 gap-4 gap-y-3">
							<div class="col-span-12 sm:col-span-6">
								<textarea style="width: 420px;"  rows="3" id="deClarRsn" type="text" class="form-control" placeholder="신고 사유.."></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<c:if test="${detailOne.frstWrterId ne memId}">
								<a id="btnDeclar" class="btn btn-primary" value="${detailOne.pstId}">신고</a>
							</c:if>
							<button type="button" data-tw-dismiss="modal" class="btn btn-outline-secondary w-15 mr-1">취소</button>
						</div>
			         </div>
			     </div>
			</div>
			<!-- 신고하기 끝 -->
		    </div>
		</div>
		<!-- 상품 목록 시작 -->
		<div class="intro-y flex text-xs sm:text-sm flex-col sm:flex-row items-center mt-0 pt-5 border-t border-slate-200/60">
			<div class="flex items-center">
				<div class="mr-auto">
					<h6 class="font-semibold text-lg">판매가 : <fmt:formatNumber value='${detailOne.scndhandPc}' type="number"/>원</h6>
				</div>
			</div>
			<div class="flex items-center ml-auto mr-5">
				<h6 class="font-semibold text-lg">조회수 : ${detailOne.rdcnt}</h6>
			</div>
			<div class="flex items-center">
				<h6 class="font-semibold text-lg">작성일 : ${detailOne.fsrtWritingTm}</h6>
			</div>
		</div>
		<!-- 상품 이미지 -->
		<div class="intro-y mt-6 grid grid-cols-1 sm:grid-cols-3 gap-4">
         	<c:forEach var="atchmnflDetailVO" items="${detailOne.atchmnflDetailList}" varStatus="stat">
			    <div class="nEWS__PREVIEW IMAGE-FIT">
		        	<img alt="Midone - HTML Admin Template" class="rounded-md" src="/imageView?filename=${bookdata.bookImg}${atchmnflDetailVO.flpth}/${atchmnflDetailVO.streFlNm}">
			    </div>
		    </c:forEach>
		</div>
		<!-- //////////////댓글 시작////////////// -->
		<div class="intro-y text-justify leading-relaxed mt-3 mb-3">
		    <div class="text-base sm:text-lg font-medium">${detailOne.pstCn}</div>
		</div>
		<!-- 상품 목록 끝 -->
		<!-- 댓글 정보-->
		<div class="intro-y mt-2 pt-5 border-t border-slate-200/60 dark:border-darkmode-400">
		    <div class="flex justify-between items-center">
		        <div class="text-base sm:text-lg font-medium">댓글수 0</div>
		    </div>
		    <!-- 댓글 입력 창 -->
			<div class="news__input relative mt-5">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" icon-name="message-circle" data-lucide="message-circle" class="lucide lucide-message-circle w-5 h-5 absolute my-auto inset-y-0 ml-6 left-0 text-slate-500"><path d="M21 11.5a8.38 8.38 0 01-.9 3.8 8.5 8.5 0 01-7.6 4.7 8.38 8.38 0 01-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 01-.9-3.8 8.5 8.5 0 014.7-7.6 8.38 8.38 0 013.8-.9h.5a8.48 8.48 0 018 8v.5z"></path></svg>
				<div class="flex">
					<textarea id="freeCmnt" name="freeCmnt" class="form-control border-transparent bg-slate-100 pl-16 py-6 resize-none" rows="1" placeholder="댓글을 입력해주세요." style="width:860px;"></textarea>
					<a id="cmntBtn" name="cmntBtn" class="btn btn-primary text-base py-1.5 w-14 h-10 mt-7" style="margin-left:20px;">등록</a>
				</div>
<%-- 				<input id="pstId" name="pstId" type="hidden" value="${detailOne.pstId}" /> --%>
			</div>
			<!-- 댓글 입력 창 끝 -->
		</div>
   	</div>
</form>
</div>
<!-- ////////////// 디테일 body 끝 //////////////-->

<script type="text/javascript">

// 게시글 신고 테이블에 데이터 저장
let formObj = document.querySelector("#frm_deClar");
$("#btnDeclar").on("click", function(){

	let deClarRsn = document.getElementById('deClarRsn').value;
	console.log("deClarRsn : " + deClarRsn);
	$("#sttemntRsn").val(deClarRsn);

	if(confirm("신고하시겠습니까?")){
		alert("정상적 신고 처리가 되었습니다.")
		formObj.submit();
	}



});

//등록된 게시글 삭제 처리
$("#btnDelete").on("click", function(){
   //<input id="crud-form-1" name="bookNo"
   let pstId = $(this).val();
   //json 오브젝트
   let data = {"pstId":pstId};
   console.log("data : " + JSON.stringify(data));

   jQuery.ajax({
      url: "/mem/cmnt/secondhandbbs/deletePost",
      contentType:"application/json;charset=utf-8",
      data: JSON.stringify(data),
      type: "post",
      dataType: "text",
     beforeSend : function(xhr) {
        xhr.setRequestHeader("${_csrf.headerName}",
              "${_csrf.token}");
     },
      success: function(result){
         console.log("result : " + result);
         if(result=="success"){
        	alert("삭제하시겠습니까?")
        	alert("게시글이 삭제되었습니다.")
            location.href="/mem/cmnt/secondhandbbs";
         }else{
            alert("삭제에 실패하였습니다.");
         }
      }
   });
});

$("#autoBtn").on("click", function() {
    console.log("autoBtn 눌렸습니다.");
    $("#deClarRsn").val("상비약은 중고장터 판매 금지 품목으로 알고있습니다. 빠르게 처리해주세요."); // 자동완성할 내용을 지정합니다.
 });


//게시글에 등록된 댓글 불러오기
$(function(){

	jQuery.ajax({
	      url: "/mem/cmnt/secondhandbbs/detail?pstId=" + `${param.pstId}`,
	      type: "get",
	      success: function(result) {
	    	  console.log("res>>",result);
	    	  cmntView(result);
		},
	});


	//게시글에 댓글 작성하기
	$("#cmntBtn").on("click", function() {

	   var pstId = $("#pstId").val();
	   var cmntCn = $("#freeCmnt").val();
	   var memId = "${memId}";

	   var data = {
			   "pstId": pstId,
			   "cmntCn": cmntCn,
			   "memId": memId
			   };
	   console.log(data);

	   jQuery.ajax({
	      url: "/mem/cmnt/secondhand/registerPost",
	      contentType: "application/json;charset=utf-8",
	      data: JSON.stringify(data),
	      type: "post",
	      dataType: "text",
	      beforeSend: function(xhr) {
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	      },
	      success: function(result) {
	         $("#freeCmnt").val("");
	         alert("댓글이 작성되었습니다.");
	         location.href="/mem/cmnt/secondhandbbs/detail?pstId=${scndhdBbsVO.pstId}";
	      },
	      error: function(xhr, status, error) {
	         console.log("에러 발생:", error);
	      }
	   });
	});


	//게시물에 등록한 댓글 수정하기
	jQuery("#updtBtn").on("click", function() {
	   var pstId = $("#pstId").val();
	   var cmntNo = $("#cmntNo").val();
	   var cmntCn = $("#cmntCn").val();
	   var memId = "${memId}";

	   var data = {
			   "pstId": pstId,
			   "cmntNo": cmntNo,
			   "cmntCn": cmntCn,
			   "memId": memId
			   };
	   console.log(data);

	   jQuery.ajax({
	      url: "/mem/cmnt/secondhand/updatePost",
	      contentType: "application/json;charset=utf-8",
	      data: JSON.stringify(data),
	      type: "post",
	      dataType: "text",
	      beforeSend: function(xhr) {
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	      },
	      success: function(result) {
	    	 console.log("result : " + result);
	      },
	      error: function(xhr, status, error) {
	         console.log("에러 발생:", error);
	      }
	   });

	});

});

function cmntView(res){
	let html = ``;

	$(res).each((i,e)=>{
		console.log("e",e);
		html += `
			<div class="pt-5">
				<div class="flex">
					<div class="ml-3 flex-1 mt-0 pt-5 border-t border-slate-200/60 dark:border-darkmode-400">
						<div class="flex items-center">
							<input id="cmntNo" name="cmntNo" type="hidden" value="${freeBbsCmntVO.cmntNo}"/>
							<a id="frrfrstWrterId" href="" class="font-medium" style="">`+e.frstWrterId+`</a>
							<span id="frrlastUpdtTm" style="margin-left:65%;">작성일시 : `+e.lastUpdtTm+`</span>
							<a href="" class="ml-auto text-xs text-slate-500"></a>
						</div>
						<div class="mt-2 container mt-3" style="display:flex;">
							<div class="left-column" style="flex:1; margin-right:50%">
								<span id="frrcmntCn">`+e.cmntCn+`</span>
							</div>
							<div class="right-column" style="flex:1;">
								<button type="button" id="updtBtn"><span class="btn btn-primary mr-4" style="float:right;">수정</span></button>
								<button type="button" id="delBtn"><span class="btn btn-primary mr-4" style="float:right;">삭제</span></button>
								<button type="button" id="RepBtn"><span class="btn btn-primary mr-4" style="float:right;">신고</span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		`;

	});
	$('#freeCmntList').html(html);

	$("#updtBtn").on("click",function(){
		 const updatefCmnt = tailwind.Modal.getInstance(document.querySelector("#updatefCmnt"));
		 updatefCmnt.show();
	});
}


  </script>

