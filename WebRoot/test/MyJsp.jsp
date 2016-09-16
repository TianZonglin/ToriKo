<!doctype html>
<%@ page contentType="text/html;charset=gbk" language="java"%>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Author_TZL" content="">


  <title>Document</title>
	<script type="text/javascript"src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
	 

		function simple_check(){
			alert('simple');
		    var email = document.getElementById("email").value;
			var cnt=0;
			for(var i=0;i<email.length;i++){
				if(email[i]=='@'){
					cnt++;
				}		
			}	
			if(cnt==1){return 1;}
			else{return 0;}
		} 
		function real_check(){
			 var temp = document.getElementById("email");
			 var myreg = /^[a-zA-Z0-9]+@+[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			 if(!myreg.test(temp.value)){
				 return 0; //error
			}
			return 1; 
		 }
		function check(){
			var zhangh = $('#zhangh').val();
			var psword = $('#psword').val();
			var email = $('#email').val();
			var number = $('#number').val();	
			if(zhangh.length <6 || zhangh.length >30 ){
				alert('错误：账号长度错误!');
				return false;
			}
			if(psword.length <6 || psword.length >30 ){
				alert('错误：密码长度错误!');
				return false;
			}
			if(zhangh.length == 0 || psword.length == 0 || email.length == 0  ){
				alert('错误：必填内容不完整!');
				return false;
			}
			var valy = $('#sb').is(':checked');
			var x = 0;
			if(valy)x = real_check();
			else x = simple_check();
			if(!x){
				alert("输入邮箱格式错误!");
				return false;
			}
			//var reNum =/^\d*$/;
            //reNum.test(num);
			if(number.length == 0 || number[0] != '1' || isNaN(number) ){
				alert('错误：电话号码输入有误!');
				return false;
			}
			alert("OK!");
			return true;
			
			 
		}

	function view(th){
 
		var val = th.value;
		var sec =  document.getElementById("two");
 
	    if(val == 'kong') {
	    	sec.options[0] = new Option("","");  
	    	sec.options[1] = new Option("","");   
	    	} 
   		if(val == 'hubei'){  
       		
      		sec.options[0] = new Option("武汉","wuhan");  
       		sec.options[1] = new Option("黄陂","huangpi");  
       	
   		}
		if(val == 'sichuan'){  
       		sec.options[0] = new Option("成都","chengdu");  
       		sec.options[1] = new Option("绵竹","mianchu");
       	
       	}
       	if(val == 'fujian'){  
       		 
       		sec.options[0] = new Option("厦门","xiamen");  
       		sec.options[1] = new Option("福州","fuzhou");
       	}
    }  
	</script>
 </head>
 <style type="text/css">
	.main{height:100%;width:100%;}
	.table{float:left;margin-left:400px;margin-top:20%;background:#fff999;}
	.tablehead{width:50px;}
 </style>
 <body>
	<div id="main" class="main">
			<div id="table" class="table">
				<table width="250px;">
					<tr><td class="tablehead"><span>账号：</span></td><td><input type="text" id="zhangh"/></input><font color="red">&nbsp;*</font></td></tr>
					<tr><td class="tablehead"><span>密码：</span></td><td><input type="text" id="psword"/></input><font color="red">&nbsp;*</font></td></tr>
					<tr><td class="tablehead"><span>邮箱：</span></td><td><input type="text" id="email"/></input><font color="red">&nbsp;*</font></td></tr>
					<tr><td class="tablehead"><span>电话：</span></td><td><input type="text" id="number"/></input></td></tr>
					<tr><td class="tablehead"><span>性别：</span></td><td>男<input type="radio" name="female" checked/></input>女<input type="radio" name="female"/></input></td></tr>
					<tr><td class="tablehead"><span>爱好：</span></td><td>吃<input type="checkbox" checked/></input>喝<input type="checkbox" checked/></input>嫖<input type="checkbox"/></input>赌<input type="checkbox"/></input></td></tr>
				    
				    <tr><td class="tablehead"><span>地址：</span></td>
				    		<td>
				    				<select id="one" onchange="view(this)">
				    				
										<option value="kong">选择省份</option>
										<option value="hubei">湖北</option>
										<option value="sichuan">四川</option>
										<option value="fujian">福建</option>
				    			
				    				</select>
				   	 				<select id="two">
				   	 				
				   	 				</select>
				   	 		</td>
				   	</tr>
				    
				    <tr><td><input type="submit" onclick="return check();"/></td><td>[<font size="2">完整检查邮箱格式</font><input type="checkbox" id="sb" />]</td></tr>
				</table>
			</div>
	</div>
 </body>
</html>
