/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.java.DB;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Date;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/insertEvent")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class insertEvent extends HttpServlet {
    /*
     create images folder at, C:\Users\PC Name\Documents\NetBeansProjects\ImageProject\build\web\images
     */

    public static final String UPLOAD_DIR = "event_images";
    public String dbFileName = "";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckAvailability</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckAvailability at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String title      = request.getParameter("title");
        String date       = request.getParameter("date");
        String time       = request.getParameter("time");
        String venue      = request.getParameter("venue");
        String para1      = request.getParameter("para1");
        String para2      = request.getParameter("para2");
        String para3      = request.getParameter("para3");
        String google_map = request.getParameter("google_map");
        String hashtag    = request.getParameter("hashtag");
        
        
        
        Part part = request.getPart("file");//
        String fileName = extractFileName(part);//file name

        /**
         * *** Get The Absolute Path Of The Web Application ****
         */
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String savePath = uploadPath + File.separator + fileName;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
        dbFileName = fileName;
        part.write(savePath + File.separator);
        //out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
        /*
         You need this loop if you submitted more than one file
         for (Part part : request.getParts()) {
         String fileName = extractFileName(part);
         part.write(savePath + File.separator + fileName);
         }*/
        try {
            Connection con = DB.getConnection();
            
            PreparedStatement pst = con.prepareStatement("INSERT INTO tbl_event(title, file, date, time, venue, para1, para2, para3, google_map, hashtag, added_on) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURDATE())");
            
            
            
            pst.setString(1, title);
            pst.setString(2, dbFileName);
            pst.setString(3, date);
            pst.setString(4, time);
            pst.setString(5, venue);
            pst.setString(6, para1);
            pst.setString(7, para2);
            pst.setString(8, para3);
            pst.setString(9, google_map);
            pst.setString(10, hashtag);
            
            pst.executeUpdate();
            out.println("<script language=\"Javascript\">"); 
            out.println("alert(\"Event Added Successfully into the database !\");"); 
            out.println("window.location = \"admin/addevent.jsp\";"); 
            out.println("</script>");

            } catch (Exception e) {
            out.println(e);
        }
    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
