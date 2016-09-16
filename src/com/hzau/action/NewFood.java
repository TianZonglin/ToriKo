package com.hzau.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.struts2.ServletActionContext;

import com.hzau.util.DbUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NewFood extends ActionSupport {
	
	private String foodName;
	private String userName;
	private String foodPrice;
	public String getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(String foodPrice) {
		this.foodPrice = foodPrice;
	}
	private String filePath;
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
/*	public int getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}*/
	
	public String execute() throws Exception{
		foodName = URLDecoder.decode(foodName , "utf-8");  
		userName = URLDecoder.decode(userName , "utf-8");   
 
		System.out.println(foodName+"-----"+userName);
		
		Connection conn = null;
		PreparedStatement pstm  = null;
		PreparedStatement pstm1 = null;
		PreparedStatement pstm2 = null;
		try{
    		String sql ="insert into food_table (FoodName, StoreName, FoodImage) values (?,?,?);";
    		String sql1="insert into auto_company_"+userName+" (FoodName, Price, FoodImage) values (?,?,?);";
			conn = DbUtils.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, foodName);
			pstm.setString(2, userName);
			pstm.setString(3, filePath);
			pstm.executeUpdate();
			
			pstm1 = conn.prepareStatement(sql1);
			pstm1.setString(1, foodName);
			pstm1.setInt(2, Integer.valueOf(foodPrice));
			pstm1.setString(3, filePath);
			pstm1.executeUpdate();
			
			ArrayList<String> fname = new ArrayList<String>();
			ArrayList<Integer> price = new ArrayList<Integer>();
			ArrayList<String> imgsrc = new ArrayList<String>();
			String sql2="select * from auto_company_"+userName;
			pstm2 = conn.prepareStatement(sql2);
			ResultSet rs = null;
			rs = pstm2.executeQuery();
			while(rs.next()){
				fname.add(rs.getString("FoodName"));
				price.add(rs.getInt("Price"));
				imgsrc.add(rs.getString("FoodImage"));
			}
			Map<String,Object> attribute = ActionContext.getContext().getSession();
			attribute.put("fname", fname);
			attribute.put("price", price);
			attribute.put("imgsrc", imgsrc);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			DbUtils.close(null, pstm, conn);
			DbUtils.close(null, pstm1, null);
		}
 
 
		
		return SUCCESS;
	}
}
