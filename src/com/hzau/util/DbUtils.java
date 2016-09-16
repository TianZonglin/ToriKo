package com.hzau.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DbUtils {

	 private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
	 private static final String URL = "jdbc:mysql://localhost:3306/toriko";//?useUnicode=true&characterEncoding=utf-8
	 private static final String USER_NAME = "root";
	 private static final String PASSWORD = "";

	 public static Connection getConnection(){
		 Connection conn = null;
	     try {
			Class.forName(DRIVER_NAME);
			conn = DriverManager.getConnection(URL,USER_NAME,PASSWORD);     
		 } catch (Exception e) {
			e.printStackTrace();
		 }
		 return conn;
	 }
	 public static void close(ResultSet rs,PreparedStatement pstm,Connection co){    
		 try{
			 if(rs!=null){
				 rs.close();
			 }
			 if(pstm!=null){
				pstm.close();
			 }
			 if(co!=null){
				 co.close();
			 }	
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 } 	 
}
