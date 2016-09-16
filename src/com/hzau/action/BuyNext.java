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
public class BuyNext extends ActionSupport{
	private String foodname;
	private String storename;
	
	
	 public String getFoodname() {
		return foodname;
	}


	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}


	public String getStorename() {
		return storename;
	}


	public void setStorename(String storename) {
		this.storename = storename;
	}


	public String execute() throws Exception{
		Map<String,Object> map = ActionContext.getContext().getSession();
			ArrayList<String> foodsname = new ArrayList<String>(); 
			ArrayList<Integer> price = new ArrayList<Integer>(); 
			ArrayList<Integer> salesvolume = new ArrayList<Integer>(); 
			//ArrayList<String> src = new ArrayList<String>(); 
			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			
			String sql = "select * from auto_company_"+storename+";";
			 
			try{
				System.out.println(storename  +"  " + foodname);
				
				conn = DbUtils.getConnection();
				pstm = conn.prepareStatement(sql);
				//pstm.setString(1, foodname);
				rs = pstm.executeQuery();
				while(rs.next()){
					System.out.println("xxxxxxx");
					foodsname.add(rs.getString("FoodName"));
					price.add(rs.getInt("Price"));
					salesvolume.add(rs.getInt("SalesVolume"));
				}
			}catch(Exception e){
				e.printStackTrace();	
			}finally{
				DbUtils.close(rs, pstm, conn);
			}
			map.put("foodname1", foodsname);
			map.put("price1", price);
			map.put("salesvolume1", salesvolume);
			map.put("storename1", storename);
			return SUCCESS;
		 }
	 
	 

}
