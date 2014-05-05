<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 必须引入dwr的engine.js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/util.js"></script>
<!-- 将java的类引入 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/interface/hello.js"></script>
<script type="text/javascript">
	function upload() {
		var f = document.getElementById("uf");
		hello.upload(f,f.value,function(data){
			alert(data);
		});
	}
</script>
</head>
<body>
	<input type="file" id="uf"/> <input type="button" value="上传" onclick="upload()"/>
</body>
</html>