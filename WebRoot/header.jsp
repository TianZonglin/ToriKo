<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page import="java.net.URLEncoder"%>
 <% 
 	String user=(String)request.getSession().getAttribute("user"); 
 	String type=(String)request.getSession().getAttribute("userType"); 
 	Integer storeid=(Integer)request.getSession().getAttribute("sid"); 
 	String url;
 	url=request.getRequestURI();
	System.out.println("Jsp->"+url+"	type->"+type+"	user->"+user+" storeid->"+storeid);
 
 
 %>
 <script>
  function checkLogin(){
  	var uname = $("#user").val();
  	uname = encodeURI(uname);uname = encodeURI(uname);  
  	var pwd = $("#password").val();
  	var female = $("#female").is(':checked');
  	//alert(uname);
  	//alert(pwd);
  	//检查输入内容格式
  	if(uname==""||pwd=="")
  	{
  		alert("用户名和密码不能为空");
  		return false;
  	}
    var flag = false;
    $.ajax({
		type : "post",
		async:false,
		url : "/ToriKo/checklogin.action?uname="+uname+"&pwd="+pwd+"&female="+female,
		success : function(result) {
			if(result=="failure"){
				alert("用户名或密码错误");
			}else{
				flag = true;
			}
		},
		failure:function(){
		}
     });
  return flag;
  }

  </script>
 
<div class="headerwrap">
   <div class="header"><a href="#">ToriKo</a>  <a href="#">Online</a>  <a href="#">System</a></div>
</div>
<div class="top">
   <div class="logo"><a href="#"><img src="/ToriKo/images/logo.jpg" /></a></div>
   <div class="topbox">
      <div class="log">
      <%if(user==null) {%>
      <a id="various1" href="#inline1">LOGIN</a> |<br /> <p>游客，请登录|</p> </div><%}else{ %>welcome,<a href="#">${user}</a> &nbsp;<a  href="loginout.action?url=<%=url%>">logout</a> |<br/><a href="#"><%=type%></a> |</div><%}  %>
	  <div class="search">
	  <!--<form method="post" action="">
	       <table cellpadding="0" cellspacing="0" border="0" width="100%">
		       <tr><td><input type="text" value="SEARCH" name="keyword" class="input" onblur="this.style.color='#666';if (this.value == '') this.value = 'SEARCH';" onfocus="this.style.color='#666';this.value = ''" /></td><td><input type="image" src="/maizego/images/go.jpg" /></td></tr>
		   </table> 
	  </form>
	  --></div>
   </div>
</div>

	

<%if(type==null) {%>    
			 
	<div class="nav">
	   <ul>                                            
	       <li style="padding:0 65px;"><a href="/ToriKo/index.jsp"><b>主&nbsp;&nbsp;&nbsp;页</b></a></li> 
				<li><a href="#"><b>功能模块</b></a>
		         <ul class="mlist" style="width:178px;">
		   	     <a href="#">请登录!</a>
		   	     </ul>
		   	   </li>
		   	 <li><a href="/ToriKo/storeInfo.action"><b>餐馆信息</b></a></li>
			 <li><a href="#"><b>业务管理</b></a>
		   	   <ul class="mlist" style="width:178px;">
		   	     <a href="#">请登录!</a>
		   	   </ul>
		       </li>	
		     <li style="border:none;"><a href="/ToriKo/activity/contact.jsp"><b>联系我们</b></a></li>
	   </ul>
	</div> 
<%}else if(type.equals("consumer")){ %>
	<div class="nav">
	   <ul>                                            
	       <li style="padding:0 65px;"><a href="/ToriKo/index.jsp"><b>主&nbsp;&nbsp;&nbsp;页</b></a></li> 	
		   <li><a href="#"><b>外卖下单</b></a>
	         <ul class="mlist" style="width:178px;">
	   	     <a href="/ToriKo/saleAllView.action">查看详情</a><!--
	   	     <a href="/ToriKo/delicious.action">好评菜单</a>
	   	     <a href="/ToriKo/today.action">今日特惠</a>
			 <a href="/ToriKo/newTry.action">新品尝试</a>
	   	     --></ul>
	   	    </li>
			<li><a href="/ToriKo/storeInfo.action"><b>餐馆信息</b></a></li>
			<li><a href="#"><b>购物明细</b></a>
		   	   <ul class="mlist" style="width:178px;">
		   	   	 <a href="/ToriKo/checklist2.action?consumerName=<%=URLEncoder.encode(URLEncoder.encode(user,"utf-8"),"utf-8")%>">删除订单信息</a>
				 <a href="/ToriKo/checklist1.action?consumerName=<%=URLEncoder.encode(URLEncoder.encode(user,"utf-8"),"utf-8")%>">查看已买商品</a>
		   	   </ul>
		       </li>
		    <li style="border:none;"><a href="/ToriKo/activity/contact.jsp"><b>联系我们</b></a></li>
	   </ul>
	</div>
<%}else if(type.equals("company")){ %>
	<div class="nav">
	   <ul>                                            
	       <li style="padding:0 65px;"><a href="/ToriKo/index.jsp"><b>主&nbsp;&nbsp;&nbsp;页</b></a></li> 	
			<li><a href="#"><b>商品信息</b></a>
			    <ul class="mlist" style="width:178px;">
		   	   	 <a href="/ToriKo/company/newfood.jsp">新增商品</a>
				 <a href="#">修改商品</a>
		   	   </ul>
			</li>	
			<li><a href="/ToriKo/storeInfo.action"><b>餐馆信息</b></a></li>
		   	<li><a href="/ToriKo/checkDeals.action?storeName=<%=user%>"><b>查商品订单</b></a></li>	
		   <li style="border:none;"><a href="/ToriKo/activity/contact.jsp"><b>联系我们</b></a></li>
	   </ul>
	</div> 
<%}%> 
 
		   	  
		   
	
		<div style="display: none;">
			<div id="inline1" style="width:280px;height:250px;overflow:auto; text-align:center; padding-top:30px;">
			<form name="form" action="doLogin.action" method="post" onSubmit="return checkLogin()">
			<input type="hidden" name="url" value="<%=url %>"/>
			<table cellpadding="0" cellspacing="10" width="100%" align="center" border="0">
			   <tr><td style="width:247px; height:44px; background:url(/ToriKo/images/username.jpg) center no-repeat;"><input type="text" id="user" name="user"  style="border:none;" /></td></tr>
			   <tr><td style="width:247px; height:44px; background:url(/ToriKo/images/password.jpg) center no-repeat;"><input type="password" id="password" name="password" style="border:none;" /></td></tr>
			   <tr><td colspan="2" align="right" style="padding-right:15px;"><!--<a href="#">Forgot your password?</a>-->
			   	consumer<input type="radio" id="female" name="female" value="true" checked/></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;company<input type="radio" id="female" name="female" value="false"/></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   </td></tr>
			   <tr><td colspan="2" align="center"><input type="image" src="/ToriKo/images/login.jpg" /></td></tr>
			</table>
			</form>
			</div>
		</div>
