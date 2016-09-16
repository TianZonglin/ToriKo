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
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

import org.apache.struts2.ServletActionContext;


@SuppressWarnings("serial")
public class SaleAllView extends ActionSupport{

	 public String execute() throws Exception{
		 
			Map<String,Object> attribute = ActionContext.getContext().getSession();
			ArrayList<String> foodsid = new ArrayList<String>();
			ArrayList<String> foodname = new ArrayList<String>();
			ArrayList<String> storename = new ArrayList<String>();
			ArrayList<Integer> number = new ArrayList<Integer>();
 
			ArrayList<String> foodimage = new ArrayList<String>();
			ArrayList<Integer> oldvalue = new ArrayList<Integer>();
			ArrayList<Integer> newvalue = new ArrayList<Integer>();
			
			//post.add((String)attribute.get("user"));	
		
			String sql = "select * from food_table;";
			 

			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			
			 
			try{
				
				conn = DbUtils.getConnection();
				pstm = conn.prepareStatement(sql);
				 
				rs = pstm.executeQuery();
				while(rs.next()){
					foodsid.add(rs.getString("ftListId"));
					foodname.add(rs.getString("FoodName"));
					storename.add(rs.getString("StoreName"));
					number.add(rs.getInt("SalesVolume"));

					foodimage.add(rs.getString("FoodImage"));
					oldvalue.add(rs.getInt("pastPrice"));
					newvalue.add(rs.getInt("Price"));
				}
			
			}catch(Exception e){
				e.printStackTrace();	
			}finally{
				DbUtils.close(rs, pstm, conn);
			}
			attribute.put("foodsid", foodsid);
			attribute.put("foodname", foodname);
			attribute.put("storename", storename);
			attribute.put("number", number);
 
			attribute.put("foodimage", foodimage);
			attribute.put("oldvalue", oldvalue);
			attribute.put("newvalue", newvalue);
			return SUCCESS;
		 }
	 
	 

}
