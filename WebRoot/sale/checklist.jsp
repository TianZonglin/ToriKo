<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%> 
<%@ page import="java.sql.Timestamp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Map<String, Object> map = ActionContext.getContext().getSession();
	ArrayList<Integer> listid = (ArrayList<Integer>)map.get("conlistid");
	ArrayList<String> storename = (ArrayList<String>)map.get("constorename");
	ArrayList<String> foodname = (ArrayList<String>)map.get("confoodname");
	ArrayList<Integer> price = (ArrayList<Integer>)map.get("conprice");
	ArrayList<Integer> number = (ArrayList<Integer>)map.get("connumber");
	ArrayList<Timestamp> paytime = (ArrayList<Timestamp>)map.get("conpaytime");
	String consumerName  = (String)map.get("consumerName");
	map.remove("conlistid");
	map.remove("constorename");
	map.remove("confoodname");
	map.remove("conprice");
	map.remove("connumber");
	map.remove("conpaytime");
	map.remove("consumerName");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'checklist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 
<link href="/ToriKo/style.css" type="text/css" rel="stylesheet" />
  </head>
  
  <body>
 <div style="background:#666666;height:auto;color:white;"><br/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font color="#fc7534"><%=consumerName%></font></b><b>&nbsp;&nbsp;<%="的购物车"%></b><br>
    <table  width="100%" align="center" class="tab1" style="-ms-word-wrap: break-word; ord-break: break-all;" cellspacing="0" cellpadding="0">
    	<tr align="center" style="height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">
    		<td>listid</td>
	    	<td>storename</td>
	    	<td>foodname</td>
	    	<td>price</td>
	    	<td>number</td>
	    	<td>paytime</td> 
    	</tr>
	    <%for(int i=0;i<listid.size();i++){ %>
	    	<tr>
		    	<td><%=listid.get(i) %></td>
		    	<td><%=storename.get(i) %></td>
		    	<td><%=foodname.get(i) %></td>
		    	<td><%=price.get(i) %></td>
		    	<td><%=number.get(i) %></td>
		    	<td><%=paytime.get(i) %></td>	
	    	</tr>
	    <%} %>
    </table>
  </div>
  </body>
</html>
