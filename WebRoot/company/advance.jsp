<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,Object> attribute = ActionContext.getContext().getSession();
ArrayList<String> fname = (ArrayList<String>)attribute.get("fname");
ArrayList<Integer> price = (ArrayList<Integer>)attribute.get("price");
ArrayList<String> imgsrc = (ArrayList<String>)attribute.get("imgsrc");	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>附件上传</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
<link href="/ToriKo/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/ToriKo/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="/ToriKo/js/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="/ToriKo/js/jquery.mousewheel-3.0.4.js"></script>
<link rel="stylesheet" type="text/css" href="/ToriKo/css/jquery.fancybox-1.3.4.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="/ToriKo/css/uploadify.css">
		<script type="text/javascript" src="/ToriKo/js/jquery.min.js"></script>
		<script type="text/javascript" src="/ToriKo/js/jquery.uploadify.js"></script>
		<script type="text/javascript">
	
		    function dodel(a,b,c){
	    	    var aa = encodeURI(a);aa = encodeURI(aa);  
	    	    var bb = encodeURI(b);bb = encodeURI(bb); 
	    	    var cc = encodeURI(c);cc = encodeURI(cc); 
	    	    alert(aa+bb+cc);
	    	 
				    $.ajax({
						type : "post",
						async:false,
						url : "/ToriKo/ajax_delete.action?foodName="+aa+"&storeName="+bb+"&imgSrc="+cc,
						success : function(result) {
							if(result=="failure"){
								//$('#ajaxdiv').html("");
								alert('商品已被删除，请刷新!');
							}else{
								alert('Ok');
								window.location.href="/ToriKo/co_delete.action?foodName="+aa+"&storeName="+bb+"&imgSrc="+cc;
							}
						},
						failure:function(){
						}
			     	});
		     	 //alert(aa+bb+cc);
	    	    
		    }
		   	    $(document).ready(function(){
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
		 <div class="content">
         <div style="overflow:auto;height:400px;">
         	 
		<table width="100%" align="center" class="tab1" style="-ms-word-wrap: break-word; ord-break: break-all;" cellspacing="0" cellpadding="0">
			  <tbody><tr bgcolor="#ffdd99">	
		 			<td align="center" style="color:black;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;"><span>商品展示</span></td>
		 			<td align="center" style="color:black;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;"><span>商品名称</span></td>
		 			<td align="center" style="color:black;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;"><span>商品价格</span></td>
		 			<td align="center" style="color:black;overflow: hidden; white-space: nowrap; -ms-text-overflow: ellipsis;"><span>删除此商品</span></td>
		 		</tr>
		 	<%for(int i=0;i<fname.size();i++){ %>
		 		<tr bgcolor="#fff199">
		 			<td  align="center" style="color:black;"><img style="width:100px;height:50px;" src="<%=imgsrc.get(i) %>"/></td>
		 			<td  align="center" style="color:black;"><span><%=fname.get(i) %></span></td>
		 			<td  align="center" style="color:black;"><span>￥<%=price.get(i) %></span></td>
		 			<td  align="center" style="color:black;"><input id="del" type="image" src="/ToriKo/images/del.png" onclick="dodel('<%=fname.get(i)%>','<%=user%>','<%=imgsrc.get(i)%>')" /></td>
		 		</tr>
		 	<%} %>
			</tbody></table>
		    <a href="/ToriKo/company/newfood.jsp">继续添加商品</a>
		</div>
</div>
	</div>
	
   
        
        
    <%@ include file="../footer.jsp" %>    
    </div>
	</body>
</html>
