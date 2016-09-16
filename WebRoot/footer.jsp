<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div style="height:20px;color:#111111;width:100%;"></div>
<div class="footwrap">
   <div class="foot"> 
	   <div class="f2" >
			<p >美食猎人®（ToriKo™ Online System）</p>
			<p >Version 1.0&nbsp;&nbsp;&nbsp;</p>
			<p >本网站最终解释权归华中农业大学所有&nbsp;&nbsp;</p>
       </div>
	   
	   <div class="f3">
	      <p >&nbsp;团队成员：田宗霖, 王静, 夏航宇, 何赛</p>
	      <p >&nbsp;技术支持：中软国际®（广州）ETC</p>
	       <p >&nbsp;友情赞助：DuangDuang®书城&nbsp;&nbsp;|&nbsp;&nbsp;美饱廉®&nbsp;&nbsp;|&nbsp;&nbsp;无饿不作®&nbsp;&nbsp;|&nbsp;&nbsp;人在旅途®</p>
		
	   </div>
   </div>
</div>


	

<script type="text/javascript"> 
$.fn.extend({
	myMenu: function() {
		$(this).children('ul').children('li').hover(
			function() {
				if(!$(this).children('ul').hasClass('focus')) {
					$(this).addClass('focus');
					$(this).children('ul:first').stop(true, true).animate({ height:'show' }, 'fast');
				}
			},
			function() {
				$(this).removeClass('focus');
				$(this).children('ul:first').stop(true, true).animate({height:'hide', opacity:'hide'}, 'slow');
			}
		);
		$(this).children('ul').children('li').children('ul').hover(
			function() {
				$(this).addClass('focus');
			},
			function() {
				$(this).removeClass('focus');
			}
		);
	}
});
$(document).ready(function() {
	$('.nav').myMenu();
});
</script>









