<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%> 
<%@ page import="java.sql.Timestamp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Map<String, Object> map = ActionContext.getContext().getSession();
	ArrayList<Integer> storderid = (ArrayList<Integer>)map.get("storderid");
	ArrayList<String> stfoodname = (ArrayList<String>)map.get("stfoodname");
	ArrayList<Integer> stnumber = (ArrayList<Integer>)map.get("stnumber");
	ArrayList<Integer> stprice = (ArrayList<Integer>)map.get("stprice");
	ArrayList<String> stconsumername = (ArrayList<String>)map.get("stconsumername");
	ArrayList<String> stconsumertel = (ArrayList<String>)map.get("stconsumertel");
	ArrayList<Timestamp> stordertime = (ArrayList<Timestamp>)map.get("stordertime"); 
	 
	map.remove("storderid");
	map.remove("stfoodname");
	map.remove("stnumber");
	map.remove("stprice");
	map.remove("stconsumername");
	map.remove("stconsumertel");
	map.remove("stordertime");
 
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
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
		<div style="text-aglin:center;color:white;">
    <%="尊敬的                                                                 "+user+"                            您好，近期订单情况如下："%><br>
    	<div style="overflow:auto;height:350px;">
    <table   width="100%" align="center" class="tab1" style="-ms-word-wrap: break-word; ord-break: break-all;" cellspacing="0" cellpadding="0">
    	<tr bgcolor="#ffdd99">
    		<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">订单编号</td>
	    	<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">商品名称</td>
	    	<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">商品数量</td>
	    	<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">商品单价</td>
	    	<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">购买用户</td>
	    	<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">用户联系方式</td> 
    		<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">订单生成时间</td> 
    	</tr>
	    <%for(int i=0;i<storderid.size();i++){ %>
	    	<tr bgcolor="#fff999">
		    	<td align="center" style="color:black;height:20px;"><%=storderid.get(i) %></td>
		    	<td align="center" style="color:black;height:20px;"><%=stfoodname.get(i) %></td>
		    	<td align="center" style="color:black;height:20px;"><%=stnumber.get(i) %></td>
		    	<td align="center" style="color:black;height:20px;"><%=stprice.get(i) %></td>
		    	<td align="center" style="color:black;height:20px;"><%=stconsumername.get(i) %></td>
		    	<td align="center" style="color:black;height:20px;"><%=stconsumertel.get(i) %></td>	
		    	<td align="center" style="color:black;height:20px;"><%=stordertime.get(i) %></td>	
	    	</tr>
	    <%} %>
    </table>
	</div>		 
	     </div>
  	</div>


<%@ include file="../footer.jsp" %>
 </div>
</body>
</html>

