<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="layout/header.jsp" />

<div class="jumbotron">

	<p>
		This application uses <a href="http://developer.yahoo.com/weather/" target="_blank">Yahoo weather Rest API</a> to retrieve current weather in some US state / city. Database is limited, but it's not the point of this demo.
		This project is to showcase Spring Boot, Spring Data JPA, REST web. services (XML and JSON) and Spring Cache.
	</p>
	<br />

	<form action="" method="post" id="formular" class="form-horizontal">
		<div class="form-group">
			<label class="col-md-3 control-label">What's the weather in:</label>
			<div class="col-md-3">
				<input type="text" name="city" id="city" class="form-control" />
			</div>
			<div class="col-md-1">
				<input type="submit" class="btn btn-md btn-primary" />
			</div>
		</div>
	</form>

</div>
	
<script>
	$(document).ready(function() {
		$("#formular").submit(function(event) {
			event.preventDefault();
			var city = $("#city").val();
			$.getJSON("weather.json?city=" + city, function(data) {
				var weather = "<h1>" + data.channel.description + ":</h1>";
				$.each(data.channel.item.forecasts, function(key, value) {
					weather += value.date + ": low: " + value.low + ", high: " + value.high;
					// this is not the full list, but it's what's mostly used
					if(value.text.indexOf("Sunny") != -1 || value.text.indexOf("Clear") != -1) {
						weather += "<img src='resources/img/sunny.png' />";
					}
					else if(value.text.indexOf("Cloud") != -1) {
						weather += "<img src='resources/img/cloudy.png' />";
					}
					else if(value.text.indexOf("Snow") != -1) {
						weather += "<img src='resources/img/snow.png' />";
					}
					else if(value.text.indexOf("Thunder") != -1) {
						weather += "<img src='resources/img/thunder.png' />";
					}
					else if(value.text.indexOf("Showers") != -1 || value.text.indexOf("Rain") != -1) {
						weather += "<img src='resources/img/rain.png' />";
					}
					else {
						weather += ", " + value.text;
					}
					weather += "<br>";
				});
				$("#result").html(weather);
			}).fail(function() {
			    $("#result").html('<p>Sorry, no such US state / city in a database. Try: "Washington", "Alaska", "California", "Florida"</p>');
			});
		});
	});
</script>

<div id="result" class="jumbotron">
	<p>Tip: Try one of these states: "Washington", "Alaska", "California", "Florida".</p>
</div>

<jsp:include page="layout/footer.jsp" />