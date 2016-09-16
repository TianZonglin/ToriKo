package com.hzau.action;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.hzau.util.DbUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CheckOrder extends ActionSupport{
	private String storeName = null;
	private String consumerName = null;
	private String orderId = null;
	
	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getConsumerName() {
		return consumerName;
	}

	public void setConsumerName(String consumerName) {
		this.consumerName = consumerName;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String execute() throws Exception{
		consumerName = URLDecoder.decode(consumerName , "utf-8"); 
		storeName = URLDecoder.decode(storeName , "utf-8"); 
		
		Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try{
            String order_company_table="order_company_" + storeName;
            String auto_company_table="auto_company_" + storeName;
            int number;
            
            conn = DbUtils.getConnection();
            
            String sql="select Number from ? where OrderId=?;";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, order_company_table);
            pstm.setInt(2, Integer.parseInt(orderId));
            rs=pstm.executeQuery();
            if(rs.next()){
            	number=rs.getInt("Number");
            	rs.close();
            	pstm.close();
            }
            else
            	return ERROR;
             
            String sql1="update ? set Number = Number + ? where OrderId=? ;";
            pstm = conn.prepareStatement(sql1);
            pstm.setString(1, auto_company_table);
            pstm.setInt(2, number);
            pstm.setInt(3, Integer.parseInt(orderId));
            int sqlRs=pstm.executeUpdate();
            if(sqlRs==0)
            	return ERROR;
            
            if( ( deleteOrder(consumerName, storeName, orderId))==ERROR )
            	return ERROR;
            //else
            	//return SUCCESS;
        }
        catch(Exception e){
        	e.printStackTrace();
        }
        finally{
            DbUtils.close(null, pstm, conn);
		}
        
        return SUCCESS;
	}
	public String deleteOrder(String consumerName, String storeName, String orderId) throws Exception{
        consumerName = URLDecoder.decode(consumerName , "utf-8"); 
        storeName = URLDecoder.decode(storeName , "utf-8"); 
       
        
        
		String auto_user_table="auto_consumer_"+ consumerName;
        String order_company_table="order_company_"+ storeName;
		

        
		Connection conn = null;
        PreparedStatement pstm = null;
        try{
        	String sql1="delete from ? where OrderId=? and StoreName=?;";
            conn = DbUtils.getConnection();
            pstm = conn.prepareStatement(sql1);
            pstm.setString(1, auto_user_table);
            pstm.setString(2, orderId);
            pstm.setString(3, storeName);
            int sqlRs=pstm.executeUpdate();
            if(sqlRs==0)
            	return ERROR;
            else if(sqlRs==1){
            	pstm.close();
            }
            
            String sql2="delete from ? where OrderId=?";
            pstm = conn.prepareStatement(sql2);
            pstm.setString(1, order_company_table);
            pstm.setString(2, orderId);
            sqlRs=pstm.executeUpdate();
            if(sqlRs==0)
            	return ERROR;
           
            	
        }
        catch(Exception e){
        	e.printStackTrace();
        }
        finally{
            DbUtils.close(null, pstm, conn);
		}
        return SUCCESS;
	}
	//ajax

	
	
	public String cancelorder() throws Exception{
	 
		PrintWriter writer = ServletActionContext.getResponse().getWriter();	
		
		storeName = URLDecoder.decode(storeName , "utf-8"); 
		consumerName = URLDecoder.decode(consumerName , "utf-8"); 
		
		String auto_user_table="auto_consumer_"+ consumerName;
        String order_company_table="order_company_"+ storeName;
		
		Connection conn = null;
        PreparedStatement pstm = null;
        try{
        	String sql1="delete from "+auto_user_table+" where ListId=? and StoreName=?;";
            conn = DbUtils.getConnection();
            pstm = conn.prepareStatement(sql1);
            //pstm.setString(1, auto_user_table);
            pstm.setString(1, orderId);
            pstm.setString(2, storeName);
            int sqlRs=pstm.executeUpdate();
            if(sqlRs==0){
            	System.out.println("sssssssssssssssssssssss1");
            	writer.write("failure");
            	return null;
            }
            else if(sqlRs==1){
            	pstm.close();
            }
            
            String sql2="delete from "+order_company_table+" where OrderId=?";
            pstm = conn.prepareStatement(sql2);
            //pstm.setString(1, order_company_table);
            pstm.setString(1, orderId);
            sqlRs=pstm.executeUpdate();
            if(sqlRs==0){
            	System.out.println("sssssssssssssssssssssss2");
            	writer.write("failure");
            	return null;
            }
           
            	
        }
        catch(Exception e){
        	e.printStackTrace();
        }
        finally{
            DbUtils.close(null, pstm, conn);
		}
        
    	writer.write("success");
     
    	return null;
      
	}
	public String checkorder() throws Exception{
		Map<String,Object> attribute = ActionContext.getContext().getSession();
		
		storeName = URLDecoder.decode(storeName , "utf-8"); 
		 
        String order_company_table="order_company_"+ storeName;
		
        String sql = "select * from "+order_company_table+";";
        
        ArrayList<Integer> storderid = new ArrayList<Integer>();
        ArrayList<String> stfoodname = new ArrayList<String>();
        ArrayList<Integer> stnumber = new ArrayList<Integer>();  
        ArrayList<Integer> stprice = new ArrayList<Integer>();
        ArrayList<String> stconsumername = new ArrayList<String>();
        ArrayList<String> stconsumertel = new ArrayList<String>();
        ArrayList<Timestamp> stordertime = new ArrayList<Timestamp>();
  
        
		Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try{
        	
            conn = DbUtils.getConnection();
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while(rs.next()){
                storderid.add(rs.getInt("OrderId"));
                stfoodname.add(rs.getString("FoodName"));
                stnumber.add(rs.getInt("Number")); 
                stprice.add(rs.getInt("Price"));
                stconsumername.add(rs.getString("ConsumerName"));
                stconsumertel.add(rs.getString("ConsumerTel"));
                stordertime.add(rs.getTimestamp("OrderTime"));   	

            }
            attribute.put("storderid", storderid);
            attribute.put("stfoodname", stfoodname);
            attribute.put("stnumber", stnumber);
            attribute.put("stprice", stprice);
            attribute.put("stconsumername", stconsumername);
            attribute.put("stconsumertel", stconsumertel);
            attribute.put("stordertime", stordertime);
           
            	
        }
        catch(Exception e){
        	e.printStackTrace();
        }
        finally{
            DbUtils.close(null, pstm, conn);
		}
        
     
    	return SUCCESS;
      
	}
}
