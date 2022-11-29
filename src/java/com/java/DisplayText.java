package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DisplayText", urlPatterns = {"/DisplayText"})
public class DisplayText extends HttpServlet {
PrintWriter out;
public String departmentName,batchName;
public Connection con,con1;
public Statement st,st1;
public ResultSet rs,rs1;


@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out=response.getWriter();
        String department_id=request.getParameter("department_id");//parameters coming from ajax script
        System.out.println("department_id"+department_id);
        String batch_id=request.getParameter("batch_id");//parameters coming from ajax script
        System.out.println("batch_id"+batch_id);
        
        try
        {
            con=DB.getConnection();
            st=con.createStatement();
            rs=st.executeQuery("select departmentName from tbl_department where departmentId="+department_id+"");
            if(rs.next())
            {
                departmentName=rs.getString(1);
                System.out.println("departmentName"+departmentName);
            }
            con1=DB.getConnection();
            st1=con1.createStatement();
            rs1=st1.executeQuery("select * from tbl_batch where batchId="+batch_id+"");
            if(rs1.next())
            {
                batchName=rs1.getString(1);
            }
            
        }
        catch(Exception e)
        {
            out.println(e);
        }
        finally 
        {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) { /* ignored */}
            }
            if (st != null) {
                try {
                    st.close();
                } catch (Exception e) { /* ignored */}
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) { /* ignored */}
            }
            if (rs1 != null) {
                try {
                    rs1.close();
                } catch (Exception e) { /* ignored */}
            }
            if (st1 != null) {
                try {
                    st1.close();
                } catch (Exception e) { /* ignored */}
            }
            if (con1 != null) {
                try {
                    con1.close();
                } catch (Exception e) { /* ignored */}
            }
    }
 }
}
