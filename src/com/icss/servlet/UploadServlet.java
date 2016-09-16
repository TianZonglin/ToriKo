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
		//���봦��
        request.setCharacterEncoding("utf-8");
        
        String username  = request.getParameter("username");
        
        
        String returnstr = request.getContextPath()+ "/uploadimages/"+ username + "/" ;   
        
        
        System.out.println(">>>>>>>>>>>>>>>>>>>>>."+returnstr);
        //�������ڷ�����·��
        String realPath = getServletContext().getRealPath("/") ;
        //�ϴ������Ĵ��·��
        String uploadPath = realPath + "uploadimages/"+ username + "/";
        
        
        System.out.println(uploadPath);
      /*  //������ļ��в����ڣ����½�
        File file = new File(uploadPath);   
        if (!file.isDirectory()) {   
            file.mkdirs();   
        } */
        //�ļ���д������
        BufferedInputStream in = null;
        BufferedOutputStream outStream = null;
        
        DiskFileItemFactory fac = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fac);
        upload.setHeaderEncoding("utf-8");   
        //��������request�еı��ֶ�
        try{
        	List<Object> fileList = upload.parseRequest(request);
 	        Iterator<Object> it = fileList.iterator();
 	        while(it.hasNext()){
 	        	Object file=it.next();
		        //���item��������DiskFileItem
		        if(file instanceof DiskFileItem){ 
		        	//ǿ��ת��ΪDiskFileItem
		        	DiskFileItem fileItem = (DiskFileItem) file;
		            //�����һ��type="file"�ı��ؼ��������if��ִ�и����ϴ�
		            if (!fileItem.isFormField()){
		            	//�ϴ�ͼƬ
		            	System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxx");
		            	Date date = new Date(System.currentTimeMillis()); 
		            	String strDate = new SimpleDateFormat("yyyyMMddmmss").format(date);
		            	int random=(int)(Math.random()*99);
		            	
		            	int lastLength=fileItem.getName().lastIndexOf('.');
		            	String type = fileItem.getName().substring(lastLength);
		            	//System.out.println(type);
		            	String imageName= strDate + random + type;
		            	//System.out.println(imageName);
		            	
		            	//�ϴ����ļ�ȫ·���������ļ���
		        		String ServerPath = uploadPath + imageName;
		        		
		        		
		         
		        		//System.out.println(ServerPath);
		        		request.setAttribute("path",ServerPath);
		        		//�����ļ���������
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
	//������
    DiskFileItemFactory fac = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(fac);
    upload.setHeaderEncoding("utf-8");   
    //��������request�еı��ֶ�
    List<Object> fileList = upload.parseRequest(request);
    Iterator<Object> it = fileList.iterator();
    //�������еı��ֶ�
    while (it.hasNext()) {
    	Object item = it.next(); 
    	if(item instanceof DiskFileItem){ 
    		DiskFileItem fileItem = (DiskFileItem) item;
    		//�����һ��type="file"�ı��ؼ��������if��ִ�и����ϴ�
        	if (!fileItem.isFormField()) {
        		//��ȡѡ����ļ���������׺
        		String filename = fileItem.getName();
        		//�ϴ����ļ�ȫ·���������ļ���
    			String fileUploadPath = uploadPath + filename;
    			//�����ļ���������
    			in = new BufferedInputStream(fileItem.getInputStream());
    			outStream = new BufferedOutputStream(new FileOutputStream(new File(fileUploadPath)));
    			Streams.copy(in, outStream, true);
    			//��������Ϣ��д��ǰ̨
    			response.getWriter().write(filename);
        	}
    	}
    }
    
}
*/