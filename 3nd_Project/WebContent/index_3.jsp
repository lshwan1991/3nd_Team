<%@page import="java.util.List"%>
<%@page import="org.openqa.selenium.WebElement"%>
<%@page import="Test.Ajax.Crawling"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
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
      @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css); .nanumgothic * { font-family: 'Nanum Gothic', sans-serif; }
      @font-face { font-family: 'GmarketSansMedium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff'); font-weight: normal; font-style: normal; }
      @font-face {
       font-family: 'GmarketSansLight';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
       font-weight: normal;
       font-style: normal;
   }
            
          @font-face {
          font-family: 'GmarketSansBold';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
          font-weight: normal;
          font-style: normal;
      }
            
         
         
         
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
         
         
         
         /* 메인 이미지 */
            .zoom {
            overflow: hidden;
           /*  padding: 10px; */
            background-color: #fff;
            border: 1px solid #e5e5e5;
            box-shadow: 0px 0px 20px 0px #e5e5e5;
            box-sizing: border-box;
            border-radius: 20px;
            transition: transform .5s;
            width: 300px;
            height: 300px;
            margin: 2%;
            display: inline-block; /* 가로로 배치 */
            opacity: 0.7; 
            filter: alpha(opacity=50);


         
         }
         
         .zoom:hover {
            -ms-transform: scale(1.1);
            -webkit-transform: scale(1.1);
            transform: scale(1.1);
            opacity: 1.0;
            filter: alpha(opacity=100);
         }
         
         .zoom img {
            width: 300px;
            height: 300px
            
         }
         
         

         /* map */

      .map_wrap,
        .map_wrap * {
            margin: 0;
            padding: 0;
            font-family: 'Malgun Gothic', dotum, 'GmarketSansLight', sans-serif;
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
            font-family: 'Malgun Gothic', dotum, 'GmarketSansLight', sans-serif;
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
        
        
/* gauge    */

		  /* .current-roll {
		     -webkit-appearance: none;
		     width: 80%;
		     height: 25px;
		     next line does nothing 
		      color: #f7a700;
		}  
		
		 .current-roll2 {
		     -webkit-appearance: none;
		     width: 80%;
		     height: 25px;
		     next line does nothing
		      color: #f7a700; 
		}  
		
		
		progress.current-roll::-webkit-progress-bar {
		     background: #fffaf0;
		     border-radius: 5px;
		}
		progress.current-roll::-webkit-progress-value {
		     background: red;
		     border-radius: 5px;
		}
		
		
		progress.current-roll2::-webkit-progress-bar {
		     background: #fffaf0;
		     border-radius: 5px;
		}
		progress.current-roll2::-webkit-progress-value {
		     background: blue;
		     border-radius: 5px;
		}*/
		
		
		
		.progress {
    height: 20px;
    margin-bottom: 20px;
    overflow: hidden;
    background-color: #f5f5f5;
    border-radius: 4px;
    /* -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,.1); */
    box-shadow: inset 0 1px 2px rgba(0,0,0,.1);
    }
    
    .progress-bar-success {
    background-color: #5cb85c;
}
.progress-bar-danger {
    background-color: #d9534f;
}

.progress.active .progress-bar, .progress-bar.active {
    /* -webkit-animation: progress-bar-stripes 2s linear infinite; */
    /* -o-animation: progress-bar-stripes 2s linear infinite; */
    animation: progress-bar-stripes 2s linear infinite;
}

.progress-striped .progress-bar, .progress-bar-striped {
    /* background-image: -webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent); */
    /* background-image: -o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent); */
    background-image: linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);
    /* -webkit-background-size: 40px 40px; */
    background-size: 40px 40px;
}
.progress-bar {
    float: left;
    /* width: 0; */
    height: 100%;
    font-size: 12px;
    line-height: 20px;
    color: #fff;
    text-align: center;
    /* background-color: #428bca; */
    -webkit-box-shadow: inset 0 -1px 0 rgba(0,0,0,.15);
    box-shadow: inset 0 -1px 0 rgba(0,0,0,.15);
    -webkit-transition: width .6s ease;
    -o-transition: width .6s ease;
    transition: width .6s ease;
}

 @keyframes progress-bar-stripes{from{background-position:40px 0;}






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
      
      <!-- bar -->
      <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" /> -->
  	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
  	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
      
   </head>
   <body class="is-preload" style="background-color: #fff;">
      

      <!-- Wrapper -->
      
         <div id="wrapper">
            

            <!-- Main -->
            <!-- 묶을꺼야-->
            
               <div id="main">
                  <div class="inner">
                     <div style="display: block;">
                        <img src="images/care.png" width="200px" height="80px"><br>
                     </div>
                     <!-- Header -->
                     <div><!--  style="background-color: #000" -->
                     <header id="header">
                      
                     <div> <!-- style="background-color: #fff; width: 700px; height: 600px;" -->
                     
                        
                     
                           
                           <section> <!-- color: #9E9E9E; -->
                              <header class="major">
                                 <!-- <h4 style="font-family: THE스피드;">매장 CCTV를 분석 안전한 매장을 추천해주는 서비스</h4> -->
                                 <h1 style="font-family: 나눔고딕; color:#263238!important; padding: 10px; margin-bottom:50px; margin-top: 50px" class="mb-5 text-primary font-weight-bold"  data-aos="fade-up" style="width: 100px;">Care - Zone 에서<br> <span style="font-family: 나눔고딕; color:#263238 ;" class="typed-words">편리하게 보여드립니다.</span></h1>
                                 <script src="js/typed.js"></script> 
                                 <script>
                                 var typed = new Typed('.typed-words', {
                                 strings: ["코로나부터 안전한 매장 확인","확진자 이동경로 확인"," 매장의 방역 유무 확인", " 함께 이길수 있습니다!"],
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
                     <!-- 여기까지 -->
                     <div text-align:center;">
                           <!-- main img  -->
                              <div id="main_img">
                                 <div class="zoom"><img alt="" src="images/main_img1.jpg"></div>
                                 <div class="zoom"><img alt="" src="images/main_img2.jpg"></div>
                                 <div class="zoom"><img alt="" src="images/main_img3.jpg"></div>
                              </div>
                           
                        </div>
                     </div>
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
                              
                              <div style="background-color: #8EA3CA; width: 1000px;">
                              <header>
                                 <h5  style="padding: 0px 10px 1px;
                                 margin: 10px 0px 5px;
                                 border-left-width: 5px;
                                 border-left-style: solid;
                                 border-left-color: slateblue;
                                 font-size: 24pt; color: #fff;
                                 font-family: '나눔고딕';
                                 border-bottom-width: 1px;
                                 letter-spacing: -0.07em;
                                 text-align: left;
                                 background-color: slateblue(250,250,250);">Map Page</h5>
                              </header>
                           </div>
                           
                              <!-- <div  style="background-color: #8EA3CA; width: 1000px">
                                 <img alt="no" src="images/map_1.png" style="width: 40px">
                                 <h4 style="font-size: 20pt"><strong>MAP </strong>Page</h4>
                              </div>
                               -->
                               	
                                    <h3 style="font-family: 나눔고딕">장소를 선택하세요.</h3>
                                    <h3 style="font-family: 나눔고딕">장소를 선택하고 아래 안전점수를 확인하세요.</h3>
                                    <p style="margin-top:-12px"></p>
                               
                              
                              <!--  map 시작    ----------------------------------------------------------------------------->
                                 
                                 <div class="map_wrap">
                                    <div id="map" style="width:1000px;height:500px;position:relative;overflow:hidden; box-shadow: 20px 20px 20px grey;"></div>
                                    <ul id="category" style="left:800px;">
                              
                                       <li id="CE7" data-order="4">
                                          <span class="category_bg cafe"></span>
                                          카페
                                       </li>
                                       <li id="FD6" data-order="1">
                                          <span class="category_bg restaurant"></span>
                                          식당
                                       </li>
                                       <li id="CS2" data-order="5">
                                          <span class="category_bg store"></span>
                                          편의점
                                       </li>
                              
                                    </ul>
                              
                              
                                    <div id="menu_wrap" class="bg_white">
                                       <div class="option">
                                          <div>
                                             <form onsubmit="searchPlaces(); return false;" style="font-size: 15px; font-family: 나눔고딕; color: #000">키워드 : <input type="text" value="광주 맛집" id="keyword" size="15">
                                                <button type="submit" style="height: 40px; width: 60px;">검색하기</button>
                                             </form>
                                          </div>
                                       </div>
                                       <hr>
                                       <ul id="placesList"></ul>
                                       <div id="pagination"></div>
                                    </div>
                                 </div>
                              
                                 <script type="text/javascript"
                                    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=423cd019a50dfcc92ba9643b89dbfcd2&libraries=services"></script>
                                 <script>
                                    // 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
                                    var placeOverlay1 = new kakao.maps.CustomOverlay({ zIndex: 1 }),
                                       contentNode1 = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
                                       markers1 = []; // 카테고리검색 마커를 담을 배열입니다
                                    markers = []; // 키워드검색 마커를 담을 배열입니다
                                    currCategory1 = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
                              
                                    var mapContainer1 = document.getElementById('map'), // 지도를 표시할 div 
                                       mapOption1 = {
                                          center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                                          level: 5 // 지도의 확대 레벨
                                       };
                              
                              
                                    var map = new kakao.maps.Map(mapContainer1, mapOption1);
                              
                                    // 장소 검색 객체를 생성합니다
                                    var ps1 = new kakao.maps.services.Places(map);
                              
                                    // 지도에 idle 이벤트를 등록합니다
                                    kakao.maps.event.addListener(map, 'idle', searchPlaces1);
                              
                                    // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
                                    contentNode1.className = 'placeinfo_wrap';
                              
                                    // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
                                    // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
                                    addEventHandle1(contentNode1, 'mousedown', kakao.maps.event.preventMap);
                                    addEventHandle1(contentNode1, 'touchstart', kakao.maps.event.preventMap);
                              
                                    // 커스텀 오버레이 컨텐츠를 설정합니다
                                    placeOverlay1.setContent(contentNode1);
                              
                                    // 각 카테고리에 클릭 이벤트를 등록합니다
                                    addCategoryClickEvent1();
                              
                                    // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
                                    function addEventHandle1(target, type, callback) {
                                       if (target.addEventListener) {
                                          target.addEventListener(type, callback);
                                       } else {
                                          target.attachEvent('on' + type, callback);
                                       }
                                    }
                              
                                    // 카테고리 검색을 요청하는 함수입니다
                                    function searchPlaces1() {
                                       if (!currCategory1) {
                                          return;
                                       }
                              
                                       // 커스텀 오버레이를 숨깁니다 
                                       placeOverlay1.setMap(null);
                              
                                       // 지도에 표시되고 있는 마커를 제거합니다
                                       removeMarker1();
                              
                                       ps1.categorySearch(currCategory1, placesSearchCB1, { useMapBounds: true });
                                    }
                              
                                    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
                                    function placesSearchCB1(data, status, pagination) {
                                       if (status === kakao.maps.services.Status.OK) {
                                          // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
                                          displayPlaces1(data);
                                       } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
                                          // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
                              
                                       } else if (status === kakao.maps.services.Status.ERROR) {
                                          // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
                              
                                       }
                                    }
                              
                                    // 지도에 마커를 표출하는 함수입니다
                                    function displayPlaces1(places) {
                              
                                       // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
                                       // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
                                       var order = document.getElementById(currCategory1).getAttribute('data-order');
                              
                              
                              
                                       for (var i = 0; i < places.length; i++) {
                              
                                          // 마커를 생성하고 지도에 표시합니다
                                          var marker = addMarker1(new kakao.maps.LatLng(places[i].y, places[i].x), order);
                              
                                          // 마커와 검색결과 항목을 클릭 했을 때
                                          // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
                                          (function (marker, place) {
                                             kakao.maps.event.addListener(marker, 'click', function () {
                                                displayPlaceInfo(place);
                                             });
                                          })(marker, places[i]);
                                       }
                                    }
                              
                                    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
                                    function addMarker1(position, order) {
                                       var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                                          imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
                                          imgOptions = {
                                             spriteSize: new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
                                             spriteOrigin: new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                                             offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                                          },
                                          markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                                          marker = new kakao.maps.Marker({
                                             position: position, // 마커의 위치
                                             image: markerImage
                                          });
                              
                                       marker.setMap(map); // 지도 위에 마커를 표출합니다
                                       markers1.push(marker);  // 배열에 생성된 마커를 추가합니다
                              
                                       return marker;
                                    }
                              
                                    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
                                    function removeMarker1() {
                                       for (var i = 0; i < markers1.length; i++) {
                                          markers1[i].setMap(null);
                                       }
                                       markers1 = [];
                                    }
                              
                                    // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
                                    function displayPlaceInfo(place) {
                                       var content = '<div class="placeinfo">' +
                                          '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';
                              
                                       if (place.road_address_name) {
                                          content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                                             '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
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
                              
                              
                                    // 각 카테고리에 클릭 이벤트를 등록합니다
                                    function addCategoryClickEvent1() {
                                       var category = document.getElementById('category'),
                                          children = category.children;
                              
                                       for (var i = 0; i < children.length; i++) {
                                          children[i].onclick = onClickCategory;
                                       }
                                    }
                              
                                    // 카테고리를 클릭했을 때 호출되는 함수입니다
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
                              
                                    // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
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
                                       ps1.keywordSearch(keyword, placesSearchCB);
                                    }
                                    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
                                    var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });
                                    
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
                              
                                       for (var i = 0; i < places.length; i++) {
                              
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
                              
                                       // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
                                       listEl.appendChild(fragment);
                                       menuEl.scrollTop = 0;
                              
                                       // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                                       map.setBounds(bounds);
                                    }
                              
                                    // 검색결과 항목을 Element로 반환하는 함수입니다
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
                              
                                    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
                                    function addMarker(position, idx, title) {
                                       var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                                          imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                                          imgOptions = {
                                             spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                                             spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
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
                                       for (var i = 0; i < markers.length; i++) {
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
                              
                                    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
                                    // 인포윈도우에 장소명을 표시합니다
                                    function displayInfowindow(marker, title) {
                                       var button_test = '<br><a href="#score_test" style="font-family: 나눔고딕">상세보기</a>'
                                        var content = '<div style="padding:5px; z-index:1; width:150px; font-family:나눔고딕; font-weight:bold;"><center>' + title + button_test + '</center></div>';
                                       
                                       infowindow.setContent(content);
                                       infowindow.open(map, marker);
                                       
                                       
                                       $.ajax({
                                                      type : "get", // 요청방식
                                                      url : "ex01Ajax?title="+title,// 요청할 서버페이지
                                                      dataType : "json", // 응답받을 방식
                                                      success : function(data) {
                                                         var title = data.title;
                                                         var ex = data.address+data.tel+data.score;
                                                         
                                                         $('#co').html(title);
                                                         $('#co1').html(ex);
                                                         
                                                         var score = data.score;
                                                         
                                                         $('#co').text(title);
                                                         $('#co1').text(ex);
                                                         
                                                         if(score == 5.0){
                                                             $('#img1').attr("style","width:20%");
                                                             $('#img1').attr("class","progress-bar progress-bar-danger progress-bar-striped active");
                                                          }else{
                                                             $('#img1').attr("style","width:80%");
                                                             $('#img1').attr("class","progress-bar progress-bar-success progress-bar-striped active");
                                                          }
                                                          
                                                          if(score == 5.0){
                                                              $('#img2').attr("style","width:80%");
                                                              $('#img2').attr("class","progress-bar progress-bar-success progress-bar-striped active");
                                                           }else{
                                                              $('#img2').attr("style","width:20%");
                                                              $('#img2').attr("class","progress-bar progress-bar-danger progress-bar-striped active");
                                                           }
                                                         
                                                         
                                                         // 서버페이지와 통신에 성공한 후에 행동
                                                          //alert(data);
                                                         
                                                      },
                                                      error : function() {
                                                         // 서버페이지와 통신에 실패한 후에 행동
                                                       
                  
                                                      }
                                                      
                                                   })
                                       
                                       
                                    }
                              
                                    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
                                    function removeAllChildNods(el) {
                                       while (el.hasChildNodes()) {
                                          el.removeChild(el.lastChild);
                                       }
                                    }
                                    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
                                    var zoomControl = new kakao.maps.ZoomControl();
                                    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
                              
                                    
                                    
                                    /////////////////// 현재 위치 /////////////////////////////////////
                              
                                    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
                                    if (navigator.geolocation) {
                              
                                       // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                                       navigator.geolocation.getCurrentPosition(function (position) {
                              
                                          var lat = position.coords.latitude, // 위도
                                             lon = position.coords.longitude; // 경도
                              
                                          var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                                             message = '<div style="padding:5px; width:150px; font-family:나눔고딕; font-weight:bold;">현재 접속 위치</div>'; // 인포윈도우에 표시될 내용입니다
                              
                                          // 마커와 인포윈도우를 표시합니다
                                          displayMarker(locPosition, message);
                              
                                       });
                              
                                    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
                              
                                       var locPosition = new kakao.maps.LatLng(35.118267, 126.868662),
                                          message = '현재 위치를 사용할수 없습니다.'
                              
                                       displayMarker(locPosition, message);
                                    }
                                    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
                                    function displayMarker(locPosition, message) {
                              
                                       // 마커를 생성합니다
                                       var marker2 = new kakao.maps.Marker({
                                          map: map,
                                          position: locPosition
                                       });
                              
                                       var iwContent = message, // 인포윈도우에 표시할 내용
                                          iwRemoveable = true;
                              
                                       // 인포윈도우를 생성합니다
                                       var infowindow2 = new kakao.maps.InfoWindow({
                                          content: iwContent,
                                          removable: iwRemoveable
                                       });
                              
                                       // 인포윈도우를 마커위에 표시합니다 
                                       infowindow2.open(map, marker2);
                              
                                       // 지도 중심좌표를 접속위치로 변경합니다
                                       map.setCenter(locPosition);
                                    }
                                 </script>
                              </header>
                              
                              <!---------------------------------------MAP-------------------------------------------->
               <div>
                              
                                 
            </div>                  
                                 <!-----------------------------------------------map 끝 ----------------------------->
                                 </script>
                                 
                           </div>
                           
                              
                           
                        </section>
                        <div id="score_test">
                           <div style="background-color: #8EA3CA; width: 1000px; height: 50px">
                              <header>
                                 <h5  style="padding: 0px 10px 1px;
                                 margin: 10px 0px 5px;
                                 border-left-width: 5px;
                                 border-left-style: solid;
                                 border-left-color: slateblue;
                                 font-size: 24pt; color: #fff;
                                 font-family: '나눔고딕';
                                 border-bottom-width: 1px;
                                 letter-spacing: -0.07em;
                                 background-color: slateblue(250,250,250);">안전점수</h5>
                              </header>
                           </div>
                              <section class="demo-3" style="font-family: 나눔고딕;">
                                 <div class="grid" style="float: left;">
                                 
                                 <!-- 매장 정보 ---------------------------------------------------->
                                 <div class="box" style="color: #000000; font-size: 30px">   
                                      <svg xmlns="http://www.w3.org/2000/svg" width=100%" height="100%">
                                        <line class="top" x1="0" y1="0" x2="900" y2="0"/>
                                        <line class="left" x1="0" y1="460" x2="0" y2="-920"/>
                                        <line class="bottom" x1="300" y1="460" x2="-600" y2="460"/>
                                        <line class="right" x1="300" y1="0" x2="300" y2="1380"/>
                                      </svg>
                                      <!-- <img src="images/food.png" width="150px" height="200px" style="padding: 10px;"> -->
                                      <a style="font-size: 25px; color: #000">마스크 점수</a>
                                      <div align="left">
                                      <div style="float: left; width: 100px; height: 30px;">
                                           <span style="font-size: 15px; margin-right: 0px;">사업자 명 : &nbsp</span>
                                      </div>
                                      
                                      
                                      <div style="float: left; width: 100px; height: 30px;">
                                           <span id="co"></span>
                                      </div>
                                      <div style="float: left;  width: 100px; height: 30px;">
                                          <span style="font-size: 15px; margin-right: 0px;">번호 : &nbsp</span>
                                      </div>
                                      <div style="float: left; width: 100px; height: 30px;">
                                          <span id="co1"></span>
                                      </div>
                                      <div style="float: left;width: 100px; height: 30px;">
                                          <span style="font-size: 15px">받아올 값 : &nbsp</span>
                                      </div>
                                       </div>
                                    </div>
                                 
                                 
                                 
                                 
                                 <!-- 마스크 점수 -->
                                    <div class="box" style="color: #000000; font-size: 30px">   
                                      <svg xmlns="http://www.w3.org/2000/svg" width=100%" height="100%">
                                        <line class="top" x1="0" y1="0" x2="900" y2="0"/>
                                        <line class="left" x1="0" y1="460" x2="0" y2="-920"/>
                                        <line class="bottom" x1="300" y1="460" x2="-600" y2="460"/>
                                        <line class="right" x1="300" y1="0" x2="300" y2="1380"/>
                                      </svg>
                                      <!-- <img id="img1" src="images/loading.png" width="150px" height="200px" style="padding: 10px;"> -->
                                      <!-- <progress id="img1" class="current-roll2" value="10" max="100"></progress> -->
                                      
                                      <div class="progress" style="height: 25px;">
    								  	<div id="img1" class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"  style="width:80%;">
      									좋음
    									</div>
  									  </div>
                                      
                                      <a style="font-size: 25px; color: #000">마스크 점수</a>
                                      
                                     
                                      <div align="left">
                                      <div style="float: left; width: 100px; height: 30px;">
                                           <span style="font-size: 15px; margin-right: 0px;">사업자 명 : &nbsp</span>
                                      </div>
                                      <div style="float: left; width: 100px; height: 30px;">
                                           <span id="co"></span>
                                      </div>
                                      <div style="float: left;  width: 100px; height: 30px;">
                                          <span style="font-size: 15px; margin-right: 0px;">번호 : &nbsp</span>
                                      </div>
                                      <div style="float: left; width: 100px; height: 30px;">
                                          <span id="co1"></span>
                                      </div>
                                      <div style="float: left;width: 100px; height: 30px;">
                                          <span style="font-size: 15px">받아올 값 : &nbsp</span>
                                      </div>
                                       </div>
                                    </div>
                                    
                                    
                                    
                                    <!-- 방역 점수 -->
                                    <div class="box" style="color: #000000; font-size: 30px">
                                      <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
                                        <line class="top" x1="0" y1="0" x2="900" y2="0"/>
                                        <line class="left" x1="0" y1="460" x2="0" y2="-920"/>
                                        <line class="bottom" x1="300" y1="460" x2="-600" y2="460"/>
                                        <line class="right" x1="300" y1="0" x2="300" y2="1380"/>
                                      </svg>
                                      <!-- <img src="images/loading.png" width="150px" height="200px" style="padding: 10px;"> -->
                                      <!-- <progress id="img2" class="current-roll" value="20" max="100"></progress> -->
                                      
                                      <div class="progress" style="height: 25px;">
    								  	<div id="img2" class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"  style="width:20%;">
      									나쁨
    									</div>
  									  </div>
                                      
                                      <a style="font-size: 25px; color: #000">방역 유무</a>
                                     <div align="left">
                                      <div style="float: left; width: 100px; height: 30px;">
                                           <span style="font-size: 15px; margin-right: 0px;">받아올 값 : &nbsp</span>
                                      </div>
                                      <div style="float: left; width: 100px; height: 30px;">
                                           <span id="#"></span>
                                      </div>
                                      <div style="float: left;  width: 100px; height: 30px;">
                                          <span style="font-size: 15px; margin-right: 0px;">받아올 값 : &nbsp</span>
                                      </div>
                                      <div style="float: left; width: 100px; height: 30px;">
                                          <span id="#"></span>
                                      </div>
                                      <div style="float: left;width: 100px; height: 30px;">
                                          <span style="font-size: 15px">받아올 값 : &nbsp</span>
                                      </div>
                                     </div>
                                   </div>
                                 </div><!-- /grid -->
                                      
                                 	 
                               </section><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                               
                               <div>
		                           <div style="background-color: #8EA3CA; width: 1000px; height: 50px">
		                              <header>
		                                 <h5  style="padding: 0px 10px 1px;
		                                 margin: 10px 0px 5px;
		                                 border-left-width: 5px;
		                                 border-left-style: solid;
		                                 border-left-color: slateblue;
		                                 font-size: 24pt; color: #fff;
		                                 font-family: '나눔고딕';
		                                 border-bottom-width: 1px;
		                                 letter-spacing: -0.07em;
		                                 background-color: slateblue(250,250,250);">동영상</h5>
		                              </header>
                         		  </div>
                         		  	<h3 style="font-family: 나눔고딕">동영상을 재생 할꺼야</h3>
                         		  	
                         		  	<img src="images/image_test.png" style="width: 800px; height: 500px;"><br><br><br><br><br><br>
                         		  	
                         		  	
                         		  	
                         		  	
                                </div>	   
                               
                              



                        </div>
                           
                                 
                           
                              



                        
                        <!-- popup 창!-->
                        <!-- <button onclick="window.open('CSS3FluidParallaxSlideshow/Scroll.html','window_popup','width=800,height=450,top=100,left=400,location=no,status=no,scrollbars=yes, resizable=yes');" style="color: #000; box-shadow: inset 0 0 0 2px #000000;" id="test_but">상세보기</button> -->
                        <!--페이지 이동을 위한 버튼 -->
                           
                         
                        <!---------------------------------------MAP 끝 ------------------------------------------->
                         

                     

                     <!-- Section -->
                  <div>
                        <header class="major" > 
                        </header>
                     </div>                         

                  
               </div> 
               			
                           
                           
                 	  </div>
               
               
                             <!-- Sidebar -->
         
               <!--style="margin-top: 145px;"-->
               <div id="sidebar">
                  <div class="inner" >

                     <!-- Search -->
                        
                        <!-- <section id="search" class="alt">
                           <form method="post" action="#">
                              <input type="text" name="query" id="query" placeholder="Search" />
                           </form>
                        </section> -->

                     <!-- Menu -->
                     
                     

                     <!-- Section -->
                        <section style="margin: 0px;">
                           <header class="major">
                              <h3 style="text-align:center; font-family: 나눔고딕; font-size: 25pt; color: #000; font-weight:bold;">실시간 코로나 상황</h3>
                           </header>
                           <div class="mini-posts">
                        <article>
                                 <%
                                    Crawling craw = new Crawling();
                                    List<WebElement> list = craw.Crawling_Co();
                                    
                                    for(int i=0; i<list.size(); i++) {
                                       System.out.println(list.get(i).getText());
                                    }
                                 %>
                           
                              <div style="border: 5px solid #fff; font-family: 나눔고딕">
                                 
                                 <div style="background-color: #8EA3CA;">
                                    <span style="font-size: 18pt; font-family: 나눔고딕; font-weight: bold;  color: #fff;">확진환자</span>
                                 </div> 
                                 <div style="color: #000">
                                 <div style="background-color: #8EA3CA; opacity: 0.8;">
                                    <span style="font-size: 15pt; font-family: 나눔고딕; font-weight: bold; color: #000"><%=list.get(0).getText()%>명</span>
                                 </div><br>
                                 <div style="font-size: 15px; font-weight: bold;">
                                 <div align="center">
                                    <span>치료중 : &nbsp<%=list.get(1).getText()%>명</span>
                                 </div>
                                 <div align="center">
                                    <span>격리해제 : &nbsp<%=list.get(2).getText()%>명</span>
                                 </div>
                                 <div align="center">
                                    <span>사망 : &nbsp<%=list.get(3).getText()%>명</span>
                                 </div>
                                 </div>
                                 </div>
                              </div><br>
                              
                              
                              <div style="border: 5px solid #fff; font-family: 나눔고딕">
                                 
                                 <div style="background-color: #8EA3CA;">
                                    <span style="font-size: 18pt; font-family: 나눔고딕; font-weight: bold; color: #fff">검사현황</span>
                                 </div>
                                 <div style="color: #000">
                                 <div style="background-color: #8EA3CA; opacity: 0.8;">
                                    <span style="font-size: 15pt; font-family: 나눔고딕; font-weight: bold; color: #000"><%=list.get(4).getText()%>명</span>
                                 </div><br>
                                 <div style="font-size: 15px; font-weight: bold;">
                                 <div align="center">
                                    <span>양성 : &nbsp<%=list.get(5).getText()%>명</span> 
                                 </div>
                                 <div align="center">
                                    <span>음성 : &nbsp<%=list.get(6).getText()%>명</span>
                                 </div>
                                 <div align="center">
                                    <span>검사중 : &nbsp<%=list.get(7).getText()%>명</span>
                                 </div>
                                 </div>
                                 </div>
                              </div><br>      
                                 
                              <div style="border: 5px solid #fff; font-family: 나눔고딕">
                                 
                                 <div style="background-color: #8EA3CA;">
                                    <span style="font-size: 18pt; font-family: 나눔고딕; font-weight: bold; color: #fff">접촉자</span>
                                 </div>
                                 <div style="background-color: #8EA3CA; opacity: 0.8;">
                                    <span style="font-size: 15pt; font-family: 나눔고딕; font-weight: bold; color: #000"><%=list.get(8).getText()%>명</span>
                                 </div><br>
                                 <div style="font-size: 15px; font-weight: bold;">
                                 <div style="color: #000"> 
                                 <div align="center">
                                    <span>격리중 : &nbsp<%=list.get(9).getText()%>명</span>
                                 </div>
                                 <div align="center">
                                    <span>격리해제 : &nbsp<%=list.get(10).getText()%>명</span>
                                 </div>
                                 </div>
                                 </div>
                              </div><br>
                              
                              <div style="border: 5px solid #fff; font-family: 나눔고딕">
                                 
                                 <div style="background-color: #8EA3CA;">
                                    <span style="font-size: 18pt; font-family: 나눔고딕; font-weight: bold; color: #fff">자치구별 발생 현황</span>
                                 </div><br>
                                 <div style="font-size: 15px; font-weight: bold;">
                                 <div style="color: #000">
                                 <div align="center">
                                    <span>동구 : &nbsp<%=list.get(11).getText()%>명</span>
                                 </div>
                                 <div align="center">
                                    <span>서구 : &nbsp<%=list.get(12).getText()%>명</span>
                                 </div>
                                 <div align="center">
                                    <span>남구 : &nbsp<%=list.get(13).getText()%>명</span>
                                 </div>
                                 <div align="center">
                                    <span>북구 : &nbsp<%=list.get(14).getText()%>명</span>
                                 </div>
                                 <div align="center">
                                    <span>광산구 : &nbsp<%=list.get(15).getText()%>명</span>
                                 </div>
                                 </div>
                                 </div>
                              </div>   
                                 
                        </article>

                              
                              <article>
                                 <header class="major">
                                    <h3 style="text-align:center; font-family:나눔고딕; font-weight:bold; font-size: 25pt;">광주 선별 진료소</h3>
                                 </header>
                                 <a href="https://www.gwangju.go.kr/c19/c19/contentsView.do?pageId=coronagj6" target="blank" class="image"><img src="images/covid.jpg" alt="" align="middle" /></a>
                                 <p style="font-family: 나눔고딕;">광주광역시 선별진료소 페이지 입니다.</p>
                              </article>
                              <!-- <article>
                                 <header class="major">
                                    <strong style="font-family: THE스피드; font-size: 30px;">코로나 맵</strong><br><br>
                                 </header>
                                 <a href="https://coronamap.site/" class="image"><img src="images/코로나 맵.png" alt="" /></a>
                                 <p style="font-family: Cafe24Ohsquareair;">광주광역시 코로나 맵 페이지 입니다.</p>
                              </article> -->
                           </div>
                           <!-- <ul class="actions">
                              <li><a style="color: #000; box-shadow: inset 0 0 0 2px #000000;" href="#" class="button">More</a></li>
                           </ul> -->
                        </section>

                     <!-- Section -->
                        <section style="font-family: 나눔고딕">
                           <header class="major">
                              <h2>COMPANY</h2>
                           </header>
                           <p>CCTV를 통해  마스크 착용여부 비율, 착용시간을 분석과 이용자 수을 분석하여 
                              장소 및 가게의 안전성 평가 후 제공합니다. 좀더 쉽고 편리하게 보는 페이지 입니다.</p>
                           <ul class="contact">
                              <li class="icon solid fa-envelope"><a href="#">post_corona.co.kr</a></li>
                              <li class="icon solid fa-phone">(062) 655-3508</li>
                              <li class="icon solid fa-home">광주광역시 동구 중앙로 신나빌딩 7층 대표자 : 이승환  / 
                               사업자등록번호 : 178-82-000658254<br /></li>
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