<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
</head>
<body>

	<form action="" method="post" id="formular">
		city: <input type="text" name="city" id="city" /> <input type="submit" />
	</form>
	
	<script>
		$(document).ready(function() {
			$("#formular").submit(function(event) {
				event.preventDefault();
				var city = $("#city").val();
				$.getJSON("weather.json?city=" + city, function(data) {
					var weather = "<h1>" + data.channel.description + ":</h1>";
					$.each(data.channel.item.forecasts, function(key, value) {
						weather += value.date + ": low: " + value.low + ", high: " + value.high + "<br>";
					});
					$("#result").html(weather);
				}).fail(function() {
				    $("#result").html("sorry, nothing found :-(");
				});
			});
		});
	</script>
	
	<div id="result"></div>

</body>
</html>