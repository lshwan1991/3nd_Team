<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
		<title>Editorial by HTML5 UP</title>
		<style>
			.map_wrap, .map_wrap * {margin:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;}
			.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
			.map_wrap {position:relative;width:100%;height:500px;}
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
			
			</style>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body class="is-preload">
		

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="index.html" class="logo"><strong>Editorial</strong> by HTML5 UP</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header class="major">
											<h2>Map</h2>
										</header>
										<p style="color: #000; font-family: bold;">장소를 선택하세요.</p>
										<!---------------------------------------MAP-------------------------------------------->
											<div class="map_wrap">
												<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
											
												<div id="menu_wrap" class="bg_white">
													<div class="option">
														<div style="font-family: bold; color : #000000;">
															<form onsubmit="searchPlaces(); return false;">
																<input type="text" placeholder="키워드를 입력하세요." id="keyword" size="15"> 
																<button style="color: #000; box-shadow: inset 0 0 0 2px #000000;" type="submit">검색</button> 
															</form>
														</div>
													</div>
													<hr>
													<ul id="placesList"></ul>
													<div id="pagination"></div>
												</div>
											</div>
											
											<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=423cd019a50dfcc92ba9643b89dbfcd2&libraries=services"></script>
											<script>
											// 마커를 담을 배열입니다
											var markers = [];
											
											var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
												mapOption = {
													center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
													level: 3 // 지도의 확대 레벨
												};  
											
											// 지도를 생성합니다    
											var map = new kakao.maps.Map(mapContainer, mapOption); 
											
											// 장소 검색 객체를 생성합니다
											var ps = new kakao.maps.services.Places();  
											
											// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
											var infowindow = new kakao.maps.InfoWindow({zIndex:1});
											
											// 키워드로 장소를 검색합니다
											searchPlaces();
											
											// 키워드 검색을 요청하는 함수입니다
											function searchPlaces() {
											
												var keyword = document.getElementById('keyword').value;
											
												if (!keyword.replace(/^\s+|\s+$/g, '')) {
													alert('키워드를 입력해주세요!');
													return false;
												}
											
												// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
												ps.keywordSearch( keyword, placesSearchCB); 
											}
											
											// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
											function placesSearchCB(data, status, pagination) {
												if (status === kakao.maps.services.Status.OK) {
											
													// 정상적으로 검색이 완료됐으면
													// 검색 목록과 마커를 표출합니다
													displayPlaces(data);
											
													// 페이지 번호를 표출합니다
													displayPagination(pagination);
											
												} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
											
													alert('검색 결과가 존재하지 않습니다.');
													return;
											
												} else if (status === kakao.maps.services.Status.ERROR) {
											
													alert('검색 결과 중 오류가 발생했습니다.');
													return;
											
												}
											}
											
											// 검색 결과 목록과 마커를 표출하는 함수입니다
											function displayPlaces(places) {
											
												var listEl = document.getElementById('placesList'), 
												menuEl = document.getElementById('menu_wrap'),
												fragment = document.createDocumentFragment(), 
												bounds = new kakao.maps.LatLngBounds(), 
												listStr = '';
												
												// 검색 결과 목록에 추가된 항목들을 제거합니다
												removeAllChildNods(listEl);
											
												// 지도에 표시되고 있는 마커를 제거합니다
												removeMarker();
												
												for ( var i=0; i<places.length; i++ ) {
											
													// 마커를 생성하고 지도에 표시합니다
													var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
														marker = addMarker(placePosition, i), 
														itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
											
													// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
													// LatLngBounds 객체에 좌표를 추가합니다
													bounds.extend(placePosition);
											
													// 마커와 검색결과 항목에 mouseover 했을때
													// 해당 장소에 인포윈도우에 장소명을 표시합니다
													// mouseout 했을 때는 인포윈도우를 닫습니다
													(function(marker, title) {
														kakao.maps.event.addListener(marker, 'click', function() {
															displayInfowindow(marker, title);
														});
											
														/* kakao.maps.event.addListener(marker, 'mouseout', function() {
															infowindow.close();
														}); */
											
														itemEl.onclick =  function () {
															displayInfowindow(marker, title);
														};
											
														/* itemEl.onmouseout =  function () {
															infowindow.close();
														}; */ 
													})(marker, places[i].place_name);
											
													fragment.appendChild(itemEl);
												}
											
												// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
												listEl.appendChild(fragment);
												menuEl.scrollTop = 0;
											
												// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
												map.setBounds(bounds);
											}
											
											// 검색결과 항목을 Element로 반환하는 함수입니다
											function getListItem(index, places) {
											
												var el = document.createElement('li'),
												itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
															'<div class="info">' +
															'   <h5>' + places.place_name + '</h5>';
											
												if (places.road_address_name) {
													itemStr += '    <span>' + places.road_address_name + '</span>' +
																'   <span class="jibun gray">' +  places.address_name  + '</span>';
												} else {
													itemStr += '    <span>' +  places.address_name  + '</span>'; 
												}
															 
												  itemStr += '  <span class="tel">' + places.phone  + '</span>' +
															'</div>';           
											
												el.innerHTML = itemStr;
												el.className = 'item';
											
												return el;
											}
											
											// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
											function addMarker(position, idx, title) {
												var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
													imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
													imgOptions =  {
														spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
														spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
														offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
													},
													markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
														marker = new kakao.maps.Marker({
														position: position, // 마커의 위치
														image: markerImage 
													});
											
												marker.setMap(map); // 지도 위에 마커를 표출합니다
												markers.push(marker);  // 배열에 생성된 마커를 추가합니다
											
												return marker;
											}
											
											// 지도 위에 표시되고 있는 마커를 모두 제거합니다
											function removeMarker() {
												for ( var i = 0; i < markers.length; i++ ) {
													markers[i].setMap(null);
												}   
												markers = [];
											}
											
											// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
											function displayPagination(pagination) {
												var paginationEl = document.getElementById('pagination'),
													fragment = document.createDocumentFragment(),
													i; 
											
												// 기존에 추가된 페이지번호를 삭제합니다
												while (paginationEl.hasChildNodes()) {
													paginationEl.removeChild (paginationEl.lastChild);
												}
											
												for (i=1; i<=pagination.last; i++) {
													var el = document.createElement('a');
													el.href = "#";
													el.innerHTML = i;
											
													if (i===pagination.current) {
														el.className = 'on';
													} else {
														el.onclick = (function(i) {
															return function() {
																pagination.gotoPage(i);
															}
														})(i);
													}
											
													fragment.appendChild(el);
												}
												paginationEl.appendChild(fragment);
											}
											
											// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
											// 인포윈도우에 장소명을 표시합니다
											function displayInfowindow(marker, title) {
												var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
											
												infowindow.setContent(content);
												infowindow.open(map, marker);
												
												$.ajax({
													type : "get", // 요청방식
													url : "ex01Ajax?title="+title,// 요청할 서버페이지
													dataType : "text", // 응답받을 방식
													success : function(data) {
														$('#co').html(data);
														// 서버페이지와 통신에 성공한 후에 행동
														 // alert(data);
														
													},
													error : function() {
														// 서버페이지와 통신에 실패한 후에 행동
	
													}
													
												})
												
											}
											
											 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
											function removeAllChildNods(el) {   
												while (el.hasChildNodes()) {
													el.removeChild (el.lastChild);
												}
											}
											</script>
									</div>
									
									
								</section>
								<!---------------------------------------MAP 끝 ------------------------------------------->

							<!-- Section -->
								 <section>
									<header class="major">
										<h2>세부내용 확인</h2>
									</header>
									<div id="co" class="features" style="margin: 0 0 2em 0em;">
										<!-- <article>
											<span class="icon fa-gem"></span>
											<div class="content">
												<h3>Portitor ullamcorper</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article> -->
										<!-- <article>
											<span class="icon solid fa-paper-plane"></span>
											<div class="content">
												<h3>Sapien veroeros</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article> -->
										<!-- <article>
											<span class="icon solid fa-rocket"></span>
											<div class="content">
												<h3>Quam lorem ipsum</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article>
										<article>
											<span class="icon solid fa-signal"></span>
											<div class="content">
												<h3>Sed magna finibus</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article> -->
									</div>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>일단비워둘께!!</h2>
									</header>
									<!-- <div class="posts">
										<article>
											<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a>
											<h3>Interdum aenean</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic02.jpg" alt="" /></a>
											<h3>Nulla amet dolore</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic03.jpg" alt="" /></a>
											<h3>Tempus ullamcorper</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic04.jpg" alt="" /></a>
											<h3>Sed etiam facilis</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic05.jpg" alt="" /></a>
											<h3>Feugiat lorem aenean</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic06.jpg" alt="" /></a>
											<h3>Amet varius aliquam</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
									</div> -->
								</section>

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="index.html">Homepage</a></li>
										<li><a href="generic.html">Generic</a></li>
										<li><a href="elements.html">Elements</a></li>
										<!-- <li>
											<span class="opener">Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Etiam Dolore</a></li>
										<li><a href="#">Adipiscing</a></li>
										<li>
											<span class="opener">Another Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Maximus Erat</a></li>
										<li><a href="#">Sapien Mauris</a></li>
										<li><a href="#">Amet Lacinia</a></li>
									</ul> -->
								</nav>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>현재 코로나 상황을 넣고싶어</h2>
									</header>
									<div class="mini-posts">
										<article>
											<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
									</div>
									<ul class="actions">
										<li><a href="#" class="button">More</a></li>
									</ul>
								</section>

							<!-- Section -->
								<!-- <section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
									<ul class="contact">
										<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
										<li class="icon solid fa-phone">(000) 000-0000</li>
										<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
										Nashville, TN 00000-0000</li>
									</ul>
								</section> -->

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