<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<input id="hash">
<button onclick="getHash()">dd</button>
<script type="text/javascript">
function getHash(){
	var text =  $("input[id=hash]").val();
	location.href = "/hash?text="+text;
}
</script>
</body>
</html>
