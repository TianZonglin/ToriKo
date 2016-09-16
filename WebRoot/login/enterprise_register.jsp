<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<link href="../style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="../js/jquery.mousewheel-3.0.4.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript"><!-- 
		function check1(){
			var regBox = {
		        regEmail : /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/,//邮箱
		      
		        regMobile : /^0?1[3|4|5|8][0-9]\d{8}$/,//手机
		        regTel : /^0[\d]{2,3}-[\d]{7,8}$/
   			 }
			var username = $('#username').val().trim(); 
			var passwordone = $('#passwordone').val().trim();
			var passwordagain = $('#passwordagain').val().trim();
			var phonenumber = $('#phonenumber').val().trim();
			 
		 
	 		if( username  == "" ){
	 			alert('请输入用户名!');return false;
	 		}
	 		if( username.length > 50 ){
	 			alert('用户名长度超限!');return false;
	 		}
	 		if( checkagain() ){
	 			alert('两次密码不一致!');return false;
	 		}
	
	  		if( !regBox.regEmail.test(phonenumber)){
	 			alert('企业邮箱输入有误!');return false;
	 		}
			/*
		    alert(!regBox.regMobile.test(phonenumber));
		    if ( regBox.regMobile.test(phonenumber) ) { 
		    	if( regBox.regTel.test(phonenumber)) {
		    		return true;
		    	}
		        alert("联系方式格式错误!");return false;
		    } */
	 		return true;
		}

 
   
		function checkagain(){
			var passwordone = $('#passwordone').val().trim();
			var passwordagain = $('#passwordagain').val().trim();
	
			if(passwordone != passwordagain){
				return true;
			}
			return false;
		}
	
	
	$(document).ready(function() {
		
	 
		$('#username1').bind('onpropertychange input',function(){
		 	//alert('xx'); 
			var username = $('#username1').val().trim(); 
		    username = encodeURI(username);username = encodeURI(username);  
			 
		    $.ajax({
				type : "post",
				async:false,
				url : "/ToriKo/registerCheckCO.action?username="+username+"&usertype=company",
				success : function(result) {
					if(result=="failure"){
					alert('xxxxx');
						$('#ajaxdiv').html("");
					}else{
						$('#ajaxdiv').html("用户名已存在");
						flag = true;
					}
				},
				failure:function(){
				}
	     	});
	     });
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


	<div class="main" style="height:291px;margin-left:500px;">
		<div style="text-aglin:center;">
		    <%if(user==null||user.equals("consumer")){ %>
			<form action="registerCO.action?filename=<%=storeid%>" method="post" onsubmit="return check1();">
			 	<input type="hidden" name="url" value="<%=url %>"/>
				<table style="width:400px;color:white">
					<tr>
						<td style="width:100px;"><span>店铺名称</span></td>
						<td style="width:300px;"><input type="text" id="username1" name="username1" style="height:22px;width:203px;"/><font color="red"size="3px">&nbsp;*</font><font id="ajaxdiv" color="red"></font></td>
					</tr>
					<tr>
						<td><span>登陆密码</span></td>
						<td><input type="password" id="passwordone" name="pone" style="height:22px;width:203px;"/><font color="red"size="3px">&nbsp;*</font></td>
					</tr>
					<tr>
						<td><span>确认密码</span></td>
						<td><input type="password" id="passwordagain" name="ptwo" style="height:22px;width:203px;"/><font color="red"size="3px">&nbsp;*</font></td>
					</tr>
					<tr>
						<td><span>企业邮箱</span></td>
						<td><input type="text" id="phonenumber" name="phonenumber" style="height:22px;width:203px;"/><font color="red"size="3px">&nbsp;*</font></td>
					</tr>
					<tr>
						<td><span>店铺地点</span></td>
						<td><input type="text" id="liveplace"  name="liveplace1" style="height:22px;width:203px;"/></td> 
					</tr>	  			
			     </table>
	<br/><br/>
			     <div style="margin-left:100px;"><input type="image" src="/ToriKo/images/sub.jpg"/></div>
			  </form>
			  <%}else{ %>  
			  <br/><br/><br/> 
			  	<div style="height:291px;color:white;margin-left:100px;">
			 	 	<span>企业用户注册成功 !</span><br/>
			 	 	<span>商家表初始化成功!</span>
			 </div>
	 
			  <%} %>
	     </div>
  	</div>


<%@ include file="../footer.jsp" %>
 </div>
</body>
</html>
