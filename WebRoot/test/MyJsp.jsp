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
				alert('�����˺ų��ȴ���!');
				return false;
			}
			if(psword.length <6 || psword.length >30 ){
				alert('�������볤�ȴ���!');
				return false;
			}
			if(zhangh.length == 0 || psword.length == 0 || email.length == 0  ){
				alert('���󣺱������ݲ�����!');
				return false;
			}
			var valy = $('#sb').is(':checked');
			var x = 0;
			if(valy)x = real_check();
			else x = simple_check();
			if(!x){
				alert("���������ʽ����!");
				return false;
			}
			//var reNum =/^\d*$/;
            //reNum.test(num);
			if(number.length == 0 || number[0] != '1' || isNaN(number) ){
				alert('���󣺵绰������������!');
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
       		
      		sec.options[0] = new Option("�人","wuhan");  
       		sec.options[1] = new Option("����","huangpi");  
       	
   		}
		if(val == 'sichuan'){  
       		sec.options[0] = new Option("�ɶ�","chengdu");  
       		sec.options[1] = new Option("����","mianchu");
       	
       	}
       	if(val == 'fujian'){  
       		 
       		sec.options[0] = new Option("����","xiamen");  
       		sec.options[1] = new Option("����","fuzhou");
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
					<tr><td class="tablehead"><span>�˺ţ�</span></td><td><input type="text" id="zhangh"/></input><font color="red">&nbsp;*</font></td></tr>
					<tr><td class="tablehead"><span>���룺</span></td><td><input type="text" id="psword"/></input><font color="red">&nbsp;*</font></td></tr>
					<tr><td class="tablehead"><span>���䣺</span></td><td><input type="text" id="email"/></input><font color="red">&nbsp;*</font></td></tr>
					<tr><td class="tablehead"><span>�绰��</span></td><td><input type="text" id="number"/></input></td></tr>
					<tr><td class="tablehead"><span>�Ա�</span></td><td>��<input type="radio" name="female" checked/></input>Ů<input type="radio" name="female"/></input></td></tr>
					<tr><td class="tablehead"><span>���ã�</span></td><td>��<input type="checkbox" checked/></input>��<input type="checkbox" checked/></input>��<input type="checkbox"/></input>��<input type="checkbox"/></input></td></tr>
				    
				    <tr><td class="tablehead"><span>��ַ��</span></td>
				    		<td>
				    				<select id="one" onchange="view(this)">
				    				
										<option value="kong">ѡ��ʡ��</option>
										<option value="hubei">����</option>
										<option value="sichuan">�Ĵ�</option>
										<option value="fujian">����</option>
				    			
				    				</select>
				   	 				<select id="two">
				   	 				
				   	 				</select>
				   	 		</td>
				   	</tr>
				    
				    <tr><td><input type="submit" onclick="return check();"/></td><td>[<font size="2">������������ʽ</font><input type="checkbox" id="sb" />]</td></tr>
				</table>
			</div>
	</div>
 </body>
</html>
