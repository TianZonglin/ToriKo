<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 	Integer user1=(Integer)request.getSession().getAttribute("sid"); 
 	 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>新增商品信息</title>
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
			function check(){
				var f = $('#foodName').val().trim();
				if(f.length==0){alert('请输入商品名称!');return false;}
				var f = $('#foodPrice').val().trim();
				if(f.length==0){alert('请输入商品价格!');return false;}
				if(isNaN(f)){alert('价格输入错误!');return false;}
				var f = $('#filePath').val().trim();
				if(f=="1"){alert('请上传图片!');return false;}
				return true;
			}
		    $(document).ready(function(){
		 			 
		 
		    
		           $('#uploadify').uploadify({ 
				    'auto':true,   // 选择文件后自动上传
			        'swf':'/ToriKo/js/uploadify.swf',  // 上传flash文件路径
			        'uploader':'/ToriKo/uploadServlet?username=<%=user1%>',//后台处理的请求 
			        'queueID':'fileQueue',//与下面的id对应  文件队列
			        'queueSizeLimit':1,//一次最多上传的文件数
			        'fileObjName':'aaa',  // 后台接受参数名称,后台获取这个参数值的方式：fileItem.getFilename()
			        'preventCaching':true,     // 设置随机参数，防止缓存
			        'progressData':'percentage', // 显示上传进度百分比
			        'removeCompleted':false,     // 上传后是否自动删除记录
			        'fileTypeDesc':'jpg,jpeg,png,gif',   // 支持的文件格式，写filetypeExts该参数必须写
			        'fileTypeExts':'*.jpg;*.jpeg;*.png;*.gif', //在打开文件对话框时，仅显示这些后缀名的文件，其他文件看不到，启用本项时需同时声明fileDesc 
			        'multi': false,     // 是否支持多文件上传
			        'uploadLimit':50,  // 上传限制
			        'onCancel':function(){
			            // 取消上传事件
			           		 alert('删除上传');
				        },
				        //每一个文件上传成功后触发
				        'onUploadSuccess' : function(file,data,response) {
				            //data为后台程序中通过response回写到前台的数据
				            //data = decodeURI(data);        data = decodeURI(data); 
	    			        //var a = data.replace(/%2F/g,"/");
	    			           
	    			    	 //ar b  = a.replace(/%2B/g," ");
	    			         //var c  = b.replace(/%3A/g,":");
				        	alert('图片上传成功!\n'+'上传路径为：\n'+data);
				        	
				        	$('#filePath').val(data);
				        	 
						},
				        'onQueueComplete' : function(queueData) {
				            // 所有文件上传成功后触发      
				        },
				        'buttonText': '上传' 
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
	<div class="main" style="height:auto;margin-left:450px;">
	<form action="buildfood.action" enctype="multipart/form-data" method="post" onsubmit="return check();">
		<table width="500px;" align="left" style="color:white;" style="-ms-word-wrap: break-word; ord-break: break-all;" cellspacing="0" cellpadding="4"  >
			<tr style="float:left;width:300px;"><td style="width:100px;">新增商品名称</td><td><input type="text" name="foodName"  id="foodName" /></td></tr>
			<tr style="float:left;width:300px;"><td style="width:100px;">新增商品价格</td><td><input type="text" name="foodPrice" id="foodPrice"/></td></tr>
			<tr style="float:left;width:300px;"><td style="width:100px;">新增商品图片</td>
				<td align="left" >
					<input type="file" name="uploadify" id="uploadify" /> 
				</td>
			</tr>
			<tr><td><input type="hidden" name="userName" value="<%=user%>"/></td><td><input type="hidden" id="filePath" name="filePath" value="1" /> </td></tr>
			<tr>
			<td>
				<div style="overflow:auto;height:100px;width:350px;color:black;">
					<div id="fileQueue">
				</div>
				</div>
				</td>
				<td></td>
	       </tr>
	       <tr style="float:left;width:300px;"><td style="width:100px;"></td><td>（图片以最后一次上传为准）</td></tr>
			<tr style="float:left;width:300px;"><td style="width:100px;"></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" id="subb" src="/ToriKo/images/sub.jpg"  /></td></tr>
		</table>

	</form>
	
	</div>
	
    	  
        
        
    <%@ include file="../footer.jsp" %> 
</div>  
	</body>
</html>
