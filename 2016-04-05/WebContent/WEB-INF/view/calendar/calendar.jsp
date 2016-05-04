<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Material Admin</title>

<!-- Vendor CSS -->
<link href="${root}/resource/vendors/animate-css/animate.min.css"
	rel="stylesheet">
<link href="${root}/resource/vendors/fullcalendar/fullcalendar.css"
	rel="stylesheet">
<link href="${root}/resource/vendors/sweet-alert/sweet-alert.min.css"
	rel="stylesheet">
<link
	href="${root}/resource/vendors/material-icons/material-design-iconic-font.min.css"
	rel="stylesheet">
<link href="${root}/resource/vendors/socicon/socicon.min.css"
	rel="stylesheet">

<!-- CSS -->
<link href="${root}/resource/css/app.min.1.css" rel="stylesheet">
<link href="${root}/resource/css/app.min.2.css" rel="stylesheet">
<link href="${root}/resource/css/bottom.css" rel="stylesheet">

</head>

<body>
	<section id="main">
		<section id="cal_content">
			<div class="container">
				<div id="calendar"></div>
				<!-- <div id="bottom"> -->
					<div id="contain">
					<div class="panel-group" id="accordion">
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">detail information</a>
					        </h4>
					      </div>
					      <div id="collapse1" class="panel-collapse collapse">
					        <div class="panel-body">
					        	<div id="event">
									<input readonly type="text" id="noticename"
										style="width: 100%;" /><br>
								</div>
								<div id="contents">
									<input readonly type="text" id="noticecontent"
										style="width: 100%; height: 123px;" />
								</div>
					        </div>
					      </div>
					    </div>
					    </div>
						<!-- <button type="button" class="btn btn-success"
							data-toggle="collapse" data-target="#demo">
							<span class="glyphicon glyphicon-collapse-down"></span> Open
						</button>
						<div id="demo" class="collapse">
							<br />
							<div id="eventbox">
								<div id="event">
									<input readonly type="text" id="noticename"
										style="width: 100%;" /><br>
								</div>
								<div id="contents">
									<input readonly type="text" id="noticecontent"
										style="width: 100%; height: 123px;" />
								</div>
							</div>
						</div> -->
					</div>
					<!-- Add event -->
					<div class="modal fade" id="addNew-event" data-backdrop="static"
						data-keyboard="false">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">Add an Event</h4>
								</div>
								<div class="modal-body">
									<form class="addEvent" role="form">
										<div class="form-group">
											<label for="eventName">Event Name</label>
											<div id="addNotice">
												<input type="text" class="input-sm form-control"
													id="eventName" name="title" placeholder="새로운 공지를 입력하세요.">
											</div>
											<div class="form-group">
											<label for="eventName">contents</label>
												<div id="addContent">
													<input type="text" class="input-sm form-control"
														id="newCotents" name="content">
												</div>
											</div>
										</div>

										<div class="form-group">
											<label for="eventName">Tag Color</label>
											<div class="event-tag">
												<span data-tag="bgm-teal" class="bgm-teal selected" name="className"></span>
												<span data-tag="bgm-red" class="bgm-red" name="className"></span> <span
													data-tag="bgm-pink" class="bgm-pink" name="className"></span> <span
													data-tag="bgm-blue" class="bgm-blue" name="className"></span> <span
													data-tag="bgm-lime" class="bgm-lime" name="className"></span> <span
													data-tag="bgm-green" class="bgm-green" name="className"></span> <span
													data-tag="bgm-cyan" class="bgm-cyan" name="className"></span> <span
													data-tag="bgm-orange" class="bgm-orange" name="className"></span> <span
													data-tag="bgm-purple" class="bgm-purple" name="className"></span> <span
													data-tag="bgm-gray" class="bgm-gray" name="className"></span> <span
													data-tag="bgm-black" class="bgm-black" name="className"></span>
											</div>
										</div>

										<input type="hidden" id="getStart" /> 
										<input type="hidden" id="getEnd" />
									</form>
								</div>

								<div class="modal-footer">
									<button type="submit" class="btn btn-link" id="addEvent">Add Event</button>
									<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>

					<!-- Modify event -->
					<div class="modal fade" id="modify-event" data-backdrop="static"
						data-keyboard="false">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">Modify an Event</h4>
								</div>
								<div class="modal-body">
									<form class="addEvent" role="form">
										<div class="form-group">
											<label for="eventName">New Notice</label>
											<div id="new">
												<input type="text" class="input-sm form-control"
													id="modifyEventName" name="title" placeholder="새로운 공지를 입력하세요.">
											</div>
										</div>
										<div class="form-group">
											<label for="eventName">Current Notice</label>
											<div id="current">
												<input type="text" class="input-sm form-control"
													id="currentEventName">
											</div>
										</div>
										<div class="form-group">
											<label for="eventName">contents</label>
												<div id="modifyContent">
													<input type="text" class="input-sm form-control"
														id="newCotents" name="content">
												</div>
										</div>

										<div class="form-group">
											<label for="eventName">Tag Color</label>
											<div class="event-tag">
												<span data-tag="bgm-teal" class="bgm-teal selected" name="className"></span>
												<span data-tag="bgm-red" class="bgm-red" name="className"></span> <span
													data-tag="bgm-pink" class="bgm-pink" name="className"></span> <span
													data-tag="bgm-blue" class="bgm-blue" name="className"></span> <span
													data-tag="bgm-lime" class="bgm-lime" name="className"></span> <span
													data-tag="bgm-green" class="bgm-green" name="className"></span> <span
													data-tag="bgm-cyan" class="bgm-cyan" name="className"></span> <span
													data-tag="bgm-orange" class="bgm-orange" name="className"></span> <span
													data-tag="bgm-purple" class="bgm-purple" name="className"></span> <span
													data-tag="bgm-gray" class="bgm-gray" name="className"></span> <span
													data-tag="bgm-black" class="bgm-black" name="className"></span>
											</div>
										</div>

										<input type="hidden" id="modifyGetStart" /> <input
											type="hidden" id="modifyGetEnd" />
									</form>
								</div>

								<div class="modal-footer">
									<button type="submit" class="btn btn-link" id="modifyEvent">Modify Notice</button>
									<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				<!-- </div> -->
			</div>
		</section>
	</section>

	<!-- Javascript Libraries -->
	<%-- <script src="${root}/resource/js/jquery-2.1.1.min.js"></script>
	<script src="${root}/resource/js/bootstrap.min.js"></script> --%>
 
	<script
		src="${root}/resource/vendors/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="${root}/resource/vendors/fullcalendar/lib/moment.min.js"></script>
	<script src="${root}/resource/vendors/fullcalendar/fullcalendar.min.js"></script>
	<script src="${root}/resource/vendors/waves/waves.min.js"></script>
	<script
		src="${root}/resource/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
	<script src="${root}/resource/vendors/sweet-alert/sweet-alert.min.js"></script>

	<%-- <script src="${root}/resource/js/functions.js"></script>
	<script src="${root}/resource/js/demo.js"></script> --%>

	<script type="text/javascript">
            $(document).ready(function() {
            	var today = new Date();
                var date = new Date();
                var start = new Date();
                var end = new Date();
                var d = date.getDate();
                var m = date.getMonth();
                var y = date.getFullYear();

                var cId = $('#calendar'); //Change the name if you want. I'm also using thsi add button for more actions

                var calNotices = new Array(); 
    			<c:forEach items="${ calNotice }" var="notice" >
					var calNotice = {};	
					calNotice.id = "${notice.calendarId}"
					calNotice.title = "${notice.title}";
					calNotice.description = "${notice.description}";
					calNotice.start = "${notice.startDate}";
					calNotice.end = "${notice.endDate}";
					calNotice.className = "${notice.className}";
					calNotices.push(calNotice);
				</c:forEach>
		/* 		console.log(calNotices[0].title)
				console.log(calNotices[0].description)
				console.log(calNotices[0].start)
				console.log(calNotices[0].end)
				console.log(calNotices[0].className)
				console.log(calNotices[0].id)
                 */
                //Generate the Calendar
                cId.fullCalendar({
                    header: {
                        right: '',
                        center: 'prev, title, next',
                        left: ''
                    },
                    
                     defaultView: 'month',

                    dayRender: function (date, cell) {
                        
                        end.setDate(today.getDate()+7);
                        var cellDate = $(cell).data('date');
                     
                        var todayDate;
                        
                        if(m+1 < 10 ){
                        	if(d < 10){
                        		todayDate = y+'-'+'0'+(m+1)+'-'+'0'+d;
                        	}else{
                        		todayDate = y+'-'+'0'+(m+1)+'-'+d;
                        	}

                        }else {
                        	if(d < 10){
                        		todayDate = y+'-'+(m+1)+'-'+'0'+d;
                        	}else{
                        		todayDate = y+'-'+(m+1)+'-'+d;
                        	}
							
						}
                        console.log("cellDate"+cellDate);
                        console.log("todayDate"+todayDate);
                        
                        if ( cellDate == todayDate) {
                            cell.css("background-color", "#a5cefc");
                        }
                        
                       /*  var start = new Date();
                        start.setDate(today.getDate()+1);
                        
                        
                        while(start <= end){
                            
                          //alert(start + "\n" + tomorrow);
                            if(start.getDate() == date.getDate()){
                                cell.css("background-color", "yellow");
                            }
                    
                            
                           var newDate = start.setDate(start.getDate() + 1);
                           start = new Date(newDate);
                        }         */
                    },   

                    fixedWeekCount: false,
                    contentHeight: 600,
                    eventLimit: true,
                    theme: true, //Do not remove this as it ruin the design
                    selectable: true,
                    selectHelper: true,
                    select: true,
                    editable: true,
					
                    //Add Events
                    events: calNotices,
                 //Cancel Event
                 eventRender: function(event, element) {
                        console.log(element);
                          var e = element
                                         .prepend("<span class='closeon'>&#10005;</span>");
                          //element.find('.fc-title').append("<br/>" + event.description);
                          
                          e.children('.closeon')
                             .attr('data-event-id', event._id) 
                             .click( function() {
                                var id = $(this).attr('data-event-id');
                                alert(id);
                                $('#calendar').fullCalendar('removeEvents',id);
                             });
                         /*  element.qtip({
                              content: event.description,
                              style: {
	                                  background: 'black',
	                                  color: '#FFFFFF'
                             		 },
                              position: {
                                 	 corner: {
			                                      target: 'center',
			                                      tooltip: 'bottomMiddle'
                                  			 }
                             			 }
                          }); */
                        },
                        
                   //event contents
                    /*  eventRender: function(event, element) {
					        element.qtip({
					            content: event.description
					        });
					    }, */
                     //Highlight Event
                         /*  eventRender: function(event, element, view) {
                            // event._id gets auto-populated, either event.id or auto-generated value
                            element.attr('data-id', event._id);
                            toggleClass(event._id);
                          }, 
                          eventClick: function(event, jsEvent, view) {
                            toggleClass(event._id);
                          }, */

                    //day click
                   dayClick: function(date, jsEvent, view) {
				        alert('Clicked on: ' + date.format());
				        
				    	$.post("/getDayChat"	
		                          , { 
		              					selectDay : date.format()
		                          	}
		                          , function(data) {
		       								 var jsonData3 = {};
		                             	try{
		         							jsonData3 = JSON.parse(data);
		         							if(jsonData3.success) {
		         								alert("정보가 입력되었습니다.");
		          								location.href="/showDayChat?selectDay="+date.format();
		         							}
		         							else {
		         								alert("정보가 안되었습니다..");
		          								location.href="/goMain";
		         							}
		         						}
		         						catch(e) {
		         							alert("예상치 못한 에러가 발생했습니다. 관리자에게 문의하세요.");
		         						}
		                          });
	                        
   					}, 
                          
                    //On Day Select
                  select: function(start, end, allDay) {
                        //$('#addNew-event').modal('show');
						
                        $('#addNew-event input:text').val('');
                        $('#addContent input:text').val('');
                        $('#current input:text').val('');
                        $('#getStart').val(start);
                        $('#getEnd').val(end);
                        var moment = $('.callender_area').fullCalendar('stickySource.title');
                    },
                    eventClick: function(calEvent, jsEvent, view) {
						
                    	// $('#modify-event').modal('show');
                    	$('#addNotice input:text').val('');
                        $('#current input:text').val(calEvent.title);
                        $('#modifyContent input:text').val(calEvent.description);
                        $('#event input:text').val('◎ 카톡 공지:   ' + calEvent.title);
                        $('#contents input:text').val('◎ 카톡 내용:   ' + calEvent.description);
                        $('#modifyGetStart').val(calEvent.start);
                        $('#modifyGetEnd').val(calEvent.end);
                        //alert(calEvent.description);

                        // change the border color just for fun
                        $(this).css('border-color', 'red');

                    }
                });

                /*  var today ='<ul class="actions actions-alt" id="todays">' +
                 			'</ul>'; */
	                              
              //Hightlight Event
               function toggleClass(id) {
                          /* Find all segments for the specific event and toggle a class */
                          var $event = $('a.fc-event[data-id="' + id + '"]');
                          $('a.my-highlight').each(function() {
                            $(this).toggleClass('my-highlight');
                          });
                          $.each($event, function() {
                            $(this).toggleClass('my-highlight');
                          });
                        }
              
                //Event Tag Selector
               (function(){
                    $('body').on('click', '.event-tag > span', function(){
                        $('.event-tag > span').removeClass('selected');
                        $(this).addClass('selected');
                    });
                })();
	
                //Add new Event
                $('body').on('click', '#addEvent', function(){
                    var newNoticeName = $('#eventName').val();
                 /*    alert(newNoticeName); */
                    var description = $('#newCotents').val();
                    var tagColor = $('.event-tag > span.selected').attr('data-tag');
                    var startDate = $('#getStart').val();
                    var endDate = $('#getEnd').val();
                    
                    if (newNoticeName != '') {
                    	  $.post("/calendar"	
                                  , { 
                                  		"title" : newNoticeName,
                              	 		"description" : description,
                                  		"className" : tagColor,
                                  		"getStart" : startDate,
                                  		"getEnd" : endDate,
                                  	}
                                  , function(data) {
               								 var jsonData3 = {};
	                                  	try{
	              							jsonData3 = JSON.parse(data);
	              							if(jsonData3.updateNotice) {
	              								
	              							alert("정보가 입력되었습니다.");
		              						location.href="/goMain";
	              							}
	              							else {}
	              						}
	              						catch(e) {
	              							alert("예상치 못한 에러가 발생했습니다. 관리자에게 문의하세요.");
	              						}
                                  });
                        //Render Event
                        $('#calendar').fullCalendar('renderEvent'
                        		,{
		                            title: newNoticeName,
		                            description: description,
		                            start: $('#getStart').val(),
		                            end:  $('#getEnd').val(),
		                            allDay: true,
		                            className: tagColor
                        		 },true ); //Stick the event
                        $('#addNew-event form')[0].reset();
                        $('#addNew-event').modal('hide');
                        
                    }
                    else {
                        $('#eventName').closest('.form-group').addClass('has-error');
                    }
                });
                
                //today click
                    $('#my-today-button').click(function() {
                    $('#calendar').fullCalendar('today');
                });
                
                // Modify an Event
                $('body').on('click', '#modifyEvent', function(){
                	
                	var newNoticeName = $('#modifyEventName').val();
                    var modifNoticeName = $('#noticeName').val();
                    var tagColor = $('.event-tag > span.selected').attr('data-tag');
                    
                    if (eventName != '') {
                    	<%//TODO 이벤트 정보를 AJAX로 보내서 DB에 저장해야함%>
                        //Render Event
                        $('#calendar').fullCalendar('renderEvent'
                        		,{
		                            title: newNoticeName,
		                            start: $('#modifyGetStart').val(),
		                            end:  $('#modifyGetEnd').val(),
		                            allDay: true,
		                            className: tagColor
                        		 }, true ); //Stick the event
                        
                        $('#modify-event form')[0].reset();
                        $('#modify-event').modal('hide');
                        
                    }
                    else {
                        $('#modifyEventName').closest('.form-group').addClass('has-error');
                    }
                });
				
                //confirm cencel
                /*  $('body').on('click', '#modifyEvent', function(){
                    var eventName = $('#modifyEventName').val();
                    var tagColor = $('.event-tag > span.selected').attr('data-tag');
                        
                    $('#modifyEventName').closest('.form-group').addClass('has-error');
                }); */
                //Calendar views
                $('body').on('click', '#fc-actions [data-view]', function(e){
                    e.preventDefault();
                    var dataView = $(this).attr('data-view');
                    
                    $('#fc-actions li').removeClass('active');
                    $(this).parent().addClass('active');
                    cId.fullCalendar('changeView', dataView);
                });
                
                /* $('body').on('click', '#todays', function(e){
                    e.preventDefault();
                   
                }); */
                
                /* $("body").on("click", ".fc-title", function() {
        			alert($(this).html());
        		}); */
        		
        		$('body').on('click', '#editButton', function(e){

        			var currentNotice = $("#currentEventName").val();
        			
        			var button = $("#editButton");
        			//console.log(currentNotice);
        			if (currentNotice != ""  ) { 
        				button.attr("data-target","#modify-event");
        			}
        			else {
    	            	button.attr("data-target","#addNew-event");
        			} 
        				
                });
            });
        </script>
</body>
</html>