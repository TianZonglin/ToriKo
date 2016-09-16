<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="js/jquery.mousewheel-3.0.4.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.fancybox-1.3.4.css" media="screen" />
<script language="javascript" type="text/javascript" src="js/yao.js"></script>
<script type="text/javascript"> 
	$(document).ready(function() {
 
		$("#various1").fancybox({
			'titlePosition':'inside',
			'transitionIn':'none',
			'transitionOut':'none'
		});
		YAO.YTabs({
				tabs: YAO.getEl('YNIndex').getElementsByTagName('a'),
				contents: YAO.getEl('YNews').getElementsByTagName('dl'),
				auto: true,
				fadeUp: true
		});
		YAO.YTabs({
				tabs: YAO.getEl('YNIndex1').getElementsByTagName('a'),
				contents: YAO.getEl('YNews1').getElementsByTagName('dl'),
				auto: true,
				fadeUp: true
		});
		startmarquee(18,30,3000,0); 
 		startmarquee(18,35,3100,1); 
 		startmarquee(18,40,3050,2); 
 
	});
	function startmarquee(lh,speed,delay,index){ 

		/* 
		函数startmarquee的参数： 
		lh：文字一次向上滚动的距离或高度； 
		speed：滚动速度； 
		delay：滚动停顿的时间间隔； 
		index：可以使封装后的函数应用于页面当中不同的元素； 
		*/ 
	
		var t; 
		var p=false; 
		var o=document.getElementById("marqueebox"+index); 
		//获取文档中的滚动区域对象，赋值给变量o； 
		
		o.innerHTML+=o.innerHTML; 
		//对象中的实际内容被复制了一份，包含了两个ul，当然li标签也由原来的3行，变为6行；复制的目的在于给文字不间断向上滚动提供过渡。 
		o.onmouseover=function(){p=true} 
		o.onmouseout=function(){p=false} 
		o.scrollTop = 0; 
		function start(){ 
			t=setInterval(scrolling,speed); 
			if(!p){ o.scrollTop += 1;} 
		} 
		function scrolling(){ 
			if(o.scrollTop%lh!=0){ 
				o.scrollTop += 1; 
				if(o.scrollTop>=o.scrollHeight/2) o.scrollTop = 0; 
			}else{ 
				clearInterval(t); 
				setTimeout(start,delay); 
			} 
		} 
		setTimeout(start,delay); 
	} 
</script>
<style type="text/css"> 
.box1{width:346px; height:18px;line-height:18px; border:0px solid; overflow:hidden;color:white;margin-top:5px;} 
	.box{width:580px; height:18px;line-height:18px; border:0px solid; overflow:hidden;color:white;margin-top:5px;} 
	.box ul{margin:0; padding:0} 
	.box li{height:18px; line-height:18px; font-size:13px; list-style-type:none;text-align:left;padding-left:5px;}
	 
	a:link{color:#f00;text-decoration:none;   /* 指正常的未被访问过的链接*/}
	a:visited{color:#000;text-decoration:none; /*指已经访问过的链接*/}
	a:hover{color:#blue;text-decoration:none;/*指鼠标在链接*/}a:active{text-decoration:none;/* 指正在点的链接*/ }

</style> 
</head>

<body>
<div style="background:#444444;">
<%@ include file="header.jsp"%>
 



	<div class="main">
    	<div class="banner">
        	<div id="YNews">
	  			<dl><dt><a href="#"><img src="images/banner1.jpg"/></a></dt></dl>
	  			<dl><dt><a href="#"><img src="images/banner2.jpg" /></a></dt></dl>
	  			<dl><dt><a href="#"><img src="images/banner3.jpg" /></a></dt></dl>  
      			<p id="YNIndex"> 
	    			<a href="#"></a>
	    			<a href="#"></a>
					<a href="#"></a>	
	  			</p>
			</div>
	 	
 	 
   		</div>
    	<div class="banner1">
        	<div id="YNews1">
	  			<dl><dt><a href="#"><img src="images/banner1.jpg"/></a></dt></dl>
	  			<dl><dt><a href="#"><img src="images/banner2.jpg" /></a></dt></dl>
	  			<dl><dt><a href="#"><img src="images/banner3.jpg" /></a></dt></dl>  
      			<p id="YNIndex1"> 
	    			<a href="#"></a>
	    			<a href="#"></a>
					<a href="#"></a>	
	  			</p>
			</div>
 
   		</div>
   		<div class="sidebar">
      		<ul>
	        	<li><a href="login/personal_register.jsp"><b>普通用户注册</b></a><a href="login/personal_register.jsp" class="more"></a></li>
		    	<li><a href="login/enterprise_register.jsp"><b>企业用户注册</b></a><a href="login/enterprise_register.jsp"  class="more"></a></li>
		    	<li><a href="activity/activities.jsp"><b>每周活动详情</b></a><a href="activity/activities.jsp" class="more"></a></li>
		   		<li><a href="activity/comment.jsp"><b>用户评价中心</b></a><a href="activity/comment.jsp" class="more"></a></li>
		   		<li><a href="activity/ruler.jsp"><b>查看网站守则</b></a><a href="activity/ruler.jsp" class="more"></a></li>
	  		</ul>
   		</div>
	</div>

	<div class="main">
	   <h3 class="tit"><span style="color:#ddd;">广告位招租</span><!--<span class="more"><a href="#"><img src="images/more.jpg" /></a></span>--></h3>
	   <div class="maincontent">
		   <table style="width:936px;">
				<tr >
					<td style="width:38%;text-align:right;color:#fff;"><div class="box1" id=""> 大哥热风瓦房店高速费</div></td>
					<td style="width:62%;" >
						<div class="box" id="marqueebox0"> 
							<ul> 
								<li ><a href="www.baidu.com">第一行啊睡觉了第三次卡萨米开心死妈狂魔吹口哨那可能性卡萨诺先看下卡桑娜开学啊</a></li> 
								<li ><a href="www.baidu.com">第二行谁吃撒撒潇洒潇洒洒出的思路和废物和裤带哈桑单后IQ无外婆风华绝代啦</a></li> 
								<li ><a href="www.baidu.com">第三行奥斯卡了山东五肚皮拉黑谁多拉风和垃圾堆了定位球阿飞娃费全额付谁粉墙黛瓦</a></li> 
							</ul> 
						</div>
					</td>
				</tr>
				<tr>	
					<td style="width:38%;text-align:right;color:#fff;"><div class="box1" id=""> 风GV阿斯顿无法</div></td>
					<td>
						<div class="box" id="marqueebox1"> 
							<ul> 
								<li >第一行啊睡觉了第三次卡萨米开心死妈狂魔吹口哨那可能性卡萨诺先看下卡桑娜开学啊</li> 
								<li >第二行谁吃撒撒潇洒潇洒洒出的思路和废物和裤带哈桑单后IQ无外婆风华绝代啦</li> 
								<li >第三行奥斯卡了山东五肚皮拉黑谁多拉风和垃圾堆了定位球阿飞娃费全额付谁粉墙黛瓦</li> 
							</ul> 
						</div>
					</td>
				</tr>
			<tr>	
				<td style="width:38%;text-align:right;color:#fff;"><div class="box1" id=""> 三等奖愁死了农村</div></td>
				<td>
					<div class="box" id="marqueebox2"> 			
						<ul> 
							<li >第一行啊睡觉了第三次卡萨米开心死妈狂魔吹口哨那可能性卡萨诺先看下卡桑娜开学啊</li> 
							<li >第二行谁吃撒撒潇洒潇洒洒出的思路和废物和裤带哈桑单后IQ无外婆风华绝代啦</li> 
							<li >第三行奥斯卡了山东五肚皮拉黑谁多拉风和垃圾堆了定位球阿飞娃费全额付谁粉墙黛瓦</li> 
						</ul> 
					</div>
				</td>
			</tr>
		</table>   
	   </div>
	</div>	 


	


<%@ include file="footer.jsp"%>
</div>
</body>
</html>
