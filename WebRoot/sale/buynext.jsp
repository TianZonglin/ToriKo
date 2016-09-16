<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%

	Map<String, Object> map = ActionContext.getContext().getSession();
	ArrayList<String> fname = (ArrayList<String>)map.get("foodname1");
	String sname = (String)map.get("storename1");
	ArrayList<Integer> price = (ArrayList<Integer>)map.get("price1");
	ArrayList<Integer> salesvolume = (ArrayList<Integer>)map.get("salesvolume1");
	for(int i=0;i<fname.size();i++){
		System.out.println(fname.get(i));
		System.out.println(price.get(i));
		System.out.println(salesvolume.get(i));
	}
	String user=(String)request.getSession().getAttribute("user"); 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    
    <title>购物车选单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="/ToriKo/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
 
	$(document).ready(function(){
	<%for(int i=0;i<fname.size();i++){%>
		$('#done<%=i%>').bind('click',function(){
			$('#change<%=i%>').attr("value","已加入"+$('#count<%=i%>').val()+"件")	
		});
	<%}%>
	});
	function doAdd(f,p,i,u,s){ //先执行
		 
		 var f = encodeURI(f); f = encodeURI(f); 
		 var u = encodeURI(u); u = encodeURI(u);
		 var s = encodeURI(s); param5 = encodeURI(s);
		 var n = $('#count'+i).val();
		 //alert(f+' '+p+' '+n+' '+u+' '+s);
		 $.ajax({
			type : "post",
			async:false,
			url : "/ToriKo/orderfood.action?foodName="+f+"&price="+p+"&number="+n+"&consumerName="+u+"&storeName="+s,
			success : function(result) {
				if(result=="failure"){
					alert("放入失败!");
				}else{
					alert("放入购物车成功!");
				}
			},
			failure:function(){
			}
   		 });
		 //window.location.href="/ToriKo/orderfood.action?foodName="+param1+"&price="+p+"&number="+n+"&consumerName="+param4+"&storeName="+sname;
	}
	function docheck(temp){
		 
		var temp = encodeURI(temp); temp = encodeURI(temp); 
		window.location.href="/ToriKo/checklist.action?consumerName="+temp;
	}
</script> 
  </head>
  
  <body> 

<div style="background:#666666;color:white;">
<div style="margin:center;margin-left:100px;">
  <br/><b><font color="#fc7534">选择需要加入购物车的商品</font></b><br/><br/>
    <b><font color="#fc7534"><%=sname%></font></b><b><%="的店铺："%></b><br/> <br/>
    <%for(int i=0;i<fname.size();i++){%>
    	<b><font color="#fc7534"><%="No."+(i+1)%></font></b><b><%="号商品    名称："+fname.get(i)+" 价格："+price.get(i)+" 销量："+salesvolume.get(i)%></b><br/><br/>
    	<input type="number" name="count" id="count<%=i%>"  min="1" max="10" step="1" value="1">
    	<input type="button" value="加入购物车" id="done<%=i%>" onclick="doAdd('<%=fname.get(i)%>','<%=price.get(i)%>','<%=i%>','<%=user%>','<%=sname%>')">
    	<input type="text" value="显示加入数" readonly style="width:70px;" id="change<%=i%>" ><br/><br/>
    	<b><font color="#fc7534">----------------------------</font></b><br/>
    <%}%>
    <font size="9" color="red"><b><input type="button" value="查看我的购物车" style="width:140px;height:50px;font-size:16px;" onclick="docheck('<%=user%>')"/></b></font>
<br/><br/><br/><br/> 
</div>
</div>     
  </body>
</html>
