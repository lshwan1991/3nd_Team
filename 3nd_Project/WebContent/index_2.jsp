<%@page import="org.openqa.selenium.WebElement"%>
<%@page import="java.util.List"%>
<%@page import="Test.Ajax.Crawling"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Editorial by HTML5 UP</title>
		<style>
		
			#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.8);z-index: 1;font-size:12px;border-radius: 10px;}
			.bg_white {background:#fff;}
			#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
			#menu_wrap .option{text-align: center;}
			#menu_wrap .option p {margin:10px 0;}  
			#menu_wrap .option button {margin-left:5px;}
			#placesList li {list-style: none;}
			#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
			#placesList .item span {display: block;margin-top:4px;}
			#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
			#placesList .item .info{padding:10px 0 10px 55px;}
			#placesList .info .gray {color:#8a8a8a;}
			#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
			#placesList .info .tel {color:#009900;}
			#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
			#placesList .item .marker_1 {background-position: 0 -10px;}
			#placesList .item .marker_2 {background-position: 0 -56px;}
			#placesList .item .marker_3 {background-position: 0 -102px}
			#placesList .item .marker_4 {background-position: 0 -148px;}
			#placesList .item .marker_5 {background-position: 0 -194px;}
			#placesList .item .marker_6 {background-position: 0 -240px;}
			#placesList .item .marker_7 {background-position: 0 -286px;}
			#placesList .item .marker_8 {background-position: 0 -332px;}
			#placesList .item .marker_9 {background-position: 0 -378px;}
			#placesList .item .marker_10 {background-position: 0 -423px;}
			#placesList .item .marker_11 {background-position: 0 -470px;}
			#placesList .item .marker_12 {background-position: 0 -516px;}
			#placesList .item .marker_13 {background-position: 0 -562px;}
			#placesList .item .marker_14 {background-position: 0 -608px;}
			#placesList .item .marker_15 {background-position: 0 -654px;}
			#pagination {margin:10px auto;text-align: center;}
			#pagination a {display:inline-block;margin-right:10px;}
			#pagination .on {font-weight: bold; cursor: default;color:#777;}

			/* map */

		.map_wrap,
        .map_wrap * {
            margin: 0;
            padding: 0;
            font-family: 'Malgun Gothic', dotum, '����', sans-serif;
            font-size: 12px;
        }

        .map_wrap {
            position: relative;
            width: 100%;
            height: 350px;
        }

        #category {
            position: absolute;
            top: 10px;
            left: 10px;
            border-radius: 5px;
            border: 1px solid #909090;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
            background: #fff;
            overflow: hidden;
            z-index: 2;
        }

        #category li {
            float: left;
            list-style: none;
            width: 50px;
            border-right: 1px solid #acacac;
            padding: 6px 0;
            text-align: center;
            cursor: pointer;
        }

        #category li.on {
            background: #eee;
        }

        #category li:hover {
            background: #ffe6e6;
            border-left: 1px solid #acacac;
            margin-left: -1px;
        }

        #category li:last-child {
            margin-right: 0;
            border-right: 0;
        }

        #category li span {
            display: block;
            margin: 0 auto 3px;
            width: 27px;
            height: 28px;
        }

        #category li .category_bg {
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;
        }

        #category li .bank {
            background-position: -10px 0;
        }

        #category li .restaurant {
            background-position: -10px -36px;
        }

        #category li .pharmacy {
            background-position: -10px -72px;
        }

        #category li .oil {
            background-position: -10px -108px;
        }

        #category li .cafe {
            background-position: -10px -144px;
        }

        #category li .store {
            background-position: -10px -180px;
        }

        #category li.on .category_bg {
            background-position-x: -46px;
        }

        .placeinfo_wrap {
            position: absolute;
            bottom: 28px;
            left: -150px;
            width: 300px;
        }

        .placeinfo {
            position: relative;
            width: 100%;
            border-radius: 6px;
            border: 1px solid #ccc;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
            background: #fff;
        }

        .placeinfo:nth-of-type(n) {
            border: 0;
            box-shadow: 0px 1px 2px #888;
        }

        .placeinfo_wrap .after {
            content: '';
            position: relative;
            margin-left: -12px;
            left: 50%;
            width: 22px;
            height: 12px;
            background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
        }

        .placeinfo a,
        .placeinfo a:hover,
        .placeinfo a:active {
            color: #fff;
            text-decoration: none;
        }

        .placeinfo a,
        .placeinfo span {
            display: block;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }

        .placeinfo span {
            margin: 5px 5px 0 5px;
            cursor: default;
            font-size: 13px;
        }

        .placeinfo .title {
            font-weight: bold;
            font-size: 14px;
            border-radius: 6px 6px 0 0;
            margin: -1px -1px 0 -1px;
            padding: 10px;
            color: #fff;
            background: #d95050;
            background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
        }

        .placeinfo .tel {
            color: #0f7833;
        }

        .placeinfo .jibun {
            color: #999;
            font-size: 11px;
            margin-top: 0;
        }


        .map_wrap,
        .map_wrap * {
            margin: 0;
            padding: 0;
            font-family: 'Malgun Gothic', dotum, '����', sans-serif;
            font-size: 12px;
        }

        .map_wrap a,
        .map_wrap a:hover,
        .map_wrap a:active {
            color: #000;
            text-decoration: none;
        }

        .map_wrap {
            position: relative;
            width: 100%;
            height: 500px;
        }

        #menu_wrap {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            width: 250px;
            margin: 10px 0 30px 10px;
            padding: 5px;
            overflow-y: auto;
            background: rgba(255, 255, 255, 0.7);
            z-index: 1;
            font-size: 12px;
            border-radius: 10px;
        }

        .bg_white {
            background: #fff;
        }

        #menu_wrap hr {
            display: block;
            height: 1px;
            border: 0;
            border-top: 2px solid #5F5F5F;
            margin: 3px 0;
        }

        #menu_wrap .option {
            text-align: center;
        }

        #menu_wrap .option p {
            margin: 10px 0;
        }

        #menu_wrap .option button {
            margin-left: 5px;
        }

        #placesList li {
            list-style: none;
        }

        #placesList .item {
            position: relative;
            border-bottom: 1px solid #888;
            overflow: hidden;
            cursor: pointer;
            min-height: 65px;
        }

        #placesList .item span {
            display: block;
            margin-top: 4px;
        }

        #placesList .item h5,
        #placesList .item .info {
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }

        #placesList .item .info {
            padding: 10px 0 10px 55px;
        }

        #placesList .info .gray {
            color: #8a8a8a;
        }

        #placesList .info .jibun {
            padding-left: 26px;
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;
        }

        #placesList .info .tel {
            color: #009900;
        }

        #placesList .item .markerbg {
            float: left;
            position: absolute;
            width: 36px;
            height: 37px;
            margin: 10px 0 0 10px;
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
        }

        #placesList .item .marker_1 {
            background-position: 0 -10px;
        }

        #placesList .item .marker_2 {
            background-position: 0 -56px;
        }

        #placesList .item .marker_3 {
            background-position: 0 -102px
        }

        #placesList .item .marker_4 {
            background-position: 0 -148px;
        }

        #placesList .item .marker_5 {
            background-position: 0 -194px;
        }

        #placesList .item .marker_6 {
            background-position: 0 -240px;
        }

        #placesList .item .marker_7 {
            background-position: 0 -286px;
        }

        #placesList .item .marker_8 {
            background-position: 0 -332px;
        }

        #placesList .item .marker_9 {
            background-position: 0 -378px;
        }

        #placesList .item .marker_10 {
            background-position: 0 -423px;
        }

        #placesList .item .marker_11 {
            background-position: 0 -470px;
        }

        #placesList .item .marker_12 {
            background-position: 0 -516px;
        }

        #placesList .item .marker_13 {
            background-position: 0 -562px;
        }

        #placesList .item .marker_14 {
            background-position: 0 -608px;
        }

        #placesList .item .marker_15 {
            background-position: 0 -654px;
        }

        #pagination {
            margin: 10px auto;
            text-align: center;
        }

        #pagination a {
            display: inline-block;
            margin-right: 10px;
        }

        #pagination .on {
            font-weight: bold;
            cursor: default;
            color: #777;
        }



			</style>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />

		<!-------------------------->
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Triple Panel Image Slider with jQuery and CSS3</title>
        <meta name="description" content="Triple Panel Image Slider with jQuery and CSS3 and a 3D look" />
        <meta name="keywords" content="css3, image slider, jquery, 3d, 3dtransform, triple, transition, translate" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        
		<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700,300|Prata' rel='stylesheet' type='text/css' />
		<script type="text/javascript" src="js/modernizr.custom.26887.js"></script> 
		<noscript>
			<link rel="stylesheet" type="text/css" href="css/noscript.css" />
		</noscript>
		<!------------------------->
		
		<meta name="keywords" content="svg, border effect, animated border, line, grid item, hover, css" />
		<!-- <meta name="author" content="Codrops" /> -->
		<!-- <link rel="shortcut icon" href="../favicon.ico"> -->
		<link rel="stylesheet" type="text/css" href="assets/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="assets/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="assets/css/component.css" />
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<!----------------------------------------->
	</head>
	<body class="is-preload" style="background-color: #fff;">
		

		<!-- Wrapper -->
		
			<div id="wrapper">
				

				<!-- Main -->
				<!-- ��������-->
				
					<div id="main">
						<div class="inner">
							<div style="display: block;">
								<img src="images/clean.PNG" width="200px" height="80px">
								<!-- <h1 style="font-family: NEXONLv1GothicBold; font-size: 30px; color: #424242;">&nbsp POST CORONA</h1> -->
							</div>
							<!-- Header -->
							<header id="header">
								<div style="background-color: #fff; width: 700px; height: 600px;">
								
									
								
									<div class="slide">
										<ul class="slide_ul">
										<li><img src="images/main_1.jpg" width="1000px" height="400px" alt="dane"></li>
										<li><img src="images/main_2.jpg" width="1000px" height="400px" alt="dane"></li>
										<li><img src="images/main_3.jpg" width="1000px" height="400px" alt="dane"></li>
										<li><img src="images/main_4.jpg" width="1000px" height="400px" alt="dane"></li>
										<li><img src="images/main_1.jpg" width="1000px" height="400px" alt="dane"></li>
										</ul>
									</div>
									<section>
										<header class="major">
											<!-- <h4 style="font-family: GmarketSansBold;">���� CCTV�� �м� ������ ������ ��õ���ִ� ����</h4> -->
											<h1 style="font-family: THE���ǵ�; color: #03A9F4; padding: 10px;" class="mb-5 text-primary font-weight-bold"  data-aos="fade-up" style="width: 100px;">POST CORONA����<br> <span style="font-family: THE���ǵ�; color:#3D5AFE ;" class="typed-words">���ϰ� �����帳�ϴ�.</span></h1><br>
											<script src="js/typed.js"></script>
											<script>
											var typed = new Typed('.typed-words', {
											strings: ["�ڷγ����� ������ ���� Ȯ��","Ȯ���� �̵���� Ȯ��"," ������ �濪 ���� Ȯ��", " �Բ� �̱�� �ֽ��ϴ�!"],
											typeSpeed: 80,
											backSpeed: 80,
											backDelay: 4000,
											startDelay: 1000,
											loop: true,
											showCursor: true
											});
											</script>
								
								
									<script src="js/jquery.imgslider.js"></script>
										</header>
									
								</div>
								
								</header>
							<!-- ������� -->
							

							<!-- Section -->

							
								<!-- <div class="features">

									<section>
										
									
										
									</section>


									
								</div> -->
							</section>

				



							<!-- Banner -->
							
								<section id="banner">
									<div class="content">
										<header class="major">
											<h3>
											<span>post_corona MAP</span>
											<p style="color: #000; font-family: THE���ǵ�;"> ��Ҹ� �����ϼ���.<br> ��Ҹ� �����ϰ� �Ʒ� ���������� Ȯ���ϼ���.</p>
											</h3>
											<p style="margin-top:-12px">

											</p>
											<div class="map_wrap">
												<div id="map" style="width:1000px;height:500px;position:relative;overflow:hidden;"></div>
												<ul id="category" style="left:800px;">
										
													<li id="CE7" data-order="4">
														<span class="category_bg cafe"></span>
														ī��
													</li>
													<li id="FD6" data-order="1">
														<span class="category_bg restaurant"></span>
														�Ĵ�
													</li>
													<li id="CS2" data-order="5">
														<span class="category_bg store"></span>
														������
													</li>
										
												</ul>
										
										
												<div id="menu_wrap" class="bg_white">
													<div class="option">
														<div>
															<form onsubmit="searchPlaces(); return false;">
																Ű���� : <input type="text" value="���� ���ϵ� ī��" id="keyword" size="15">
																<button type="submit">�˻��ϱ�</button>
															</form>
														</div>
													</div>
													<hr>
													<ul id="placesList"></ul>
													<div id="pagination"></div>
												</div>
											</div>
										
											<script type="text/javascript"
												src="//dapi.kakao.com/v2/maps/sdk.js?appkey=423cd019a50dfcc92ba9643b89dbfcd2&libraries=services">
											</script>
											<script>
												// ��Ŀ�� Ŭ������ �� �ش� ����� �������� ������ Ŀ���ҿ��������Դϴ�
												var placeOverlay1 = new kakao.maps.CustomOverlay({ zIndex: 1 }),
													contentNode1 = document.createElement('div'), // Ŀ���� ���������� ������ ������Ʈ �Դϴ� 
													markers1 = []; // ī�װ��˻� ��Ŀ�� ���� �迭�Դϴ�
												markers = []; // Ű����˻� ��Ŀ�� ���� �迭�Դϴ�
												currCategory1 = ''; // ���� ���õ� ī�װ��� ������ ���� �����Դϴ�
										
												var mapContainer1 = document.getElementById('map'), // ������ ǥ���� div 
													mapOption1 = {
														center: new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
														level: 5 // ������ Ȯ�� ����
													};
										
										
												var map = new kakao.maps.Map(mapContainer1, mapOption1);
										
												// ��� �˻� ��ü�� �����մϴ�
												var ps1 = new kakao.maps.services.Places(map);
										
												// ������ idle �̺�Ʈ�� ����մϴ�
												kakao.maps.event.addListener(map, 'idle', searchPlaces1);
										
												// Ŀ���� ���������� ������ ��忡 css class�� �߰��մϴ� 
												contentNode1.className = 'placeinfo_wrap';
										
												// Ŀ���� ���������� ������ ��忡 mousedown, touchstart �̺�Ʈ�� �߻�������
												// ���� ��ü�� �̺�Ʈ�� ���޵��� �ʵ��� �̺�Ʈ �ڵ鷯�� kakao.maps.event.preventMap �޼ҵ带 ����մϴ� 
												addEventHandle1(contentNode1, 'mousedown', kakao.maps.event.preventMap);
												addEventHandle1(contentNode1, 'touchstart', kakao.maps.event.preventMap);
										
												// Ŀ���� �������� �������� �����մϴ�
												placeOverlay1.setContent(contentNode1);
										
												// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
												addCategoryClickEvent1();
										
												// ������Ʈ�� �̺�Ʈ �ڵ鷯�� ����ϴ� �Լ��Դϴ�
												function addEventHandle1(target, type, callback) {
													if (target.addEventListener) {
														target.addEventListener(type, callback);
													} else {
														target.attachEvent('on' + type, callback);
													}
												}
										
												// ī�װ� �˻��� ��û�ϴ� �Լ��Դϴ�
												function searchPlaces1() {
													if (!currCategory1) {
														return;
													}
										
													// Ŀ���� �������̸� ����ϴ� 
													placeOverlay1.setMap(null);
										
													// ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
													removeMarker1();
										
													ps1.categorySearch(currCategory1, placesSearchCB1, { useMapBounds: true });
												}
										
												// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
												function placesSearchCB1(data, status, pagination) {
													if (status === kakao.maps.services.Status.OK) {
														// ���������� �˻��� �Ϸ������ ������ ��Ŀ�� ǥ���մϴ�
														displayPlaces1(data);
													} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
														// �˻������ ���°�� �ؾ��� ó���� �ִٸ� �̰��� �ۼ��� �ּ���
										
													} else if (status === kakao.maps.services.Status.ERROR) {
														// ������ ���� �˻������ ������ ���� ��� �ؾ��� ó���� �ִٸ� �̰��� �ۼ��� �ּ���
										
													}
												}
										
												// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
												function displayPlaces1(places) {
										
													// ���° ī�װ��� ���õǾ� �ִ��� ���ɴϴ�
													// �� ������ ��������Ʈ �̹��������� ��ġ�� ����ϴµ� ���˴ϴ�
													var order = document.getElementById(currCategory1).getAttribute('data-order');
										
										
										
													for (var i = 0; i < places.length; i++) {
										
														// ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
														var marker = addMarker1(new kakao.maps.LatLng(places[i].y, places[i].x), order);
										
														// ��Ŀ�� �˻���� �׸��� Ŭ�� ���� ��
														// ��������� ǥ���ϵ��� Ŭ�� �̺�Ʈ�� ����մϴ�
														(function (marker, place) {
															kakao.maps.event.addListener(marker, 'click', function () {
																displayPlaceInfo(place);
															});
														})(marker, places[i]);
													}
												}
										
												// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
												function addMarker1(position, order) {
													var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
														imageSize = new kakao.maps.Size(27, 28),  // ��Ŀ �̹����� ũ��
														imgOptions = {
															spriteSize: new kakao.maps.Size(72, 208), // ��������Ʈ �̹����� ũ��
															spriteOrigin: new kakao.maps.Point(46, (order * 36)), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
															offset: new kakao.maps.Point(11, 28) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
														},
														markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
														marker = new kakao.maps.Marker({
															position: position, // ��Ŀ�� ��ġ
															image: markerImage
														});
										
													marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
													markers1.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�
										
													return marker;
												}
										
												// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
												function removeMarker1() {
													for (var i = 0; i < markers1.length; i++) {
														markers1[i].setMap(null);
													}
													markers1 = [];
												}
										
												// Ŭ���� ��Ŀ�� ���� ��� �������� Ŀ���� �������̷� ǥ���ϴ� �Լ��Դϴ�
												function displayPlaceInfo(place) {
													var content = '<div class="placeinfo">' +
														'   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';
										
													if (place.road_address_name) {
														content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
															'  <span class="jibun" title="' + place.address_name + '">(���� : ' + place.address_name + ')</span>';
													} else {
														content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
													}
										
													content += '    <span class="tel">' + place.phone + '</span>' +
														'</div>' +
														'<div class="after"></div>';
										
													contentNode1.innerHTML = content;
													placeOverlay1.setPosition(new kakao.maps.LatLng(place.y, place.x));
													placeOverlay1.setMap(map);
												}
										
										
												// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
												function addCategoryClickEvent1() {
													var category = document.getElementById('category'),
														children = category.children;
										
													for (var i = 0; i < children.length; i++) {
														children[i].onclick = onClickCategory;
													}
												}
										
												// ī�װ��� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
												function onClickCategory() {
													var id = this.id,
														className = this.className;
										
													placeOverlay1.setMap(null);
										
													if (className === 'on') {
														currCategory1 = '';
														changeCategoryClass();
														removeMarker1();
													} else {
														currCategory1 = id;
														changeCategoryClass(this);
														searchPlaces1();
													}
												}
										
												// Ŭ���� ī�װ����� Ŭ���� ��Ÿ���� �����ϴ� �Լ��Դϴ�
												function changeCategoryClass(el) {
													var category = document.getElementById('category'),
														children = category.children,
														i;
										
													for (i = 0; i < children.length; i++) {
														children[i].className = '';
													}
										
													if (el) {
														el.className = 'on';
													}
												}
										
										
										
										
										
										
										
										
										
												// Ű����� ��Ҹ� �˻��մϴ�
												searchPlaces();
										
												// Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�
												function searchPlaces() {
										
													var keyword = document.getElementById('keyword').value;
										
													if (!keyword.replace(/^\s+|\s+$/g, '')) {
														alert('Ű���带 �Է����ּ���!');
														return false;
													}
										
													// ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
													ps1.keywordSearch(keyword, placesSearchCB);
												}
												// �˻� ��� ����̳� ��Ŀ�� Ŭ������ �� ��Ҹ��� ǥ���� ���������츦 �����մϴ�
												var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });
										
												// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
												function placesSearchCB(data, status, pagination) {
													if (status === kakao.maps.services.Status.OK) {
										
														// ���������� �˻��� �Ϸ������
														// �˻� ��ϰ� ��Ŀ�� ǥ���մϴ�
														displayPlaces(data);
										
														// ������ ��ȣ�� ǥ���մϴ�
														displayPagination(pagination);
										
													} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
										
														alert('�˻� ����� �������� �ʽ��ϴ�.');
														return;
										
													} else if (status === kakao.maps.services.Status.ERROR) {
										
														alert('�˻� ��� �� ������ �߻��߽��ϴ�.');
														return;
										
													}
												}
										
												// �˻� ��� ��ϰ� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
												function displayPlaces(places) {
										
													var listEl = document.getElementById('placesList'),
														menuEl = document.getElementById('menu_wrap'),
														fragment = document.createDocumentFragment(),
														bounds = new kakao.maps.LatLngBounds(),
														listStr = '';
										
													// �˻� ��� ��Ͽ� �߰��� �׸���� �����մϴ�
													removeAllChildNods(listEl);
										
													// ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
													removeMarker();
										
													for (var i = 0; i < places.length; i++) {
										
														// ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
														var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
															marker = addMarker(placePosition, i),
															itemEl = getListItem(i, places[i]); // �˻� ��� �׸� Element�� �����մϴ�
										
														// �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
														// LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
														bounds.extend(placePosition);
										
														// ��Ŀ�� �˻���� �׸� mouseover ������
														// �ش� ��ҿ� ���������쿡 ��Ҹ��� ǥ���մϴ�
														// mouseout ���� ���� ���������츦 �ݽ��ϴ�
														(function (marker, title) {
															kakao.maps.event.addListener(marker, 'click', function () {
																displayInfowindow(marker, title);
															});
										
															/* kakao.maps.event.addListener(marker, 'mouseout', function () {
																infowindow.close();
															}); */
										
															itemEl.onclick = function () {
																displayInfowindow(marker, title);
															};
										
															/* itemEl.onmouseout = function () {
																infowindow.close();
															}; */
														})(marker, places[i].place_name);
										
														fragment.appendChild(itemEl);
													}
										
													// �˻���� �׸���� �˻���� ��� Elemnet�� �߰��մϴ�
													listEl.appendChild(fragment);
													menuEl.scrollTop = 0;
										
													// �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
													map.setBounds(bounds);
												}
										
												// �˻���� �׸��� Element�� ��ȯ�ϴ� �Լ��Դϴ�
												function getListItem(index, places) {
										
													var el = document.createElement('li'),
														itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
															'<div class="info">' +
															'   <h5>' + places.place_name + '</h5>';
										
													if (places.road_address_name) {
														itemStr += '    <span>' + places.road_address_name + '</span>' +
															'   <span class="jibun gray">' + places.address_name + '</span>';
													} else {
														itemStr += '    <span>' + places.address_name + '</span>';
													}
										
													itemStr += '  <span class="tel">' + places.phone + '</span>' +
														'</div>';
										
													el.innerHTML = itemStr;
													el.className = 'item';
										
													return el;
												}
										
												// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
												function addMarker(position, idx, title) {
													var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
														imageSize = new kakao.maps.Size(36, 37),  // ��Ŀ �̹����� ũ��
														imgOptions = {
															spriteSize: new kakao.maps.Size(36, 691), // ��������Ʈ �̹����� ũ��
															spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
															offset: new kakao.maps.Point(13, 37) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
														},
														markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
														marker = new kakao.maps.Marker({
															position: position, // ��Ŀ�� ��ġ
															image: markerImage
														});
										
													marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
													markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�
										
													return marker;
												}
										
												// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
												function removeMarker() {
													for (var i = 0; i < markers.length; i++) {
														markers[i].setMap(null);
													}
													markers = [];
												}
										
												// �˻���� ��� �ϴܿ� ��������ȣ�� ǥ�ô� �Լ��Դϴ�
												function displayPagination(pagination) {
													var paginationEl = document.getElementById('pagination'),
														fragment = document.createDocumentFragment(),
														i;
										
													// ������ �߰��� ��������ȣ�� �����մϴ�
													while (paginationEl.hasChildNodes()) {
														paginationEl.removeChild(paginationEl.lastChild);
													}
										
													for (i = 1; i <= pagination.last; i++) {
														var el = document.createElement('a');
														el.href = "#";
														el.innerHTML = i;
										
														if (i === pagination.current) {
															el.className = 'on';
														} else {
															el.onclick = (function (i) {
																return function () {
																	pagination.gotoPage(i);
																}
															})(i);
														}
										
														fragment.appendChild(el);
													}
													paginationEl.appendChild(fragment);
												}
										
												// �˻���� ��� �Ǵ� ��Ŀ�� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
												// ���������쿡 ��Ҹ��� ǥ���մϴ�
												function displayInfowindow(marker, title) {
													var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
										
													infowindow.setContent(content);
													infowindow.open(map, marker);
													
													
													$.ajax({
														type : "get", // ��û���
														url : "ex01Ajax?title="+title,// ��û�� ����������
														dataType : "json", // ������� ���
														success : function(data) {
															var title = data.title;
															var ex = data.address+data.tel+data.score;
															
															$('#co').html(title);
															$('#co1').html(ex);
															
															var score = data.score;
															
															$('#co').text(title);
															$('#co1').text(ex);
															
															if(score == 5.0){
																$('#img1').attr("src","images/mask2.png");
															}else{
																$('#img1').attr("src","images/mask1.png");
															}
															
															
															// ������������ ��ſ� ������ �Ŀ� �ൿ
															 //alert(data);
															
														},
														error : function() {
															// ������������ ��ſ� ������ �Ŀ� �ൿ
		
														}
														
													})
													
													
												}
										
												// �˻���� ����� �ڽ� Element�� �����ϴ� �Լ��Դϴ�
												function removeAllChildNods(el) {
													while (el.hasChildNodes()) {
														el.removeChild(el.lastChild);
													}
												}
												// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
												var zoomControl = new kakao.maps.ZoomControl();
												map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
										
												/////////////////// ���� ��ġ /////////////////////////////////////
										
												// HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
												if (navigator.geolocation) {
										
													// GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
													navigator.geolocation.getCurrentPosition(function (position) {
										
														var lat = position.coords.latitude, // ����
															lon = position.coords.longitude; // �浵
										
														var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
															message = '<div style="padding:5px;">���� ���� ��ġ</div>'; // ���������쿡 ǥ�õ� �����Դϴ�
										
														// ��Ŀ�� ���������츦 ǥ���մϴ�
														displayMarker(locPosition, message);
										
													});
										
												} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
										
													var locPosition = new kakao.maps.LatLng(35.118267, 126.868662),
														message = '���� ��ġ�� ����Ҽ� �����ϴ�.'
										
													displayMarker(locPosition, message);
												}
												// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ�
												function displayMarker(locPosition, message) {
										
													// ��Ŀ�� �����մϴ�
													var marker2 = new kakao.maps.Marker({
														map: map,
														position: locPosition
													});
										
													var iwContent = message, // ���������쿡 ǥ���� ����
														iwRemoveable = true;
										
													// ���������츦 �����մϴ�
													var infowindow2 = new kakao.maps.InfoWindow({
														content: iwContent,
														removable: iwRemoveable
													});
										
													// ���������츦 ��Ŀ���� ǥ���մϴ� 
													infowindow2.open(map, marker2);
										
													// ���� �߽���ǥ�� ������ġ�� �����մϴ�
													map.setCenter(locPosition);
												}
											</script>
										</header>
										
										<!---------------------------------------MAP-------------------------------------------->
					<div>
										
											
				</div>						
											<!-----------------------------------------------map �� ----------------------------->
											
											
									</div>
									
										
									
								</section>
								<div>
									<header>
										<h5  style="padding: 0px 10px 1px;
										margin: 10px 0px 5px;
										border-left-width: 5px;
										border-left-style: solid;
										border-left-color: slateblue;
										font-size: 24pt; color: #000;
										font-family: 'THE���ǵ�';
										border-bottom-width: 1px;
										letter-spacing: -0.07em;
										line-height: 35px;
										background-color: slateblue(250,250,250);">��������</h5>
									</header>
									
										<!-- ����ũ ���� ���� ������ �̹����� ��Ȳ�� �°� �����ؾ��� 1 : ���� 2 : �߰� 3 : ����-->
										<!-- <img src="images/����ũ1.png" width="130px" height="130px" alt="" /><br>
										<h3 style="color: #000; font-family: THE���ǵ�;">����ũ ����</h3> -->
										<section class="demo-3">
											<div class="grid">
											   <div class="box">
												  <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
													 <line class="top" x1="0" y1="0" x2="900" y2="0"/>
													 <line class="left" x1="0" y1="460" x2="0" y2="-920"/>
													 <line class="bottom" x1="300" y1="460" x2="-600" y2="460"/>
													 <line class="right" x1="300" y1="0" x2="300" y2="1380"/>
												  </svg>
												  <img id="img1" src="images/mask1.png" width="200px" height="200px" style="padding: 10px;">
												  <span id="co">�޾ƿ� ��</span>
												  <span id="co1">�޾ƿ� ��</span>
											   </div>
											   <div class="box">
												  <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
													 <line class="top" x1="0" y1="0" x2="900" y2="0"/>
													 <line class="left" x1="0" y1="460" x2="0" y2="-920"/>
													 <line class="bottom" x1="300" y1="460" x2="-600" y2="460"/>
													 <line class="right" x1="300" y1="0" x2="300" y2="1380"/>
												  </svg>
												  <img src="images/mask2.png" width="200px" height="200px" style="padding: 10px;">
												  <span>�޾ƿ� ��</span>
											   </div>
											   <div class="box">
												  <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
													 <line class="top" x1="0" y1="0" x2="900" y2="0"/>
													 <line class="left" x1="0" y1="460" x2="0" y2="-920"/>
													 <line class="bottom" x1="300" y1="460" x2="-600" y2="460"/>
													 <line class="right" x1="300" y1="0" x2="300" y2="1380"/>
												  </svg>
												  <img src="images/mask3.png" width="200px" height="200px" style="padding: 10px;">
												  <span>�޾ƿ� ��</span>
											   </div>
											</div><!-- /grid -->
										 </section>
										
										



								</div>
									
											
									
										


								
								<!-- popup â!-->
								<!-- <button onclick="window.open('CSS3FluidParallaxSlideshow/Scroll.html','window_popup','width=800,height=450,top=100,left=400,location=no,status=no,scrollbars=yes, resizable=yes');" style="color: #000; box-shadow: inset 0 0 0 2px #000000;" id="test_but">�󼼺���</button> -->
								<!--������ �̵��� ���� ��ư -->
									
							    
								<!---------------------------------------MAP �� ------------------------------------------->
								 

							

							<!-- Section -->
							<div>
								<header class="major">
									<h2>�ϴܺ���Ѳ�!!</h2>
								</header>
							</div>
								

						</div>
					</div>	

				<!-- Sidebar -->
			
					<!--style="margin-top: 145px;"-->
					<div id="sidebar">
						<div class="inner" >

							<!-- Search -->
								
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

							<!-- Menu -->
							
							

							<!-- Section -->
								<section>
									<header class="major">
										<strong style="font-family: THE���ǵ�; font-size: 30px;">�ǽð� �ڷγ� ��Ȳ</strong><br><br>
									</header>
									<div class="mini-posts">
									
										<article>
											<%-- <%
												Crawling craw = new Crawling();
												List<WebElement> list = craw.Crawling_Co();
												
												for(int i=0; i<list.size(); i++) {
													System.out.println(list.get(i).getText());
												}
											%> --%>


							
							
                                 
                                 
                                 
                              		 
											<a href="https://www.gwangju.go.kr/c19/"  class="image"><img src="images/time.PNG" alt="" /></a>
											<p style="font-family: Cafe24Ohsquareair;">���ֱ����� �ǽð� �ڷγ� ��Ȳ������ �Դϴ�.</p>
										</article></div>

										
										<article>
											<header class="major">
												<strong style="font-family: THE���ǵ�; font-size: 30px;">���ֱ����� ���������</strong><br><br>
											</header>
											<a href="https://www.gwangju.go.kr/c19/c19/contentsView.do?pageId=coronagj6" target="blank" class="image"><img src="images/time2.jpg" alt="" /></a>
											<p style="font-family: Cafe24Ohsquareair;">���ֱ����� ��������� ������ �Դϴ�.</p>
										</article>
										<!-- <article>
											<header class="major">
												<strong style="font-family: THE���ǵ�; font-size: 30px;">�ڷγ� ��</strong><br><br>
											</header>
											<a href="https://coronamap.site/" class="image"><img src="images/�ڷγ� ��.png" alt="" /></a>
											<p style="font-family: Cafe24Ohsquareair;">���ֱ����� �ڷγ� �� ������ �Դϴ�.</p>
										</article> -->
									</div>
									<!-- <ul class="actions">
										<li><a style="color: #000; box-shadow: inset 0 0 0 2px #000000;" href="#" class="button">More</a></li>
									</ul> -->
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>COMPANY</h2>
									</header>
									<p>CCTV�� ����  ����ũ ���뿩�� ����, ����ð��� �м��� �̿��� ���� �м��Ͽ� 
										��� �� ������ ������ �� �� �����մϴ�. ���� ���� ���ϰ� ���� ������ �Դϴ�.</p>
									<ul class="contact">
										<li class="icon solid fa-envelope"><a href="#">post_corona.co.kr</a></li>
										<li class="icon solid fa-phone">(062) 655-3508</li>
										<li class="icon solid fa-home">���ֱ����� ���� �߾ӷ� �ų����� 7�� ��ǥ�� : �̽�ȯ  / 
										 ����ڵ�Ϲ�ȣ : 178-82-000658254<br /></li>
									</ul>
								</section>

							<!-- Footer -->
								<!-- <footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer> -->

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>