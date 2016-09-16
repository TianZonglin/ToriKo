package com.hzau.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
 

 

import com.hzau.util.DbUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteFood extends ActionSupport {
	
	private String foodName;
	private String storeName;
	private String imgSrc;
 
	
	public String getFoodName() {
		return foodName;
	}


	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}


	public String getStoreName() {
		return storeName;
	}


	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}


	public String getImgSrc() {
		return imgSrc;
	}


	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}

	public String execute() throws Exception{
		foodName = URLDecoder.decode(foodName , "utf-8"); 
		storeName = URLDecoder.decode(storeName , "utf-8");   
 
		Connection conn = null;
		PreparedStatement pstm  = null;
		try{
			conn = DbUtils.getConnection();
			ArrayList<String> fname = new ArrayList<String>();
			ArrayList<Integer> price = new ArrayList<Integer>();
			ArrayList<String> imgsrc = new ArrayList<String>();
			String sql="select * from auto_company_"+storeName;
			pstm = conn.prepareStatement(sql);
			
			ResultSet rs = null;
			rs = pstm.executeQuery();
			while(rs.next()){
				fname.add(rs.getString("FoodName"));
				price.add(rs.getInt("Price"));
				imgsrc.add(rs.getString("FoodImage"));
			}
			Map<String,Object> attribute = ActionContext.getContext().getSession();
			attribute.put("fname", fname);
			attribute.put("price", price);
			attribute.put("imgsrc", imgsrc);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DbUtils.close(null, pstm, conn);
		}
		return SUCCESS;
	}
	public String ajaxdel() throws Exception{
		storeName = URLDecoder.decode(storeName, "utf-8");
		foodName = URLDecoder.decode(foodName, "utf-8");
		 
		String sql = "delete from auto_company_"+storeName+" where FoodName = ? and FoodImage = ?;";
		//System.out.println(sql+username+" "+usertype);

		Connection conn = null;
		PreparedStatement pstm = null;
		PreparedStatement pstm1 = null;
		
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		try{
			
			conn = DbUtils.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, foodName);
			pstm.setString(2, imgSrc);
			int result = pstm.executeUpdate();
			if(result==0){
				System.out.println("xxxxxxxxxxxx1");
				writer.write("failure");
				return null;
			}
			
			
		    File f= new File(imgSrc);
            if(f.isFile()){
            	f.delete();
            }
	            
        	String sql1="delete from food_table where FoodName=? and StoreName=? ;";
          
        	pstm1 = conn.prepareStatement(sql1);
        	pstm1.setString(1, foodName);
        	pstm1.setString(2, storeName);
            int sqlRs=pstm1.executeUpdate();
			
			System.out.println(">>"+result+" "+sqlRs);
			
			if(sqlRs==0){
				System.out.println("xxxxxxxxxxxx1");
				writer.write("failure");
				return null;
			}
			writer.write("success");
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			DbUtils.close(null, pstm, conn);
			DbUtils.close(null, pstm1,null);
		}
		//System.out.println("CCCC");
		return null;
	}
}
