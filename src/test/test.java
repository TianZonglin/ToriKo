package test;



import com.opensymphony.xwork2.ActionSupport;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.ResultSet;
import java.util.ArrayList;


import org.apache.struts2.ServletActionContext;


@SuppressWarnings("serial")
public class test extends ActionSupport{
	 private String name;  
	  
	 public String getName(){
		 System.out.println(this.name);
		 return this.name;
	 }	
	 public void setName(String name){
		
		 this.name = name;
	 }
	 /**
	 * @param args
	 */
	 public String execute() throws Exception{
		 
		//Map<String,Object> attribute = ActionContext.getContext().getSession();
		ArrayList<String> post = new ArrayList<String>();
		//post.add((String)attribute.get("user"));	
		name = URLDecoder.decode(name , "utf-8");//¹Ø¼ü´úÂë
		String sql = "select user from onetable where `user` = '"+name+"';";
		System.out.println(sql);
		DbBean db = new DbBean();
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		try{
			
			ResultSet rs = db.executeQuery(sql);
			while(rs.next()){
				post.add(rs.getString(1));
				writer.write("success");
				return null;
			}
			writer.write("failure");
		}catch(Exception e){
			e.printStackTrace();	
		}
		return null;
	 }

}
