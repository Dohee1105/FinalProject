<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link href="https://unpkg.com/tabulator-tables@4.9.3/dist/css/tabulator.min.css" rel="stylesheet">
<script type="text/javascript" src="https://unpkg.com/tabulator-tables@4.9.3/dist/js/tabulator.min.js"></script>

<!-- BEGIN: Menu -->
<div class="col-span-12 lg:col-span-3 2xl:col-span-2">
    <div class="intro-y box bg-primary p-5 mt-0 text-lg" style="height: 100%;">
    	<nav class="side-nav">
		    <ul>
		        <li>
		            <a href="/mem/ntcbbs" class="side-menu">
		                <div class="side-menu__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" icon-name="home" data-lucide="home" class="lucide lucide-home"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"></path></svg></div>
		                <div class="side-menu__title"> 공지사항 </div>
		            </a>
		        </li>
		        <li>
		            <a href="/mem/bid/bidntcbbs" class="side-menu">
		                <div class="side-menu__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" icon-name="box" data-lucide="box" class="lucide lucide-box"><path d="M21 16V8a2 2 0 00-1-1.73l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.73l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg></div>
		                <div class="side-menu__title"> 입찰공고 </div>
		            </a>
		        </li>
		    </ul>
		</nav>
    </div>
</div>
<!-- END: Menu -->

<!-- BEGIN: Body -->
<div class="bdy col-span-10">
	<div class="alert alert-dismissible show box bg-primary text-white flex font-semibold items-center" role="alert">
    	<span style="font-size: 20px; margin-left:20px;">공지사항</span>
	</div>
	<!-- BEGIN: HTML Table Data -->
	<div class="intro-y box p-5 mt-5">
		<div class="flex flex-col sm:flex-row sm:items-end xl:items-start">
			<form id="tabulator-html-filter-form" class="xl:flex sm:mr-auto">
				<div class="sm:flex items-center sm:mr-4">
					<select id="tabulator-html-filter-field"
						class="form-select w-full sm:w-24 2xl:w-full mt-2 sm:mt-0 sm:w-auto"
						style="height: 38.13px; font-size: 16px;">
						<option value="" disabled selected hidden>검색</option>
						<option value="seq">번호</option>
						<option value="title">제목</option>
						<option value="writer">작성자</option>
					</select>
				</div>
				<div class="sm:flex items-center sm:mr-4 mt-2 xl:mt-0"
					style="display: none;">
					<select id="tabulator-html-filter-type"
						class="form-select w-full mt-2 sm:mt-0 sm:w-auto">
						<option value="like" selected="selected">like</option>
					</select>
				</div>
				<div class="sm:flex items-center sm:mr-4 mt-2 xl:mt-0">
					<input id="tabulator-html-filter-value" type="text"
						class="form-control sm:w-40 2xl:w-full mt-2 sm:mt-0"
						placeholder="Search...">
				</div>
				<div class="mt-2 xl:mt-0">
					<button id="tabulator-html-filter-go" type="button"
						class="btn btn-primary w-full sm:w-16 font-medium"
						style="background-color: #064E3B;">검색</button>
					<button id="tabulator-html-filter-reset" type="button"
						class="btn btn-secondary w-full sm:w-16 mt-2 sm:mt-0 sm:ml-1">초기화</button>
				</div>
			</form>
		</div>
		<div class="overflow-x-auto scrollbar-hidden">
			<div id="test" class="mt-3 table-report table-report--tabulator"></div>
		</div>
	</div>
	<!-- END: HTML Table Data -->
</div>

<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#main_menu").html("공지사항");
	$("#sub_menu").html("");

	$(".side-nav > ul > li > .side-menu").on("click", function(){
		// 좌측 메뉴 선택 시 효과 적용
		$(".side-menu").removeClass("side-menu--active");
		$(this).addClass("side-menu--active");

		// 메뉴 경로 표시 (좌측 메뉴)
		var sub = $(this).find(".side-menu__title").text();
		console.log(sub.trim());
		$("#sub_menu").html(sub.trim());
	});
});
$(function(){
   if ($("#test").length) {
      // Filter function
      var filterHTMLForm = function filterHTMLForm() {
         var field = $("#tabulator-html-filter-field").val();
         var type = $("#tabulator-html-filter-type").val();
         var value = $("#tabulator-html-filter-value").val();
         table.setFilter(field, type, value);
      }; // On submit filter form

      // Setup Tabulator
       var table = new Tabulator("#test", {
         //ajaxURL: "https://dummy-data.left4code.com",
         ajaxURL: "/mem/ntcbbs/postList",
         ajaxFiltering: false,
         ajaxSorting: false,
         printAsHtml: true,
         printStyled: true,
         pagination: "local",
         paginationSize: 10,
         paginationSizeSelector: [10, 20, 30],
         layout: "fitData",
         //responsiveLayout: "collapse",
         placeholder: "데이터가 없습니다",
         columns: [{
            title: "번호",
            width: 110,
            minWidth: 110,
            field: "pstId",
            headerHozAlign: "center",
            hozAlign: "center",
            vertAlign: "middle",
            print: false,
            download: false
         }, {
            title: "제목",
            width: 420,
            minWidth: 420,
            field: "pstSj",
            headerHozAlign: "center",
            hozAlign: "center",
            vertAlign: "middle",
            print: false,
            download: false,
            cssClass: "text-left"
         }, {
            title: "작성자",
            width: 130,
            minWidth: 130,
            field: "ab",
            hozAlign: "center",
            vertAlign: "middle",
            headerSort: false,
            print: false,
            download: false,
         }, {
            title: "작성일",
            width: 145,
            minWidth: 145,
            field: "lastUpdtTm",
            hozAlign: "center",
            vertAlign: "middle",
            print: false,
            download: false,
            formatter:"datetime", formatterParams: {inputFormat: "YYYYMMDDHHmm", outputFormat: "YY.MM.DD HH:mm"}
         }, {
            title: "조회수",
            width: 125,
            minWidth: 125,
            field: "rdcnt",
            hozAlign: "center",
            vertAlign: "middle",
            print: false,
            download: false,
         }], initialSort: [
              { column: "seq", dir: "asc" }
          ]
       });

      $("#tabulator-html-filter-form")[0].addEventListener("keypress", function (event) {
          var keycode = event.keyCode ? event.keyCode : event.which;

          if (keycode == "13") {
            event.preventDefault();
            filterHTMLForm();
          }
      });
      // On click go button
      $("#tabulator-html-filter-go").on("click", function (event) {
         filterHTMLForm();
      });
      // On reset filter form
      $("#tabulator-html-filter-reset").on("click", function (event) {
         $("#tabulator-html-filter-field").val("");
         $("#tabulator-html-filter-type").val("like");
         $("#tabulator-html-filter-value").val("");
         filterHTMLForm();
      });
      // Export - CSV
      $("#tabulator-export-csv").on("click", function (event) {
         table.download("csv", "data.csv");
      });
      // Export - Excel
      $("#tabulator-export-xlsx").on("click", function (event) {
         table.download("xlsx", "data.xlsx", {
            sheetName: "table"
         });
      });
      // Print
       $("#tabulator-print").on("click", function (event) {
         table.print();
      });

      // Style
       $("#test").css({
         "background-color": "white",
         "font-size": "15px",
         "border": "none"
         });
       $(".tabulator-footer").css({
         "background-color": "white",
         "border": "none"
         });

      $(".tabulator-header").css({
         "background-color": "white",
         "border-bottom-color": "rgb(229, 231, 235)",
         "border-bottom-style": "solid",
         "border-bottom-width": "0px",
         "border-left-color": "rgb(229, 231, 235)",
         "border-left-style": "solid",
         "border-left-width": "0px",
         "border-right-color": "rgb(229, 231, 235)",
         "border-right-style": "solid",
         "border-right-width": "0px",
         "border-top-color": "rgb(229, 231, 235)",
         "border-top-style": "solid",
         "border-top-width": "0px",
         "box-sizing": "border-box",
         "display": "block",
         "font-family": "Pretendard",
         "font-feature-settings": "normal",
         "font-size": "16px",
         "font-variation-settings": "normal",
         "letter-spacing": "1px",
         "margin-left": "0px",
         "text-size-adjust": "100%",
         "text-wrap": "nowrap",
         "user-select": "none",
         "white-space-collapse": "collapse",
         "-webkit-font-smoothing": "antialiased"
	});
   }
});
</script>


