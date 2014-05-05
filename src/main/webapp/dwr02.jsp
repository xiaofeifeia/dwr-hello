<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 必须引入dwr的engine.js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/interface/UserService.js"></script>
<script type="text/javascript">
	window.onload = init;
	//配置全局异常的处理
	dwr.engine.setErrorHandler(errorHandler);
	function init() {
		//在引入了util.js之后可以直接使用$("xxx")来获取id对象，但是通常不赞成使用，特别是在使用jquery之后
		initTable();
	}
	function search() {
		var id = document.getElementById("searchId").value;
		UserService.load(id,function(data){
			document.getElementById("searchResult").innerHTML = "搜索结果:"+data.name+"-->"+data.group.name;
		});
	}
	function initTable() {
		UserService.list(function(data){
			var t = document.getElementById("users");
			if(t.getElementsByTagName("tbody")[0])
				t.removeChild(t.getElementsByTagName("tbody")[0]);
			
			var tb = "<tbody>"
			for(var i=0;i<data.length;i++) {
				tb+="<tr><td>"+data[i].id+"</td><td>"+data[i].name+"</td><td>"+data[i].group.name+"</td></tr>"
			}
			tb+="</tbody>"
			t.innerHTML=t.innerHTML+tb;
		});
	}
	function addUser() {
		var uid = document.getElementById("userId").value;
		var uname = document.getElementById("username").value;
		var gid = document.getElementById("groupId").value;
		var gname = document.getElementById("groupName").value;
		var u = {"id":uid,"name":uname,group:{"id":gid,"name":gname}};
		UserService.add(u);
		initTable();
	}
	function deleteUser() {
		var did = document.getElementById("did").value;
		/*UserService.deleteUser(did,{
			callback:function(data){
				initTable();
			},
			errorHandler:function(msg,e) {
				
			}
		});*/
		UserService.deleteUser(did,function(data){
			initTable();
		});
				
	}
	
	function errorHandler(msg,e) {
		alert(msg);
		for(var eo in e) {
			alert(eo+"------>"+e[eo]);
		}
	}
</script>
</head>
<body>
<table id="users" border="1" width="700" align="center">
	<thead>
	<tr><td colspan="3">输入id:<input type="text" id="searchId"/><input type="button" value="search" id="searchBtn" onclick="search()"/></td></tr>
	<tr><td>用户标识</td><td>用户名</td><td>用户所在组</td></tr>
	</thead>
</table>
<p>
	<input type="text" id="did"/><input type="button" value="删除" onclick="deleteUser()"/>
</p>
<p>
用户名:<input type="text" id="username"/> 用户id:<input type="text" id="userId"/><br/>
组名称:<input type="text" id="groupName"/> 组id:<input type="text" id="groupId"/><br/>
<input type="button" value="添加用户" onclick="addUser()"/>
</p>

<div id="searchResult"></div>
</body>
</html>