<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MaizeGo DataMine Platform</title>
<link href="../style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="../js/jquery.mousewheel-3.0.4.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" media="screen" />
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
 
<%@ include file="../header.jsp" %>


	<div class="main" style="height:291px;">
		<div style="text-aglin:center;">
		  	<form action="" method="post">
		  	<table>
		  		<tr>
		  			<td>修改商品名称为：</td>
		  			<td><input type="text"/></td>
		  		</tr>
		  		<tr>			
		  			<td>修改商品价格为：</td>
		  			<td><input type="text"/></td>
		  		</tr>
		  		<tr>			
		  			<td>修改商品图片为：</td>
		  			<td><input type="file"/></td>
		  		</tr>
		  		<tr>			
		  			<td> </td>
		  			<td><input type="submit" value="确认修改商品信息"/></td>
		  		</tr>
		  	</table>
		  	</form>
	     </div>
  	</div>


<%@ include file="../footer.jsp" %>
 
</body>
</html>
