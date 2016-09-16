package com.hzau.action;



import com.hzau.util.DbUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

import org.apache.struts2.ServletActionContext;


@SuppressWarnings("serial")
public class Register extends ActionSupport{
	  String username;  
	  String usertype;  
	 public String getUsername(){
		 System.out.println(this.username);
		 return this.username;
	 }	
	 public void setUsername(String username){
		
		 this.username = username;
	 }  
	 public String getUsertype(){
		 System.out.println(this.usertype);
		 return this.usertype;
	 }	
	 public void setUsertype(String usertype){
		
		 this.usertype = usertype;
	 }


	 




	  String pwdone;  
	  String pwdagain;  
	  String phonenumber; 
	  String sex; 
	  String liveplace;
	  String url;
	 
	 public String getPwdone() {
		return pwdone;
	}
	public void setPwdone(String pwdone) {
		this.pwdone = pwdone;
	}
	public String getPwdagain() {
		return pwdagain;
	}
	public void setPwdagain(String pwdagain) {
		this.pwdagain = pwdagain;
	}
	public String getPhonenumber() {
			return phonenumber;
	 }
	 public void setPhonenumber(String phonenumber) {
			this.phonenumber = phonenumber;
	 }
	 public String getSex() {
			return sex;
	 }
	 public void setSex(String sex) {
			this.sex = sex;
	 }
	 public String getLiveplace() {
			return liveplace;
	 }
	 public void setLiveplace(String liveplace) {
			this.liveplace = liveplace;
	 }
	 public String getUrl() {
			return url;
	 }
	 public void setUrl(String url) {
			this.url = url;
	 }
	 public String execute() throws IOException{ 
		
		 username = URLDecoder.decode(username , "utf-8"); 
		 liveplace = URLDecoder.decode(liveplace , "utf-8"); 
		 
		 System.out.println(">>>>>>>>>>"+sex);
		 if(sex.equals("true")){
			 sex="ÄÐ";
		 }else{
			 sex="Å®";
		 }
		 
		 HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
		 HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST); 

		 
		 String sql1 = "insert into user_table_all (UserName,PassWord,UserType) values (?,?,?)";
		 String sql2 = "insert into user_table_consumer (ConsumerName,ConsumerTel,Sex,LivePlace) values (?,?,?,?);";
		 String sql3 = "CREATE TABLE `auto_consumer_"+username+"` (" +
						  "`ListId` int(11) NOT NULL DEFAULT '0',"+
						  "`StoreName` varchar(255) NOT NULL DEFAULT '',"+
						  "`FoodName` varchar(255) NOT NULL,"+
						  "`Price` int(11) NOT NULL,"+
						  "`Number` int(11) NOT NULL,"+
						  "`PayTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,"+
						  "PRIMARY KEY (`ListId`,`StoreName`))";
 

		 Connection conn = null;
		 PreparedStatement pstm1 = null;
		 PreparedStatement pstm2 = null;
		 PreparedStatement pstm3 = null;
		 
		 try{
			
			conn = DbUtils.getConnection();
			pstm1 = conn.prepareStatement(sql1);
		 	pstm1.setString(1, username);
			pstm1.setString(2, pwdone);
			pstm1.setString(3, "consumer"); 
			pstm1.executeUpdate();
			 
			pstm2 = conn.prepareStatement(sql2);
			pstm2.setString(1, username);
			pstm2.setString(2, phonenumber);
			pstm2.setString(3, sex);
			pstm2.setString(4, liveplace);
			pstm2.executeUpdate();	
			
			pstm3 = conn.prepareStatement(sql3);
			//pstm3.setString(1, "consumer_"+username);
			pstm3.execute();
			
			//if(rs.next()){
			Map<String, Object> attibutes = ActionContext.getContext().getSession();
			attibutes.put("user",username);
			attibutes.put("userType","consumer");
			
			//}//else{
			//	attibutes.put("user",null);
			//}
		 }catch(Exception e){
			e.printStackTrace();	
		 }finally{
				//DbUtils.close(null, pstm1, conn);
				DbUtils.close(null, pstm2, null);
		 }
		
		 url=url.substring(7);
		 System.out.println("xxxxx"+url);
		 try {
			request.getRequestDispatcher(url).forward(request,response);
		 } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		 }	 
		 return null;
	 }
	 
	 
	 
	 public String personal() throws Exception{
		 
		 	username = URLDecoder.decode(username , "utf-8"); 
		 
			String sql = "select `UserName` from user_table_all where `UserName` = ? and `UserType` = ? ";
			System.out.println(sql+username+" "+usertype);

			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			
			PrintWriter writer = ServletActionContext.getResponse().getWriter();
			try{
				
				conn = DbUtils.getConnection();
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, username);
				pstm.setString(2, usertype);
				rs = pstm.executeQuery();
				while(rs.next()){
					//post.add(rs.getString(1));
					writer.write("success");
					return null;
				}
				writer.write("failure");
			}catch(Exception e){
				e.printStackTrace();	
			}finally{
				DbUtils.close(rs, pstm, conn);
			}
			//System.out.println("CCCC");
			return null;
		 }
	 
	 

}
