<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>LSF | Home</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- iCheck -->
<link href="css/green.css" rel="stylesheet">
<!-- bootstrap-progressbar -->
<link href="css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
<!-- jVectorMap -->
<link href="css/maps/jquery-jvectormap-2.0.3.css" rel="stylesheet" />
<link href="css/switchery.min.css" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="build/css/custom.min.css" rel="stylesheet">
<link href="css/custom.css" rel="stylesheet">


<script src="http://d3js.org/d3.v3.js"></script>
<script src="js/angular/angular.min.js" type="text/javascript"></script>
<script src="views/menu/menu.js" type="text/javascript"></script>
<style type="text/css">
	element.style{
		box-shadow : rgb(160,177,173)0px 0px 0px 11px inset;
	}
</style>
</head>

<body class="nav-md">
 <% String key_request = request.getParameter("key"); %>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/notf-viz"
     user="root"  password=""/>
		<sql:query dataSource="${snapshot}" var="result">
		SELECT * from vnotf_records where hash_key = <%= key_request %> ;
		</sql:query>
		<sql:query dataSource="${snapshot}" var="result_title">
		SELECT hash_key_title from vnotf_records where hash_key = <%= key_request %> limit 1 ;
		</sql:query>

	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"> <span>LSF-Dashboard</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile">
						<div class="profile_pic">
							<img src="images/img.jpg" alt="..."
								class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>NOTF-Viz</span>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

				      <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		              <div class="menu_section">
		                <h3>Visualization</h3>
		                <ul class="nav side-menu">
		                  <c:forEach var="row" items="${result_title.rows}">
		                  <li><a><i class="fa fa-home"></i> <c:out value="${row.hash_key_title}"/> <span class="fa fa-chevron-down"></span></a>
		                  </c:forEach>
		                    <ul class="nav child_menu">
		                    <c:forEach var="row" items="${result.rows}">
		                      <li><a href=".\heatmap.jsp?key=<%= key_request %>&<c:out value="${row.parameters}"/>"><c:out value="${row.menu_item_name}"/></a></li>
		                    </c:forEach>
		                    </ul>
		                  </li>
		                 
		                </ul>
		              </div>          
            </div>
				</div>
			</div>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav class="" role="navigation">
						<div class="nav toggle">
							<a id="menu_toggle"><i class="fa fa-bars"></i></a>
						</div>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="row">

					<div class="col-md-12 col-sm-12 col-xs-12" ng-controller="chart_back">
						<div class="dashboard_graph">
							<div class="row x_title">
								<div class="col-md-6">
									<div id="page_title"></div>
								</div>
								<div class="col-md-3">
                           			<div class="">
			                            <label>
			                              <input id="bg_color" type="checkbox" class="js-switch"  /> Background Color 
			                            </label>
			                        </div>
								</div>
							</div>

							<div id="tooltip" class="hidden">
								<p>
									<span id="value">
								</p>
							</div>
							<div id="chart" ></div>
							<div class="clearfix"></div>
						</div>
					</div>
					<!-- end of first graph -->
					<br />





				</div>
			</div>
		</div>
		<!-- /page content -->

		<!-- footer content -->
		<footer>
			<div class="pull-right">
				Gentelella - Bootstrap Admin Template by <a href="#">Colorlib</a>
			</div>
			<div class="clearfix"></div>
		</footer>
		<!-- /footer content -->
	</div>
	</div>



	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="js/fastclick.js"></script>
	<!-- NProgress -->
	<script src="js/nprogress.js"></script>
	<!-- Chart.js -->
	<script src="js/Chart.min.js"></script>
	<!-- gauge.js -->
	<script src="js/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script src="js/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="js/icheck.min.js"></script>
	<!-- Skycons -->
	<script src="js/skycons.js"></script>
	<!-- Flot -->
	<script src="js/jquery.flot.js"></script>
	<script src="js/jquery.flot.pie.js"></script>
	<script src="js/jquery.flot.time.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script src="js/flot/jquery.flot.orderBars.js"></script>
	<script src="js/flot/date.js"></script>
	<script src="js/flot/jquery.flot.spline.js"></script>
	<script src="js/flot/curvedLines.js"></script>
	<!-- jVectorMap -->
	<script src="js/maps/jquery-jvectormap-2.0.3.min.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="js/moment/moment.min.js"></script>
	<script src="js/datepicker/daterangepicker.js"></script>
	<script src="js/switchery.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="build/js/custom.min.js"></script>
	<script type="text/javascript">
	
	
	$.urlParam = function(name){
		var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
			if (results==null){
				return null;
			}else{
				return results[1] || 0;
			}	
		}
	var colLabel,cellSize=10,row_number=20,rowLabel;
	var tabel = $.urlParam('tabel');
	var col_number= $.urlParam('col');
	var y_col = $.urlParam('y_col');
	var title_main = $.urlParam('title_main').replace("%20"," ").replace("%20"," ");
	var title_sub = $.urlParam('title_sub');
	
	$("#page_title").html("<h3>"+title_main+" <small> "+ title_sub +" </small></h3>");
	
	if($.urlParam('csize') != null){cellSize = $.urlParam('csize');}
	if($.urlParam('rows') != null){row_number = $.urlParam('rows');}
	//console.log("kkkkk : "+row_number);
	//console.log("llll : "+row_number);
	if(row_number == 20){
		rowLabel = ['com1','com2','com3','com4','com5','com6','com7','com8','com9','com10','com11','com12','com13','com14','com15','com16','com17','com18','com19','com20']; 
	}else if(row_number == 15){
		rowLabel = ['com1','com2','com3','com4','com5','com6','com7','com8','com9','com10','com11','com12','com13','com14','com15']; 
	}else if(row_number == 25){
		//console.log("llllkkk : "+row_number);
		rowLabel = ['com1','com2','com3','com4','com5','com6','com7','com8','com9','com10','com11','com12','com13','com14','com15','com16','com17','com18','com19','com20','com21','com22','com23','com24','com25']; 
	}
	//console.log("PPPPP :"+rowLabel);
	
	if(y_col === 'date'){
		colLabel = ['2-Jan' , '5-Jan', '6-Jan', '7-Jan', '8-Jan', '9-Jan', '12-Jan', '13-Jan', '14-Jan', '15-Jan', '16-Jan', '20-Jan', '21-Jan', '22-Jan', '23-Jan', '26-Jan', '27-Jan', '28-Jan', '29-Jan', '30-Jan', '2-Feb', '3-Feb', '4-Feb', '5-Feb', '6-Feb', '9-Feb', '10-Feb', '11-Feb', '12-Feb', '13-Feb', '17-Feb', '18-Feb', '19-Feb', '20-Feb', '23-Feb', '24-Feb', '25-Feb', '26-Feb', '27-Feb', '1-Mar', '2-Mar', '3-Mar', '4-Mar', '5-Mar', '8-Mar', '9-Mar', '10-Mar', '11-Mar', '12-Mar', '15-Mar', '16-Mar', '17-Mar', '18-Mar', '19-Mar', '22-Mar', '23-Mar', '24-Mar', '25-Mar', '26-Mar', '29-Mar', '30-Mar', '31-Mar', '1-Apr', '2-Apr', '5-Apr', '6-Apr', '7-Apr', '8-Apr', '12-Apr', '13-Apr', '14-Apr', '15-Apr', '16-Apr', '19-Apr', '20-Apr', '21-Apr', '22-Apr', '23-Apr', '26-Apr', '27-Apr', '28-Apr', '29-Apr', '30-Apr', '3-May', '4-May', '5-May', '6-May', '7-May', '10-May', '11-May', '12-May', '13-May', '14-May', '17-May', '18-May', '19-May', '20-May', '21-May', '24-May', '25-May', '26-May', '27-May', '28-May', '1-Jun', '2-Jun', '3-Jun', '4-Jun', '7-Jun', '8-Jun', '9-Jun', '10-Jun', '14-Jun', '15-Jun', '16-Jun', '17-Jun', '18-Jun', '21-Jun', '22-Jun', '23-Jun', '24-Jun', '25-Jun', '28-Jun', '29-Jun', '30-Jun', '1-Jul', '2-Jul', '6-Jul', '7-Jul', '8-Jul', '9-Jul', '12-Jul', '13-Jul', '14-Jul', '15-Jul', '16-Jul', '19-Jul', '20-Jul', '21-Jul', '22-Jul', '23-Jul', '26-Jul', '27-Jul', '28-Jul', '29-Jul', '30-Jul', '2-Aug', '3-Aug', '4-Aug', '5-Aug', '6-Aug', '9-Aug', '10-Aug', '11-Aug', '12-Aug', '13-Aug', '16-Aug', '17-Aug', '18-Aug', '19-Aug', '20-Aug', '23-Aug', '24-Aug', '25-Aug', '26-Aug', '27-Aug', '30-Aug', '31-Aug', '1-Sep', '2-Sep', '3-Sep', '7-Sep', '8-Sep', '9-Sep', '10-Sep', '13-Sep', '14-Sep', '15-Sep', '16-Sep', '17-Sep', '20-Sep', '21-Sep', '22-Sep', '23-Sep', '24-Sep', '27-Sep', '28-Sep', '29-Sep', '30-Sep', '1-Oct', '4-Oct', '5-Oct', '6-Oct', '7-Oct', '8-Oct', '11-Oct', '12-Oct', '13-Oct', '14-Oct', '15-Oct', '18-Oct', '19-Oct', '20-Oct', '21-Oct', '22-Oct', '25-Oct', '26-Oct', '27-Oct', '28-Oct', '29-Oct', '1-Nov', '2-Nov', '3-Nov', '4-Nov', '5-Nov', '8-Nov', '9-Nov', '10-Nov', '11-Nov', '12-Nov', '15-Nov', '16-Nov', '17-Nov', '18-Nov', '19-Nov', '22-Nov', '23-Nov', '24-Nov', '26-Nov', '29-Nov', '30-Nov', '1-Dec', '2-Dec', '3-Dec', '6-Dec', '7-Dec', '8-Dec', '9-Dec', '10-Dec', '13-Dec', '14-Dec', '15-Dec', '16-Dec', '17-Dec', '20-Dec', '21-Dec', '22-Dec', '23-Dec', '27-Dec', '28-Dec', '29-Dec', '30-Dec', '31-Dec'];
	}else if(y_col === 'permno'){
		colLabel = [10078,10104,10107,10108,10138,10145,10147,10225,10299,10324,10401,10562,10696,10725,
		            10874,10909,10942,11081,11308,11404,11415,11552,11600,11607,11618,11674,11703,11754,
		            11762,11850,11896,11955,11970,11976,12052,12062,12067,12073,12079,12140,12369,12431,
		            12456,12490,12503,12542,12558,12872,13035,13056,13100,13103,13119,13141,13142,13168,
		            13356,13407,13567,13586,13598,13688,13721,13788,13856,13901,13928,13936,13963,14008,
		            14011,14297,14322,14323,14541,14542,14593,14601,14656,14702,14891,15069,15077,15202,
		            15472,15553,15560,15579,15667,15720,16424,16432,16600,16678,17005,17478,17750,17806,
		            17830,18016,18092,18163,18403,18411,18729,19350,19393,19502,19561,20053,20204,20220,
		            20482,20626,21186,21207,21371,21573,21776,21792,21936,21979,22032,22103,22111,22293,
		            22509,22517,22592,22752,22779,22840,23026,23077,23085,23114,23309,23318,23473,23501,
		            23660,23712,23819,23887,23915,23931,23990,24010,24046,24109,24205,24221,24272,24360,
		            24459,24563,24643,24766,24803,24942,25013,25081,25099,25320,25419,25487,25769,25778,
		            25785,25953,26112,26332,26403,26518,26710,26825,27422,27430,27633,27713,27756,27828,
		            27887,27959,27983,27991,28222,28345,28388,29102,29946,30382,30681,30940,32379,32791,
		            32870,34032,34746,34817,34833,35044,35051,35554,36397,36468,36469,37161,37284,37584,
		            38156,38578,38682,38703,38762,39490,39642,39917,40061,40125,40272,40416,40539,41080,
		            41355,41443,42024,42083,42200,42534,42585,42796,42906,43123,43350,43449,43553,43772,
		            44206,44601,44644,44951,45241,45277,45356,45495,45671,45751,45794,46578,46674,46877,
		            46886,47159,47175,47466,47896,47941,48267,48274,48485,48486,48506,48725,48960,49015,
		            49154,49373,49429,49656,49905,50017,50032,50227,50876,50906,51043,51263,51369,51377,
		            51596,51706,52038,52090,52230,52329,52337,52476,52695,52708,52919,52978,53065,53225,
		            53479,53613,53831,53866,54148,54181,54690,54827,55976,56223,56232,56274,56573,57568,
		            57665,57817,57904,58094,58246,58318,58683,58990,59010,59176,59184,59192,59248,59328,
		            59379,59408,59440,59459,60097,60206,60442,60506,60599,60628,60871,60943,60986,61065,
		            61241,61399,61621,61735,61743,61815,62092,62148,62308,62519,62770,62834,63060,63765,
		            63830,64186,64282,64311,64390,64451,64565,64653,64936,64995,65138,65330,65787,65875,
		            65883,65947,66093,66114,66157,66181,66325,66384,66800,67467,67598,68144,68304,68591,
		            68857,69032,69550,69796,70033,70092,70308,70332,70500,70519,70536,70578,71175,71563,
		            71686,72726,73139,73940,75034,75100,75154,75175,75186,75224,75241,75257,75333,75489,
		            75510,75573,75577,75592,75607,75646,75789,75819,75825,75828,75857,75912,76076,76082,
		            76090,76149,76171,76201,76226,76240,76282,76557,76565,76605,76614,76619,76624,76625,
		            76638,76639,76644,76656,76708,76712,76744,76757,76804,76841,76887,77063,77129,77150,
		            77178,77182,77274,77281,77284,77338,77418,77462,77481,77496,77546,77605,77606,77659,
		            77661,77668,77702,77730,77768,77976,78034,78083,78139,78263,78840,78877,78916,78927,
		            78975,78987,79057,79089,79094,79103,79108,79129,79145,79212,79237,79265,79323,79411,
		            79545,79547,79588,79637,79718,79879,79881,79915,79973,80055,80080,80100,80204,80266,
		            80286,80303,80381,80399,80406,80599,80681,80711,80913,81055,81061,81126,81138,81262,
		            81285,81481,81540,81593,81655,81774,81776,81857,81910,82196,82298,82307,82598,82618,
		            82642,82643,82651,82686,82775,83111,83143,83332,83421,83435,83443,83462,83583,83596,
		            83601,83693,83699,83862,83906,83976,83981,84001,84020,84032,84036,84129,84176,84342,
		            84372,84373,84381,84519,84769,84788,85032,85058,85072,85073,85238,85257,85269,85271,
		            85348,85459,85516,85522,85592,85593,85631,85663,85753,85792,85913,85914,85926,85963,
		            86021,86102,86111,86136,86158,86176,86228,86305,86314,86339,86356,86414,86580,86591,
		            86725,86756,86783,86799,86845,86868,86946,86964,86979,87055,87070,87137,87184,87267,
		            87292,87299,87432,87447,87536,87657,87717,87842,88031,88313,88319,88352,88587,88590,
		            88661,88668,88837,88845,88853,88991,89001,89002,89003,89004,89006,89014,89070,89071,
		            89105,89179,89195,89258,89301,89303,89393,89463,89495,89508,89509,89525,89533,89626,
		            89641,89757,89813,89954,90038,90071,90110,90162,90199,90215,90319,90352,90386,90435,
		            90441,90537,90547,90601,90609,90805,90808,90829,90880,90979,90993,91063,91068,91143,
		            91207,91218,91233,91380,91388,91391,91392,91461,91547,91556,91611,91650,91883,91926,
		            91937,92121,92156,92157,92293,92602,92611,92618,92655]
		}else if(y_col === 'naics'){
			colLabel = ['AGR(11)','OIL_GAS(21)','UTIL(22)','CONSTR(23)','MANUF(31)','MANUF(32)','MANUF(33)','TRADE(42)','RETAIL(44)','RETAIL(45)','TRANS_WHR(48)','TRANS_WHR(49)','INF(51)','FIN_INF(52)','REALEST(53)','SERV(54)','MGMT(55)','ASWMR(56)','EDU(61)','HLTH(62)','A&E(71)','ACC_FOOD(72)','OTHER(81)','PUBADMIN(92)']; 
		}
	
	
	
	
	/*
	
	
	
	$(document).ready(function(){
		var tabel = $.urlParam('tabel');
		//console.log (aa);
		draw_HeatMap(tabel);
	});*/
	</script>
	<script src="js/graph_us/heatmap.js" type="text/javascript"></script>
	<script type="text/javascript">
	//console.log("clor :"+$("#bg_color").attr('checked', true));
	
		 $('#bg_color').click(function() {
			var $bg_color = $( this );
			if ($bg_color.prop( "checked" )) {
				$('#chart').css('background-color', '#2a3f54');
			}else{
				$('#chart').css('background-color', 'white');
			}
			//console.log("clorkk :" +$bg_color.prop( "checked" ));
			
		    /* if($(this).is(":checked")) {
		    	
		       // var returnVal = confirm("Are you sure?");
		        //$(this).attr("checked", returnVal);
		    } */
		 });      
		
	</script>

	<!-- /Skycons -->

	<!-- Doughnut Chart -->

</body>
</html>
    