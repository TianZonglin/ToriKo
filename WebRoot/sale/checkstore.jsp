<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%> 
<%@ page import="java.sql.Timestamp"%>
<%

	Map<String, Object> map = ActionContext.getContext().getSession();
	ArrayList<String> storename = (ArrayList<String>)map.get("sstorename");
	ArrayList<String> email = (ArrayList<String>)map.get("semail");
	ArrayList<String> storepalce = (ArrayList<String>)map.get("sstorepalce");
	ArrayList<Timestamp> logintime = (ArrayList<Timestamp>)map.get("slogintime");
	 
	map.remove("sstorename");
	map.remove("semail");
	map.remove("sstorepalce");
	map.remove("slogintime");
	 
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MaizeGo DataMine Platform</title>
<link href="/ToriKo/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/ToriKo/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="/ToriKo/js/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="/ToriKo/js/jquery.mousewheel-3.0.4.js"></script>
<link rel="stylesheet" type="text/css" href="/ToriKo/css/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#various1").fancybox({
			'titlePosition':'inside',
			'transitionIn':'none',
			'transitionOut':'none'
		});
	});
</script>
</head>

<body>
 <div style="background:#444444;">
<%@ include file="../header.jsp" %>


	<div class="main" >
		<div style="overflow:auto;height:400px;text-aglin:center;">
		    
		<table width="100%" align="center" class="tab1" style="-ms-word-wrap: break-word; ord-break: break-all;" cellspacing="0" cellpadding="0">
			  <tbody><tr bgcolor="#ffdd99">	
		 			<td align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;"><span>店铺名称</span></td>
		 			<td align="center" style="color:black;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;"><span>店铺地址</span></td>
		 			<td align="center" style="color:black;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;"><span>电子邮箱</span></td>
		 			<td align="center" style="color:black;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;"><span>注册时间</span></td>
		 		</tr>
		 	<%for(int i=0;i<storename.size();i++){ %>
		 		<tr bgcolor="#fff199">
		 			<td  align="center" style="color:black;height:40px;"><span><%=storename.get(i) %></span></td>
		 			<td  align="center" style="color:black;height:40px;"><span><%=storepalce.get(i) %></span></td>
		 			<td  align="center" style="color:black;height:40px;"><span><%=email.get(i) %></span></td>
		 			<td  align="center" style="color:black;height:40px;"><span><%=logintime.get(i) %></span></td>
		 		</tr>
		 	<%} %>
			</tbody></table> 
			 
	     </div>
  	</div>


<%@ include file="../footer.jsp" %>
 </div>
</body>
</html>
