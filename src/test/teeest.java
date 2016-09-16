package test;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class teeest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST); 
	    System.out.println(request.getSession().getServletContext().getRealPath(""));
		//File file = new File();//);  
	    //file.mkdirs(); 
	}

}
