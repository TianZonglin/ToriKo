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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

import org.apache.struts2.ServletActionContext;


@SuppressWarnings("serial")
public class CheckList extends ActionSupport{
	private String consumerName;
	
	public String getConsumerName() {
		return consumerName;
	}

	public void setConsumerName(String consumerName) {
		this.consumerName = consumerName;
	}

	public String execute() throws Exception{
		    Map<String,Object> map = ActionContext.getContext().getSession();
		    
		    consumerName = URLDecoder.decode(consumerName , "utf-8"); 
		    consumerName = URLDecoder.decode(consumerName , "utf-8"); 
		    System.out.println(">>>>>>>>>>>>>>>>>>>>>."+consumerName);
			ArrayList<Integer> listid = new ArrayList<Integer>(); 
			ArrayList<String> storename = new ArrayList<String>(); 
			ArrayList<String> foodname = new ArrayList<String>(); 
			ArrayList<Integer> price = new ArrayList<Integer>(); 
			ArrayList<Integer> number = new ArrayList<Integer>(); 
			ArrayList<Timestamp> paytime = new ArrayList<Timestamp>(); 
			
			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			
			String sql = "select * from auto_consumer_"+consumerName+";";
			 
			try{
				 
				
				conn = DbUtils.getConnection();
				pstm = conn.prepareStatement(sql);
				
				rs = pstm.executeQuery();
				while(rs.next()){
					listid.add(rs.getInt("ListId")); 
					storename.add(rs.getString("StoreName")); 
					foodname.add(rs.getString("FoodName")); 
					price.add(rs.getInt("Price")); 
					number.add(rs.getInt("Number")); 
					paytime.add(rs.getTimestamp("PayTime")); 
				}
			}catch(Exception e){
				e.printStackTrace();	
			}finally{
				DbUtils.close(rs, pstm, conn);
			}
			map.put("conlistid", listid);
			map.put("constorename", storename);
			map.put("confoodname", foodname);
			map.put("conprice", price);
			map.put("connumber", number);
			map.put("conpaytime", paytime);
			 
			return SUCCESS;
		 }
	 
	public String checkstore() throws Exception{
	    Map<String,Object> map = ActionContext.getContext().getSession();


		ArrayList<String> storename = new ArrayList<String>(); 
		ArrayList<String> email = new ArrayList<String>(); 
		ArrayList<String> storepalce = new ArrayList<String>(); 
		ArrayList<Timestamp> logintime = new ArrayList<Timestamp>(); 
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		String sql = "select * from user_table_store;";
		 
		try{
			 
			
			conn = DbUtils.getConnection();
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while(rs.next()){
				storename.add(rs.getString("StoreName")); 
				email.add(rs.getString("EmailAddress")); 
				storepalce.add(rs.getString("StorePlace")); 
				logintime.add(rs.getTimestamp("LoginTime")); 
			}
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			DbUtils.close(rs, pstm, conn);
		}
		map.put("sstorename", storename);
		map.put("semail", email);
		map.put("sstorepalce", storepalce);
		map.put("slogintime", logintime);
		
		
		return SUCCESS;
	}

}
