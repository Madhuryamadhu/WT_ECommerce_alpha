<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
<script type="text/javascript">

function loadNewPage(pagePath,parameters,Id){
	$.ajax({
			type : "POST",
			url : "goToPage",
		    data : {
			"pagePath" : pagePath,
			"parameters" : parameters
		},
			success : function(data) {
				 $('#'+Id).empty();
			     $('#'+Id).html(data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
			},
			done : function(e) {
				console.log("getTypeDetails DONE");
			}
		});
}


</script>
</html>
