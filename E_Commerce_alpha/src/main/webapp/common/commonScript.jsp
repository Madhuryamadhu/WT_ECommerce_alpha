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
function isValid(value){
	if(value==null||value==''||value=='undefined'||value=='NaN'||value=='null')
		return false;
	
	return true;
}

function loadNewPage(pagePath,parameters,Id){
	var dataArray = {};
	dataArray["pagePath"]=pagePath;
	dataArray["parameters"]=parameters;
	$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "goToPage",
			data : JSON.stringify(dataArray),
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

function formObjMap(objString){
	var returnObj={};
	objString=objString.substring(1, objString.length-1);
	objString=objString.replace(/\s/g,'');
	var outerList=objString.split(',');
	for(var i=0;i<outerList.length;i++){
		var innertList=outerList[i].split('=');
		returnObj[innertList[0]]=innertList[1];
	}
	return returnObj;
}

</script>
</html>
