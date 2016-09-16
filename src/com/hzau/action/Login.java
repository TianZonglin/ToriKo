package com.hzau.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;  

import org.apache.struts2.ServletActionContext;
import com.hzau.util.*;



import java.sql.PreparedStatement;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
public class Login extends ActionSupport {
	String user;
	String password;
	String url;
	
	String female;
	public String getFemale() {
		return female;
	}
	public void setFemale(String female) {
		this.female = female;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public void setPassword(String password) {
		this.password = password;
	}
    public String execute() throws Exception {
    	user = URLDecoder.decode(user , "utf-8");  
    	String type = "";
	   	if(female.equals("true")){type = "consumer";}
     	else{ type = "company";}
		String sql="select `UserType` from user_table_all where `UserName`=? and `PassWord`=? and `UserType`=?;"; 
		System.out.println(type);
		Map<String, Object> attibutes = ActionContext.getContext().getSession();
		
		HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST); 

		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try{
			
			conn = DbUtils.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, user);
			pstm.setString(2, password);
			pstm.setString(3, type);
			
			rs = pstm.executeQuery();
		
			if(rs.next()){
				attibutes.put("user",user);
				attibutes.put("userType",rs.getString(1));
			}else{
				attibutes.put("user",null);
			}
			 
			if(type.equals("company")){
				 
				String sql2 = "select StoreId from user_table_store where StoreName = ?";
				Connection conn1 = null;
				PreparedStatement pstm1 = null;
				ResultSet rs1 = null;
				try{
					conn1 = DbUtils.getConnection();
					pstm1 = conn1.prepareStatement(sql2);
					pstm1.setString(1, user);
					rs1 = pstm1.executeQuery();
				 
					if(rs1.next()){
						 
						attibutes.put("sid",String.valueOf(rs1.getInt(1)));
						 
					}else{
						attibutes.put("sid",null);
					}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					DbUtils.close(rs, pstm, conn);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DbUtils.close(rs, pstm, conn);
		}
		System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"+url);
		url=url.substring(7);
		System.out.println("XXXXXXXXXXXXXXXX"+url);
		request.getRequestDispatcher(url).forward(request,response);
		

		return SUCCESS;
		
	}
	
    
    
	String uname;
	String pwd;
	
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String checkLogin() throws IOException{
		
		uname = URLDecoder.decode(uname , "utf-8");  
		String type = ""; 
	   	if(female.equals("true")){type = "consumer";}
    	else{ type = "company";}
	   	
	   	System.out.println(type);
	   	
	   	
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		String sql="select * from user_table_all where `UserName` = ? and `PassWord`= ? and `UserType`= ?;";
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		System.out.println(pwd+">>>>>>>>>>>>>>"+uname);
		try{
			
			conn = DbUtils.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, uname);
			pstm.setString(2, pwd);
			pstm.setString(3, type);
			rs = pstm.executeQuery();
			while(rs.next()){
				writer.write("success");
				System.out.println("SSSSSSSSSSSSSSSSSSSSSSSSSSSSsss");
				return null;
			}
			writer.write("failure");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DbUtils.close(rs, pstm, conn);
		}
		System.out.println("xxxxxxxxxxxxxxxxxx");
		return null;
		
		
	}
	
}
