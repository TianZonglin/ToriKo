package com.hzau.action;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.Random;


import org.apache.struts2.ServletActionContext;

import com.hzau.util.DbUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrderFood extends ActionSupport{
	private String consumerName = null;
	private String consumerTel = null;
	
	
	
	
	private String storeName = null;
	private String foodName = null;
	private String price = null;
	private String number = null;

	
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	
	public String getConsumerName() {
		return consumerName;
	}
	public void setConsumerName(String consumerName) {
		this.consumerName = consumerName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String execute() throws Exception{
		return SUCCESS;
	}
	
	
	public String ajaxadd() throws Exception{
		//System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx "+consumerName+"　"+consumerTel+"　"+storeName+"　"+foodName+"　"+price+"　"+number);
		consumerName = URLDecoder.decode(consumerName , "utf-8"); 
		storeName = URLDecoder.decode(storeName , "utf-8"); 
		foodName = URLDecoder.decode(foodName , "utf-8"); 
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		
		Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try{
        	conn = DbUtils.getConnection();
            String auto_user_table="auto_consumer_"+ consumerName;
            //String auto_company_table="auto_company_"+ storeName;
            String order_company_table="order_company_"+ storeName;
            
            
        	int orderId = Math.abs((int)(System.currentTimeMillis()));
        	Timestamp  ts = new Timestamp(System.currentTimeMillis());///此处时间与auto_consumer_x 的 PayTime
        		
            String sql2="select ConsumerTel from user_table_consumer where ConsumerName=?;";
            pstm = conn.prepareStatement(sql2);
            pstm.setString(1, consumerName);
            rs=pstm.executeQuery();
            if(rs.next()){
            	consumerTel = rs.getString("ConsumerTel");
            	pstm.close();
            }
            else{
            	//return ERROR;
            	System.out.println("xxxxxxxxxxxxxx1");
            }
            
            String sql3="insert into "+order_company_table+" (OrderId, FoodName, Price, Number, ConsumerName, ConsumerTel, OrderTime) values (?,?,?,?,?,?,?);";
            pstm = conn.prepareStatement(sql3);
            pstm.setInt(1, orderId);
            pstm.setString(2, foodName);
            pstm.setInt(3, Integer.parseInt(price));
            pstm.setInt(4, Integer.parseInt(number));
            pstm.setString(5, consumerName);
            pstm.setString(6, consumerTel);
            pstm.setTimestamp(7, ts);
            
            int sqlRs=pstm.executeUpdate();
            if(sqlRs==0)
            	return ERROR;
            else if(sqlRs==1){
            	rs.close();
            	pstm.close();
            }

        	String sql1="insert into "+auto_user_table+" (ListId, FoodName, StoreName, Price, Number, PayTime) values (?,?,?,?,?,?);";
            conn = DbUtils.getConnection();
            pstm = conn.prepareStatement(sql1);
            pstm.setInt(1, orderId);
            pstm.setString(2, foodName);
            pstm.setString(3, storeName);
            pstm.setInt(4, Integer.parseInt(price));
            pstm.setInt(5, Integer.parseInt(number));
            pstm.setTimestamp(6, ts);
            
            sqlRs=pstm.executeUpdate();
            Map<String, Object> map = ActionContext.getContext().getSession();
            map.put("consumerName",consumerName);
            
            if(sqlRs==0)
            	//return ERROR;
            	System.out.println("xxxxxxxxxxxxxx3");
            else if(sqlRs==1){
            	System.out.println("xxxxxxxxxxxxxx4");
				writer.write("success");
				return null;
			}
            System.out.println("xxxxxxxxxxxxxx5");
			writer.write("failure");
            
         }
         catch(Exception e){
            e.printStackTrace();
         }
         finally{
            DbUtils.close(rs, pstm, conn);
		 }
	 
		return null;
	}
}
