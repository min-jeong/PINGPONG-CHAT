<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>PingPong Chat</title>
        <!-- Vendor CSS -->
        <link href="${root}/resource/vendors/animate-css/animate.min.css" rel="stylesheet">
        <link href="${root}/resource/vendors/bootgrid/jquery.bootgrid.min.css" rel="stylesheet">
        <link href="${root}/resource/vendors/fullcalendar/fullcalendar.css" rel="stylesheet">
        <link href="${root}/resource/vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
        <link href="${root}/resource/vendors/light-gallery/lightGallery.min.css" rel="stylesheet">
        <link href="${root}/resource/vendors/material-icons/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="${root}/resource/vendors/socicon/socicon.min.css" rel="stylesheet">
            
        <!-- CSS -->
        <link href="${root}/resource/css/app.min.1.css" rel="stylesheet">
        <link href="${root}/resource/css/app.min.2.css" rel="stylesheet">
        <link href="${root}/resource/css/display.property.css" rel="stylesheet">
        <link href="${root}/resource/css/profile.css" rel="stylesheet">
   	    <link href="${root}/resource/vendors/light-gallery/hovereffect.css" rel="stylesheet">
   	    
        <!-- Javascript Libraries -->
        <script src="resource/js/jquery-2.1.1.min.js"></script>
        <script src="resource/js/bootstrap.min.js"></script>
        
        <script src="${root}/resource/vendors/nicescroll/jquery.nicescroll.min.js"></script>
        <script src="${root}/resource/vendors/auto-size/jquery.autosize.min.js"></script>
        <script src="${root}/resource/vendors/bootgrid/jquery.bootgrid.min.js"></script>
        <script src="${root}/resource/vendors/waves/waves.min.js"></script>
        <script src="${root}/resource/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
        <script src="${root}/resource/vendors/sweet-alert/sweet-alert.min.js"></script>
     	<script src="${root}/resource/resource/vendors/fileinput/fileinput.min.js"></script>
     	<script src="${root}/resource/vendors/chosen/chosen.jquery.min.js"></script>
		<script src="${root}/resource/vendors/bootstrap-select/bootstrap-select.min.js"></script>
		<script src="${root}/resource/vendors/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        
        <script src="resource/js/functions.js"></script>
        <script src="resource/js/demo.js"></script> 
       		<script type="text/javascript">
            $(document).ready(function(){
                //Basic Example
                $("#data-table-basic").bootgrid({
                    css: {
                        icon: 'md icon',
                        iconColumns: 'md-view-module',
                        iconDown: 'md-expand-more',
                        iconRefresh: 'md-refresh',
                        iconUp: 'md-expand-less'
                    },
                });
                
                $("#upload").click( function move() {
					var elem = document.getElementById("myBar"); 
				    var width = 0;
				    var id = setInterval(frame, 180);
				    function frame() {
				        if (width >= 100) {
				            clearInterval(id);
				        } else {
				            width++; 
				            elem.style.width = width + '%'; 
				        }
				    }
				});
            });
        </script>
<style>
::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; }
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url('./images/bg.png') #efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}
html{scrollbar-3dLight-Color: #efefef; scrollbar-arrow-color: #dfdfdf; scrollbar-base-color: #efefef; scrollbar-Face-Color: #dfdfdf; scrollbar-Track-Color: #efefef; scrollbar-DarkShadow-Color: #efefef; scrollbar-Highlight-Color: #efefef; scrollbar-Shadow-Color: #efefef;}
#myProgress {
    position: relative;
    width: 100%;
    height: 30px;
    background-color: white;
}
#myBar {
    position: absolute;
    width: 1%;
    height: 100%;
    background-color: green;
}
</style>

</head>
<c:set var="Username" value="${ sessionScope._MEMBER_.name }" />
<c:set var="Useremail" value="${ sessionScope._MEMBER_.email }" />
<c:set var="leaderEmail" value="${ sessionScope._TEAM_.leaderEmail }" />
<c:set var="TeamID" value="${ sessionScope._TEAM_.teamId }" />
<%-- <c:set var="root" value="${pageContext.request.contextPath}" />  --%>
<body id="content" style="background-color: #ffffff">
       <header id="header">
            <ul class="header-inner">
                <li>
                    <div class="line-wrap">
                        <div class="line top"></div>
                        <div class="line center"></div>
                        <div class="line bottom"></div>
                    </div>
                </li>
                <li class="logo hidden-xs">
                    <a class="orgin" href="/goMain"  style="color: #323e4a;">PingPong Chat</a>
                </li>
               		 
              <li class="pull-right"  style="color: black;">
                <ul class="top-menu">
                	<li class="logo" style="position: relative; top: 1px;">
                    	<a class="my" href="/goMain" style="color: black;">
                    	<i class="md-timer-auto" style="width: 200%; height: 200%; color: #323e4a;"> Welcome ${ Username }  ( ${ Useremail } ) </i></a>
                	</li> 
                    <li class="dropdown" style="color: #323e4a; background-color: #71d1b2; border-radius : 5px 5px 5px 5px">
                        <a data-toggle="dropdown" class="tm-settings" href=""  ></a>
                        <ul class="dropdown-menu dm-icon pull-right" style="color: black; ">
                       		<li>
                            	<a href="/doLogout"><i class="md md-history"></i>Logout</a>
                            </li>
                            <li>
                                <a data-action="fullscreen" href=""><i class="md md-fullscreen"></i>Toggle Fullscreen</a>
                            </li>
                            <li>
                                <a href="/doAboutProfile"><i class="md md-person"></i> Privacy Settings</a>
                            </li>
                        </ul>
                    </li>
                    <li class="hidden-xs" id="chat-trigger" data-trigger="#chat" style="color: #323e4a; background-color: #71d1b2; border-radius : 5px 5px 5px 5px">
                        <a class="tm-chat" href=""></a>
                    </li>
                    </ul>
                </li>
            </ul>
        </header>
        
        <section id="main">
	        <div id="left_menu">
				<div id="profile">
					<jsp:include page="/WEB-INF/view/view/profile.jsp"></jsp:include>
				</div>
				<div id="team_menu">
					<jsp:include page="/WEB-INF/view/team/team_menu.jsp"></jsp:include>
				</div>
				<div id="mine">
					<jsp:include page="/WEB-INF/view/member/mine.jsp"></jsp:include>
				</div>
			</div>
			<div id="main_menu">
				<c:if test="${ TeamID eq null }">
				<div id="defaultPage">
				</div>
				</c:if>
				<c:if test="${ TeamID ne null }">
				<div id="defaultPage">
					<jsp:include page="/WEB-INF/view/view/main_view.jsp"></jsp:include>
				</div>
				</c:if>
			</div>
			<c:if test="${ TeamID eq null }">
			<aside id="chat">
				<div id="right_menu">
					<div id="calendar">
					</div>
					<div id="chatbyMem">
					</div>
					<div id="chatbyKeyword">
					</div>
				</div>
			</aside>
			</c:if>
			<c:if test="${ TeamID ne null }">
			 <aside id="chat">
				<div>
					<div id="calendar">
						<jsp:include page="/WEB-INF/view/calendar/calendar.jsp"></jsp:include>
					</div>
					<div id="chatbyMem">
						<jsp:include page="/WEB-INF/view/chat/chat_mem.jsp"></jsp:include>
					</div>
					<div id="chatbyKeyword">
						<jsp:include page="/WEB-INF/view/chat/chat_keyword.jsp"></jsp:include>
					</div>
				</div>
			</aside>
			</c:if>
	    <div class="clear"></div>
		</section>
	</body>
</html>