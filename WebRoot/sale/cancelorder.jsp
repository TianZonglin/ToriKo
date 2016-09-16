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
	function dodel(cname,sname,oid){
		//alert(cname+sname+oid);
	    cname = encodeURI(cname); cname = encodeURI(cname); 
		sname = encodeURI(sname); sname = encodeURI(sname);
	 
   		$.ajax({
			type : "post",
			async:false,
			url : "/ToriKo/cancelorder.action?consumerName="+cname+"&storeName="+sname+"&orderId="+oid,
			success : function(result) {
				if(result=="failure"){
					alert("删除失败：订单号不存在!");
				}else{
					alert("删除成功!");
					window.location.href="/ToriKo/checklist2.action?consumerName="+cname;
				}
			},
			failure:function(){
			}
   		});
	}
</script>
</head>

<body>
 <div style="background:#444444;">
<%@ include file="../header.jsp" %>


	<div class="main" >
		<div style="text-aglin:center;">
    <%=consumerName+"的购物车"%><br>
    	<div style="overflow:auto;height:350px;">
    <table   width="100%" align="center" class="tab1" style="-ms-word-wrap: break-word; ord-break: break-all;" cellspacing="0" cellpadding="0">
    	<tr bgcolor="#ffdd99">
    		<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">订单编号</td>
	    	<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">商家名称</td>
	    	<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">食物名称</td>
	    	<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">食品单价</td>
	    	<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">购买数量</td>
	    	<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">下单时间</td>
	    	<td  align="center" style="color:black;height:30px;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;">【删除】</td>  
    	</tr>
	    <%for(int i=0;i<listid.size();i++){ %>
	    	<tr bgcolor="#fff999">
		    	<td align="center" style="color:black;height:20px;"><%=listid.get(i) %></td>
		    	<td align="center" style="color:black;height:20px;"><%=storename.get(i) %></td>
		    	<td align="center" style="color:black;height:20px;"><%=foodname.get(i) %></td>
		    	<td align="center" style="color:black;height:20px;"><%=price.get(i) %></td>
		    	<td align="center" style="color:black;height:20px;"><%=number.get(i) %></td>
		    	<td align="center" style="color:black;height:20px;"><%=paytime.get(i) %></td>	
		    	<td align="center" style="color:black;height:20px;"><input type="image" src="/ToriKo/images/del.jpg" onclick="dodel('<%=user%>','<%=storename.get(i)%>','<%=listid.get(i)%>')"/></td>	
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

