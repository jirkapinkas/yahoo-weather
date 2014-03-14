<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
hello world funguje!

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

<div class="currentDate"></div>

<script>
var repeatme = function print() {
	$.ajax({
		url : 'http://localhost:8080/rest/items/date',
		cache : false
	}).done(function(data) {
		var date = new Date(data);
		$(".currentDate").html("aktualni datum: " + date);
	});
};

$(document).ready(function() {
	repeatme();
	setInterval(repeatme, 1000);
});

</script>
</body>
</html>