<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <!-- ✅ Load CSS file for FullCalendar  -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css"
      integrity="sha512-KXkS7cFeWpYwcoXxyfOumLyRGXMp7BTMTjwrgjMg0+hls4thG2JGzRgQtRfnAuKTn2KWTDZX4UdPg+xTs8k80Q=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

 </head>

 
  </head>
  <body>
  <!-- jquery -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <div id='calendar'></div>

    
 <script>
 $(document).ready(function() {
	 $('#calendar').fullCalendar({

		 	header: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'month,basicWeek,basicDay'
		    },
			locale : 'ko',
		    navLinks: true,
		    editable: true,
		    droppable: true,
		    eventLimit: true, 
		    events: '/schedule/data',
		    themesystem: 'jquery-ui',
		    cache: true,
		    eventStartEditable: false,
		    eventStop: function(event, delta, revertFunc){
		        console.log(event);
		        event_data = {
		                id: event.id,
		                startDate: event.start, 
		                endDate: event.end
		        }; 

		        console.log("Now event data"); 
		        console.log(event_data);
		        rep = $.ajax({
		            url: '/schedule/data/update', 
		            data: event_data, 
		            type: 'PATCH'
		        })
		    },
		    eventClick: function(calEvent, jsEvent, view) {
		        window.location.href='/schedule/appointments/'+calEvent.id+'/detail';            
		    },
		    dateClick: function() {
		        alert('a day has been clicked!');
		      }

		   
		});
	 
 });
 
     /* document.addEventListener('DOMContentLoaded', function() {
    	get_questions();
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {        	
            selectable: true,
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            dateClick: function(info) {
            	let date = info.dateStr;
              alert(date);
            }
          });

          calendar.render();
      });
      */ 
      function get_questions(){
    	  $.ajax({
    		  url: '/calender_view/getData',
    		  dataType: 'json', 
  			  success: function(plan) {
  			set_calendar(plan);
  			}
    	  })
    	  
      }
      

    </script>   



<!-- moment -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<!-- ✅ load FullCalendar ✅ -->
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"
      integrity="sha512-o0rWIsZigOfRAgBxl4puyd0t6YKzeAw9em/29Ag7lhCQfaaua/mDwnpE2PVzwqJ08N7/wqrgdjc2E0mwdSY2Tg=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    ></script>
	
  </body>

</html>