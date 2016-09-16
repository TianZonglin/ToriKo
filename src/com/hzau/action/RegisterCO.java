package com.hzau.action;



import com.hzau.util.DbUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.io.File;
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
public class RegisterCO extends ActionSupport{
	  String username1;  
	  String usertype;  
	  String filename;
	  
	 public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getUsername1(){
		 System.out.println(this.username1);
		 return this.username1;
	 }	
	 public void setUsername1(String username1){
		
		 this.username1 = username1;
	 }  
	 public String getUsertype(){
		 System.out.println(this.usertype);
		 return this.usertype;
	 }	
	 public void setUsertype(String usertype){
		
		 this.usertype = usertype;
	 }


	 






	  String pone;  
	  String ptwo;  
	  String phonenumber; 

	  String liveplace1;
	  String url;
	 
	 public String getPone() {
		return pone;
	}
	public void setPone(String pone) {
		this.pone = pone;
	}
	public String getPtwo() {
		return ptwo;
	}
	public void setPtwo(String ptwo) {
		this.ptwo = ptwo;
	}
	public String getPhonenumber() {
			return phonenumber;
	 }
	 public void setPhonenumber(String phonenumber) {
			this.phonenumber = phonenumber;
	 }
	 public String getLiveplace1() {
			return liveplace1;
	 }
	 public void setLiveplace1(String liveplace1) {
			this.liveplace1 = liveplace1;
	 }
	 public String getUrl() {
			return url;
	 }
	 public void setUrl(String url) {
			this.url = url;
	 }
	 public String execute() throws IOException{ 
		 username1 = URLDecoder.decode(username1 , "utf-8");   
		 liveplace1 = URLDecoder.decode(liveplace1 , "utf-8");  
		 
		 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>.."+username1);
		 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>.."+pone); 
		 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>.."+ptwo);
		 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>.."+liveplace1);

		 
		 HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
		 HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST); 
		 
		 String NewPath = request.getSession().getServletContext().getRealPath("/")+"uploadimages/";
		 File file = new File(NewPath+"/"+filename);
		 file.mkdirs();
		 System.out.println( NewPath );
		  
		 
		 String sql1 = "insert into user_table_all (UserName,PassWord,UserType) values (?,?,?)";
		 String sql2 = "insert into user_table_store (StoreName,EmailAddress,StorePlace) values (?,?,?);";
		 String sql3 = "CREATE TABLE `auto_company_"+username1+"` (" +
		 		"`ListId` int(11) NOT NULL AUTO_INCREMENT," +
		 		"`FoodName` varchar(255) NOT NULL," +
		 		"`Price` int(11) NOT NULL DEFAULT '0'," +
		 		"`FoodImage` varchar(255) DEFAULT NULL," +
		 		"`SalesVolume` int(11) DEFAULT '0'," +
		 		"`Classification` enum('肉食，素食') DEFAULT NULL,"+
		 		"PRIMARY KEY (`ListId`))";
		 String sql4 = "CREATE TABLE `order_company_"+username1+"` ("+
				  "`OrderId` int(11) NOT NULL AUTO_INCREMENT,"+
				  "`FoodName` varchar(255) DEFAULT NULL,"+
				  "`Number` int(11) DEFAULT '0',"+
				  "`Price` int(11) DEFAULT '0',"+
				  "`ConsumerName` varchar(255) DEFAULT NULL,"+
				  "`ConsumerTel` char(11) DEFAULT NULL,"+
				  "`OrderTime` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,"+
				  "PRIMARY KEY (`OrderId`))";
	
		 Connection conn = null;
		 PreparedStatement pstm1 = null;
		 PreparedStatement pstm2 = null;
		 PreparedStatement pstm3 = null;
		 PreparedStatement pstm4 = null;
		 try{
 
			conn = DbUtils.getConnection();
			pstm1 = conn.prepareStatement(sql1);
		 	pstm1.setString(1, username1);
			pstm1.setString(2, pone);
			pstm1.setString(3, "company"); 
			pstm1.executeUpdate();
			 
			pstm2 = conn.prepareStatement(sql2);
			pstm2.setString(1, username1);
			pstm2.setString(2, phonenumber);
			pstm2.setString(3, liveplace1);
			pstm2.executeUpdate();	
			
			
			pstm3 = conn.prepareStatement(sql3);
			pstm3.execute();
			
			pstm4 = conn.prepareStatement(sql4);
			pstm4.execute();
			
			//if(rs.next()){
			Map<String, Object> attibutes = ActionContext.getContext().getSession();
			attibutes.put("user",username1);
			attibutes.put("userType","company");
			
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
		 } catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		 }	 
		 return null;
	 }
	 
	 
	 
	 public String company() throws Exception{
		    username1 = URLDecoder.decode(username1 , "utf-8");   
			//Map<String,Object> attribute = ActionContext.getContext().getSession();
			//ArrayList<String> post = new ArrayList<String>();
			//post.add((String)attribute.get("user"));	
			//username = URLDecoder.decode(username , "utf-8");//关键代码
			String sql = "select `UserName` from user_table_all where `UserName` = ? and `UserType` = ? ";
			System.out.println(sql+username1+" "+usertype);

			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			
			PrintWriter writer = ServletActionContext.getResponse().getWriter();
			try{
				
				conn = DbUtils.getConnection();
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, username1);
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
			System.out.println("CCCC");
			return null;
		 }
	 
	 

}
