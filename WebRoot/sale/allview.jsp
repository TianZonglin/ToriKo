<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8"%>
<%
	Map<String, Object> mapping = ActionContext.getContext().getSession();
	ArrayList<String> foodsid = (ArrayList<String>) mapping.get("foodsid");
	ArrayList<String> foodname = (ArrayList<String>) mapping.get("foodname");
	ArrayList<String> storename = (ArrayList<String>) mapping.get("storename");
	ArrayList<String> number = (ArrayList<String>) mapping.get("number");
	ArrayList<String> foodimage = (ArrayList<String>) mapping.get("foodimage");
	ArrayList<Integer> oldvalue = (ArrayList<Integer>) mapping.get("oldvalue");
	ArrayList<Integer> newvalue = (ArrayList<Integer>) mapping.get("newvalue");
	int pValue = 0;
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品</title>
<link href="/ToriKo/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/ToriKo/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="/ToriKo/js/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="/ToriKo/js/jquery.mousewheel-3.0.4.js"></script>
<link rel="stylesheet" type="text/css" href="/ToriKo/css/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript"><!-- 
	$(document).ready(function() {
		$("#various1").fancybox({
			'titlePosition':'inside',
			'transitionIn':'none',
			'transitionOut':'none'
		});
		$("#various2").fancybox({
			'titlePosition':'inside',
			'transitionIn':'none',
			'transitionOut':'none'
		});
	  
	});
	function openwindow(fname,sname){
		var aa = encodeURI(fname);aa = encodeURI(aa);  
	    var bb = encodeURI(sname);bb = encodeURI(bb); 
	     
		window.open('/ToriKo/buynext.action?foodname='+aa+'&storename='+bb,'','width=700,height=380,toolbar=no, status=no, menubar=no, resizable=no, scrollbars=no,location=no');
		return false;
	} 
</script>
</head>

<body>
 <div style="background:#444444;">
<%@ include file="../header.jsp" %>
 
		<div class="main" style="height: auto;">
			<div style="aglin: center;color:white;">
				<input type="hidden" name="url" value="<%=url%>" />
				<table style="border: 0px;" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #ffffff;color:white;">
					<%
						for (int i = 0; i < foodname.size() / 4; i++) {
					%>
					<tr>
						<%
							for (int j = 0; j < 4; j++) {
						%>
						<td>
							<table style="border: 0px; width: 234px; height: 210px;"0" cellpadding="0">
								<tr>
									<td colspan="4" style="border: 1px solid #45484d;">
										<img style="width: 229px; height: 135px;"
											src="<%=foodimage.get(pValue)%>" />
									</td>
								</tr>
								<tr>
									<td style="border: 0px; width: 30px;">
										<!--<form action="#">
											<input id="addimg" type="image" src="/ToriKo/images/plus.jpg" />
										</form>
									--></td>
									<td colspan="3" align="right" style="border: 0px">
										<font size="3px" color=""><%="【"+foodname.get(pValue) + "】 【"+ storename.get(pValue)+"】"%></font>
									</td>
								</tr>
								<tr >
									<td style="border: 0px; width: 10px;"><!--
										<form action="#">
											<input id="buyimg" type="image" src="/ToriKo/images/buy.jpg"
												value="<%%>" />
										</form>
									--></td>
									<td style="border: 0px; width: 30px;">
										
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="3" color="#fc7534"><a href="#" onclick="openwindow('<%=foodname.get(pValue) %>','<%=storename.get(pValue) %>')"><font color="#fc7534"><b>下单</b></font></a></font>
									</td>
									<td style="border: 0px; width: 30px;">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="5" color="#fc7534"><%=newvalue.get(pValue) + ".0"%></font>
									</td>
									<td style="border: 0px;aglin:right" width="30px" >
										&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-decoration: line-through; font-size: 17px;font-family:微软雅黑">￥<%=oldvalue.get(pValue)%></span>
									</td>
								</tr>
							</table>
						</td>
						<%
							pValue++;
									if (pValue == foodname.size())
										break;
								}
						%>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
		<div style="display: none;">
			<div id="inline2" style="width:350px;height:200px;overflow:auto; text-align:center; padding-top:40px;">
			
			</div>
		</div>
		<%@ include file="../footer.jsp" %>
 </div>
</body>
</html>
