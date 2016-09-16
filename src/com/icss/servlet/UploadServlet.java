package com.icss.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import com.hzau.util.DbUtils;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
public class UploadServlet extends HttpServlet {
	 
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//乱码处理
        request.setCharacterEncoding("utf-8");
        
        String username  = request.getParameter("username");
        
        
        String returnstr = request.getContextPath()+ "/uploadimages/"+ username + "/" ;   
        
        
        System.out.println(">>>>>>>>>>>>>>>>>>>>>."+returnstr);
        //工程所在服务器路径
        String realPath = getServletContext().getRealPath("/") ;
        //上传附件的存放路径
        String uploadPath = realPath + "uploadimages/"+ username + "/";
        
        
        System.out.println(uploadPath);
      /*  //如果该文件夹不存在，则新建
        File file = new File(uploadPath);   
        if (!file.isDirectory()) {   
            file.mkdirs();   
        } */
        //文件读写操作流
        BufferedInputStream in = null;
        BufferedOutputStream outStream = null;
        
        DiskFileItemFactory fac = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fac);
        upload.setHeaderEncoding("utf-8");   
        //解析请求request中的表单字段
        try{
        	List<Object> fileList = upload.parseRequest(request);
 	        Iterator<Object> it = fileList.iterator();
 	        while(it.hasNext()){
 	        	Object file=it.next();
		        //如果item的类型是DiskFileItem
		        if(file instanceof DiskFileItem){ 
		        	//强制转型为DiskFileItem
		        	DiskFileItem fileItem = (DiskFileItem) file;
		            //如果是一个type="file"的表单控件，则进入if块执行附件上传
		            if (!fileItem.isFormField()){
		            	//上传图片
		            	System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxx");
		            	Date date = new Date(System.currentTimeMillis()); 
		            	String strDate = new SimpleDateFormat("yyyyMMddmmss").format(date);
		            	int random=(int)(Math.random()*99);
		            	
		            	int lastLength=fileItem.getName().lastIndexOf('.');
		            	String type = fileItem.getName().substring(lastLength);
		            	//System.out.println(type);
		            	String imageName= strDate + random + type;
		            	//System.out.println(imageName);
		            	
		            	//上传的文件全路径，包括文件名
		        		String ServerPath = uploadPath + imageName;
		        		
		        		
		         
		        		//System.out.println(ServerPath);
		        		request.setAttribute("path",ServerPath);
		        		//拷贝文件到服务器
		        		in = new BufferedInputStream(fileItem.getInputStream());
		        		outStream = new BufferedOutputStream(new FileOutputStream(new File(ServerPath)));
		        		Streams.copy(in, outStream, true);
		        		
		        	     
		        		returnstr = returnstr + imageName;
		        		//ServerPath = URLEncoder.encode( ServerPath,"utf-8");//ServerPath = URLEncoder.encode( ServerPath,"utf-8");
		        		response.getWriter().write(returnstr);
		           	}
		            else{
		            	System.out.println("false1");
		            }
		        }
		        else{
		        	System.out.println("false2");
		        }
 	        }
        }
        catch(Exception e){
        	e.printStackTrace();
        }
	}

}

/*
try {
	//处理附件
    DiskFileItemFactory fac = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(fac);
    upload.setHeaderEncoding("utf-8");   
    //解析请求request中的表单字段
    List<Object> fileList = upload.parseRequest(request);
    Iterator<Object> it = fileList.iterator();
    //迭代所有的表单字段
    while (it.hasNext()) {
    	Object item = it.next(); 
    	if(item instanceof DiskFileItem){ 
    		DiskFileItem fileItem = (DiskFileItem) item;
    		//如果是一个type="file"的表单控件，则进入if块执行附件上传
        	if (!fileItem.isFormField()) {
        		//获取选择的文件名，带后缀
        		String filename = fileItem.getName();
        		//上传的文件全路径，包括文件名
    			String fileUploadPath = uploadPath + filename;
    			//拷贝文件到服务器
    			in = new BufferedInputStream(fileItem.getInputStream());
    			outStream = new BufferedOutputStream(new FileOutputStream(new File(fileUploadPath)));
    			Streams.copy(in, outStream, true);
    			//将反馈信息回写到前台
    			response.getWriter().write(filename);
        	}
    	}
    }
    
}
*/