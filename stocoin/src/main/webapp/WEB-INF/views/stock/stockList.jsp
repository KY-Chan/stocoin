<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/stocoin/resources/css/coinList.css">
<link rel="stylesheet" type="text/css" href="/stocoin/resources/css/stock.css">
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script type="text/javascript" src="/stocoin/resources/js/dayjs.min.js"></script>
<script type="text/javascript">
	var kinds = "ACC_TRDVOL";
	var sorts = "desc";

	// 주식 리스트 로드, info 로드
	$(function() {
		$('#table_wrapper').load("/stocoin/exclude2/stockListReload?kind="+kinds+"&sort="+sorts);
		$('#chart').load("/stocoin/exclude2/stockChart");
		$('#info').load("/stocoin/exclude2/stockInfo");
	});
	
	// sort
	function sort(kind) {
		if ($('#'+kind).text() == "↓") {
			kinds = kind;
			sorts = "asc";
			$('.sort').text("");
			$('#'+kind).text("↑");
			$('#table_wrapper').load("/stocoin/exclude2/stockListReload?kind="+kinds+"&sort="+sorts);
		} else {
			kinds = kind;
			sorts = "desc";
			$('.sort').text("");
			$('#'+kind).text("↓");
			$('#table_wrapper').load("/stocoin/exclude2/stockListReload?kind="+kinds+"&sort="+sorts);
		}
	}
	
	function stockInfo(code) {
		$('#info').load('/stocoin/exclude2/stockInfo?code='+code);
		
		$(".list").removeClass('active');
		$('#'+code).addClass('active');
	}

	
	function chartChange(name) {
		$('#chart').load("/stocoin/exclude2/stockChart?name=" + name);
	}
</script>
</head>
<body>
	<div id="content" class="">
		<div id="content_left">
			<div id="search">
				<input type="text" name="search" placeholder="검색어를 입력하세요"> <a href="#">검색</a>
			</div>
			<ul>
				<li class="col-3" onclick="sort('ISU_ABBRV')">주식명 <span id="ISU_ABBRV" class="sort"></span></li>
				<li class="col-3" onclick="sort('TDD_CLSPRC')">가격 <span id="TDD_CLSPRC" class="sort"></span></li>
				<li class="col-3" onclick="sort('FLUC_RT')">등락률 <span id="FLUC_RT" class="sort"></span></li>
				<li class="col-3" onclick="sort('ACC_TRDVOL')">거래량 <span id="ACC_TRDVOL" class="sort">↓</span></li>
			</ul>
			<div id="table_wrapper"></div>
		</div>
		
		<div id="content_right">
			<div id="chart"></div>
			<div id="info"></div>
		</div>
	</div>
</body>
</html>