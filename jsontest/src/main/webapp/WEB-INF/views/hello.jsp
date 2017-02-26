<!Doctype HTML>
<html>
	<head>
		<title>Json Test</title>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
		
		<script type="text/javascript">
			$(document).ready(function(){
				var countries = $.parseJSON('${countries}');
				
					$('#destination').append();
					$('#arrive').append();
					$('#depart').append();
					$('#depart').append();
					
					
					for(var x = 0; x < countires.length; x++){
						$('#Guests').append('<option value="' + countires[x].code + '">' + countires[x].name + '</option>');
						$('#Guests').append('<option value="' + countires[x].code + '">' + countires[x].name + '</option>');

					}
					
					$('#hotelName').append();
					$('#hotelName').append();
					
					
				
			});
		</script>
	</head>
	<body>
 <form action="findHotels.html" method="post">
			<!-- <h3>Country</h3>
			<select name="country" id="country">
			</select>
			
			<input type="submit" value="submit" />-->
			
	<div class="form-group">
	    <h2 class="heading">Search Hotels</h2>
		<div class="col-1-3 col-1-3-sm">
			<div class="controls">
			  <label for="name">Destination</label>
			  <input type="text" id="destination" class="floatLabel" name="name">
		</div>
    </div>
	
	
    <div class="grid">
    <div class="col-1-4 col-1-4-sm">
      <div class="controls">
		<label for="arrive" class="label-date"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Check-in</label>
        <input type="date" id="arrive" class="floatLabel" name="arrive" value="<?php echo date('Y-m-d'); ?>">
        
      </div>      
    </div>
    <div class="col-1-4 col-1-4-sm">
      <div class="controls">
	    <label for="depart" class="label-date"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Check-out</label>
        <input type="date" id="depart" class="floatLabel" name="depart" value="<?php echo date('Y-m-d'); ?>" />
      </div>      
    </div>
      </div>
      <div class="grid">
    <div class="col-1-3 col-1-3-sm">
      <div class="controls">
	   <label for="fruit"><i class="fa fa-male"></i>&nbsp;&nbsp;Guests</label>
        <i class="fa fa-sort"></i>
        <select class="floatLabel">
          <option value="blank"></option>
          <option value="1">1</option>
          <option value="2" selected>2</option>
          <option value="3">3</option>
        </select>
       
      </div>      
    </div>
	
	<div class="col-1-3 col-1-3-sm">
		<div class="controls">
		  <label for="name">Hotel name</label>
		  <input type="text" id="hotelName" class="floatLabel" name="name">
		</div>
    </div>
	
	
    <div class="col-1-3 col-1-3-sm">
    <div class="controls">
      <i class="fa fa-sort"></i>
	  <label for="fruit">Hotel class</label>
      <select class="floatLabel">
        <option value="blank" selected>Show all</option>
        <option value="1">1 star or more</option>
        <option value="2">2 star or more</option>
		<option value="3">3 star or more</option>
		<option value="4">4 star or more</option>
		<option value="5">5 stars</option>
      </select>

     </div>     
    </div>

   
     </div>
      <div class="grid">
            <button type="Search" value="Submit" class="col-1-4">Search</button>
      </div>  
  </div> <!-- /.form-group -->
		</form>
	</body>
</html>